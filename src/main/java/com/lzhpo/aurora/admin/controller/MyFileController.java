package com.lzhpo.aurora.admin.controller;

import com.lzhpo.aurora.admin.annotation.Operation;
import com.lzhpo.aurora.admin.entity.DownLoadLog;
import com.lzhpo.aurora.admin.entity.MyFile;
import com.lzhpo.aurora.admin.entity.User;
import com.lzhpo.aurora.admin.service.DownLoadLogService;
import com.lzhpo.aurora.admin.service.MyFileService;
import com.lzhpo.aurora.admin.util.LayuiData;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
@Controller
@RequestMapping("/admin/tool")
public class MyFileController {

    private Logger logger = LoggerFactory.getLogger(MyFileController.class);

    /**
     * 保存文件的文件夹
     */
    private String UPLOAD_FILE_PATH = "src/main/resources/static/upLoadFile/";

    /**
     * 相对路径，对于本项目来说。保存到数据库的路径。
     */
    private String UPLOAD_FILE_PATH_MYSQL = "http://localhost:8080/upLoadFile/";


    @Autowired
    private MyFileService myFileService;

    @Autowired
    private DownLoadLogService downLoadLogService;


    @RequestMapping("/file")
    @RequiresPermissions(value = "file:look")
    @Operation(value = "进入文件管理页面")
    public String file(){
        return "admin/tool/myfile";
    }

    /**
     * 文件列表
     */
    @RequestMapping("/file/list")
    @ResponseBody
    @Operation(value = "查询文件列表")
    public LayuiData fileList(HttpServletRequest request){
        LayuiData layuiData = new LayuiData();
        int page = Integer.parseInt(request.getParameter("page"));
        int limit = Integer.parseInt(request.getParameter("limit"));
        int start = (page - 1) * limit;
        int fileCount = myFileService.fileCount();
        layuiData.setCount(fileCount);
        String file_name = request.getParameter("file_name");
        if (file_name == null || file_name == ""){
            List<MyFile> filePage = myFileService.findFilePage(start, limit);
            layuiData.setData(filePage);
        } else {
            List<MyFile> likeName = myFileService.findLikeName(file_name);
            layuiData.setData(likeName);
        }
        return layuiData;
    }

    /**
     * 上传文件
     * @param file
     * @return
     */
    @RequestMapping(value = "/file/uploadFile")
    @ResponseBody
    @Operation(value = "上传文件")
    public LayuiData uploadImage(@RequestParam("file") MultipartFile file) {
        logger.info("【开始上传文件...】");
        LayuiData layuiData = new LayuiData();
        if (!file.isEmpty()) {
            try {
                BufferedOutputStream out = new BufferedOutputStream(
                        new FileOutputStream(
                                new File(UPLOAD_FILE_PATH, Objects.requireNonNull(file.getOriginalFilename()))
                        )
                );
                logger.info("【out：" +file.getOriginalFilename() +"】");
                out.write(file.getBytes());
                out.flush();
                out.close();
            } catch (IOException e) {
                layuiData.setCode(-1);
                layuiData.setMsg("上传失败！");
                return layuiData;
            }
            layuiData.setMsg("上传成功！");
            //将文件信息保存到数据库
            MyFile fileTo = new MyFile();
            fileTo.setFile_name(file.getOriginalFilename());
            logger.info("【保存到数据库的路径：" +UPLOAD_FILE_PATH_MYSQL +"】");
            fileTo.setFile_path(UPLOAD_FILE_PATH_MYSQL + file.getOriginalFilename());
            long firstSize = file.getSize();
            DecimalFormat df = new DecimalFormat("0.000000"); //保存6位小数
            String str = df.format((float) firstSize / 1014000); //转换为MB
            Double size = new Double(str);
            logger.info("【文件大小：" +size +"】");
            fileTo.setFile_size(size);
            logger.info("【文件信息：" +fileTo);
            myFileService.saveFile(fileTo);
            logger.info("【上传文件成功】");
            return layuiData;
        } else {
            return null;
        }
    }


    /**
     * 根据id删除一个文件
     */
    @RequestMapping("/file/deleteOne")
    @ResponseBody
    @Operation(value = "删除文件")
    public LayuiData deleteOne(HttpServletRequest request){
        LayuiData layuiData = new LayuiData();
        int file_id = Integer.parseInt(request.getParameter("file_id"));
        String file_name = request.getParameter("file_name");
        logger.info("【开始删除file_id为：" +file_id +"的文件】");
        File file = new File(UPLOAD_FILE_PATH +file_name);
        try {
            myFileService.deleteOne(file_id); //数据库删除此文件
            file.delete(); //文件储存目录删除此文件
            logger.info("【删除成功】");
            layuiData.setMsg("删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("【删除失败】");
            layuiData.setCode(-1);
            layuiData.setMsg("删除失败！");
        }
        return layuiData;
    }

    /**
     * 批量删除
     */
    @RequestMapping("/file/batchDel")
    @ResponseBody
    @Operation(value = "批量删除文件")
    public LayuiData batchDel(HttpServletRequest request){
        LayuiData layuiData = new LayuiData();
        String ids = request.getParameter("ids");
        String file_name = request.getParameter("file_name");
        String[] split = ids.split(",");
        String[] file_nameSplit = file_name.split(",");
        //删除文件夹目录的文件
        try {
            for (int i = 0; i < file_nameSplit.length; i++) {
                File file = new File(UPLOAD_FILE_PATH +file_nameSplit[i]);
                file.delete();
            }
            logger.info("【在文件目录中删除成功】");
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("【在文件目录中删除失败】");
        }
        //删除数据库存储的文件信息
        try {
            myFileService.batchDel(split);
            layuiData.setMsg("删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            layuiData.setCode(-1);
            layuiData.setMsg("删除失败！");
        }
        return layuiData;
    }

    /**
     * 下载文件，同时保存下载记录到数据库
     *
     * 根据id下载文件（不用字节流，用字符流！！！）
     *
     * 原因在字节流操作和字符流操作的区别：
     * 字符流主要针对一些文本文档（比字节流操作的效率要高），比如.txt、.doc，而pdf就不行。
     * 字节流几乎可以对任何文件类型进行操作，主要是对非文件类型的，如媒体文件（音频，视频，图片…）。
     */
    @RequestMapping("/file/downLoadOne/{file_name}")
    @Operation(value = "用户下载文件")
    public void downloadFileAction(HttpServletRequest request, HttpServletResponse response, @PathVariable("file_name") String file_name) {
        logger.info("【下载文件开始...】");
        response.setCharacterEncoding(request.getCharacterEncoding());
        response.setContentType("application/octet-stream");
        BufferedInputStream fis = null;
        String fileToPath = UPLOAD_FILE_PATH +file_name;
        logger.info("需要下载的文件为：" +fileToPath);
        try {
            File file = new File(fileToPath); //需要下载的文件
            fis = new BufferedInputStream(new FileInputStream(file));
            response.setHeader("Content-Disposition", "attachment; filename="+file.getName());
            IOUtils.copy(fis,response.getOutputStream());
            response.flushBuffer();
            logger.info("【下载文件成功】");
            /**
             * 保存下载记录到数据库
             */
            DownLoadLog downLoadLog = new DownLoadLog();
            downLoadLog.setFile_name(file_name);
            downLoadLog.setDllog_date(new Date());
            User user = (User) SecurityUtils.getSubject().getPrincipal(); //获取操作的用户名
            downLoadLog.setUsername(user.getUsername());
            downLoadLogService.addDlLog(downLoadLog);
        } catch (IOException e) {
            logger.info("【下载文件失败】");
            e.printStackTrace();
        } finally {
            if (fis != null) {
                try {
                    fis.close();
                } catch (IOException e) {
                    logger.info("【下载文件失败】");
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * 下载记录查询
     */
    @RequestMapping("/file/dllog/list")
    @ResponseBody
    @Operation(value = "下载记录查询")
    public LayuiData dllogList(HttpServletRequest request){
        LayuiData layuiData = new LayuiData();
        //当前页数
        int page = Integer.valueOf(request.getParameter("page"));
        //显示页数
        int limit = Integer.valueOf(request.getParameter("limit"));
        //起始页数
        int start = (page - 1) * limit;
        int dllogCount = downLoadLogService.dllogCount();
        layuiData.setCount(dllogCount);
        String file_name = request.getParameter("file_name");
        if (file_name == null || file_name == ""){
            List<DownLoadLog> downLoadLogList = downLoadLogService.findAll(start, limit);
            layuiData.setData(downLoadLogList);
        } else {
            List<MyFile> fileLikeName = downLoadLogService.findFileLikeName(file_name);
            layuiData.setData(fileLikeName);
        }
        return layuiData;
    }

    /**
     * 修改文件名
     */
    @RequestMapping("/file/updateFileName")
    @ResponseBody
    @Operation(value = "修改文件名")
    public LayuiData updateFileName(MyFile myFile){
        LayuiData layuiData = new LayuiData();
        try {
            myFileService.updateFile(myFile);
            layuiData.setMsg("更新文件名成功！");
        } catch (Exception e) {
            e.printStackTrace();
            layuiData.setCode(-1);
            layuiData.setMsg("更新文件名失败！");
        }
        return layuiData;
    }

    /**
     * 删除单个下载记录
     * @param request
     * @return
     */
    @RequestMapping("/file/delDllog")
    @ResponseBody
    @Operation(value = "删除下载记录")
    public LayuiData delDllog(HttpServletRequest request){
        LayuiData layuiData = new LayuiData();
        String dllog_id = request.getParameter("dllog_id");
        try {
            downLoadLogService.delDllog(Integer.parseInt(dllog_id));
            layuiData.setMsg("删除成功！");
        } catch (NumberFormatException e) {
            e.printStackTrace();
            layuiData.setCode(-1);
            layuiData.setMsg("删除失败！");
        }
        return layuiData;
    }

    /**
     * 批量删除
     * @param request
     * @return
     */
    @RequestMapping("/file/batchDelDllog")
    @ResponseBody
    @Operation(value = "批量删除下载记录")
    public LayuiData batchDelDllog(HttpServletRequest request){
        LayuiData layuiData = new LayuiData();
        String dllogIds = request.getParameter("dllogIds");
        String[] dllogIdsSplit = dllogIds.split(",");
        try {
            downLoadLogService.batchDelDllog(dllogIdsSplit);
            layuiData.setMsg("删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            layuiData.setCode(-1);
            layuiData.setMsg("删除失败！");
        }
        return layuiData;
    }

}
