package com.lzhpo.aurora.admin.controller;

import com.lzhpo.aurora.admin.annotation.Operation;
import com.lzhpo.aurora.admin.entity.BlogArticle;
import com.lzhpo.aurora.admin.entity.BlogTag;
import com.lzhpo.aurora.admin.entity.BlogType;
import com.lzhpo.aurora.admin.es.repository.BlogArticleRepository;
import com.lzhpo.aurora.admin.es.service.ESBlogArticleService;
import com.lzhpo.aurora.admin.service.BlogArticleService;
import com.lzhpo.aurora.admin.service.BlogTagService;
import com.lzhpo.aurora.admin.service.BlogTypeService;
import com.lzhpo.aurora.admin.util.LayuiData;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
@Controller
@RequestMapping("/admin/blog")
public class BlogArticleController {

    private Logger logger = LoggerFactory.getLogger(BlogArticleController.class);

    @Autowired
    private BlogArticleService blogArticleService;

    @Autowired
    private BlogTypeService blogTypeService;

    @Autowired
    private BlogTagService blogTagService;

    @Autowired
    private BlogArticleRepository blogArticleRepository;

    @Autowired
    private ESBlogArticleService esBlogArticleService;

    /**
     * 是否开启ES？搜索文章内容
     */
    @Value("${ES.Enable}")
    private Boolean ESEnable;

    /**
     * 博客列表页面跳转
     */
    @RequestMapping("/blogArticle")
    @RequiresPermissions(value = "blogArticle:look")
    @Operation(value = "进入查看博客列表页面")
    public String blogList(){
        return "admin/blog/blogArticle";
    }

    /**
     * 博客新建页面
     *
     * 将分类的数据放在HttpSession中，以便于在修改博客的时候，文章的分类和标签不是空的，才能取到值。
     * 如果是Model中，在修改博客的时候就取不到值！
     *
     * HttpSession作用域：
     * 针对一次会话，使用该对象保存数据，数据保存在服务器上，一次会话（多个请求）内数据有效，如果关闭一次浏览器，结束这次回话，再次打开的时候session就失效了。
     *
     * 创建时间：服务器第一次调用getSession()方法的时候，服务器创建session对象。
     *
     * 销毁时间：销毁有三种情况
     *
     * （1）服务器非正常关闭（正常关闭时：Session被序列化）；
     *
     * （2）：Session过期，xml文件配置默认时间是30分钟。
     *
     * （3）：手动调用Session的invalidate的方法。
     */
    @RequestMapping("/addBlogPage")
    @Operation(value = "进入发布博客页面")
    public String blogAdd(HttpSession session){
        List<BlogType> blogTypes = blogTypeService.selectAll();
        logger.info("【blogTypes(Session)：" +blogTypes +"】");
        List<BlogTag> blogTags = blogTagService.selectAll();
        logger.info("【blogTags(Session)：" +blogTags +"】");
        session.setAttribute("blogTypes", blogTypes);
        session.setAttribute("blogTags", blogTags);
        return "admin/blog/addBlog";
    }

    /**
     * 查询博客列表，分页查询
     */
    @RequestMapping("/blogArticle/selectByLimit")
    @ResponseBody
    @Operation(value = "查询博客列表")
    public LayuiData selectByLimit(HttpServletRequest request){
        LayuiData layuiData = new LayuiData();
        //显示条数
        int limit = Integer.parseInt(request.getParameter("limit"));
        //当前页数
        int page = Integer.parseInt(request.getParameter("page"));
        //起始页
        int start = (page -1) * limit;
        //判断后台是否是根据博客内容模糊查询
        String content = request.getParameter("content");
        /**
         * 是否开启ES搜索文章内容，如果未开启将使用默认的MySQL检索文章内容！
         */
        if (ESEnable){ /** 开启ES **/
            logger.info("【已启用ElasticSearch，将使用ElasticSearch检索文章内容！】");
            Sort sort = new Sort(Sort.Direction.ASC, "blogId"); //排序规则：根据blogId排序。
            //注意PageRequest.of(page - 1, limit, sort)中的：第一个参数是当前页数！！！，第二个参数是每页显示的数量，第三个参数是排序规则。
            Pageable pageable = PageRequest.of(page - 1, limit, sort);
            if (content == null || content == ""){ //前端没有指定文章内容搜索
                List<BlogArticle> articleServiceAll = esBlogArticleService.findAll(pageable); //分页查询所有文章内容
                layuiData.setData(articleServiceAll);
                Integer countAll = esBlogArticleService.countAll(); //文章总数
                layuiData.setCount(countAll);
            } else { //前端指定文章内容搜索
                List<BlogArticle> allByContent = esBlogArticleService.findAllByContent(content, pageable); //根据文章内容分页查询文章内容
                layuiData.setData(allByContent);
                Integer countAllByContent = esBlogArticleService.countAllByContent(content); //根据文章内容查询文章内容的总条数
                layuiData.setCount(countAllByContent);
            }
        } else { /** 未开启ES **/
            logger.info("【未开启ES，将使用默认的MySQL检索文章内容！】");
            if (content == null || content == ""){
                //数据库总记录数
                int count = blogArticleService.count();
                layuiData.setCount(count);
                List<BlogArticle> blogArticles = blogArticleService.selectByLimit(start, limit);
                System.out.println(blogArticles);
                layuiData.setData(blogArticles);
            } else {
                List<BlogArticle> blogArticles = blogArticleService.selectByLikeContent(content, start, limit);
                layuiData.setCount(blogArticleService.countByLikeContent(content));
                layuiData.setData(blogArticles);
            }
        }
        return layuiData;
    }

    /**
     * 发布文章：同时保存到MySQL和ES中。
     */
    @RequestMapping("/blogArticle/add")
    @ResponseBody
    @Operation(value = "发布博客")
    public LayuiData addArticle(BlogArticle blogArticle){
        LayuiData layuiData = new LayuiData();
        System.out.println("blogArticle: " +blogArticle);
        try {
            blogArticle.setCreateDate(new Date());
            blogArticleService.addBlog(blogArticle);
            layuiData.setMsg("发布成功！");
            /** 将发布的文章保存到ES中 **/
            blogArticleRepository.save(blogArticle);
            logger.info("【数据{}保存到ES成功！】", blogArticle);
        } catch (Exception e) {
            e.printStackTrace();
            layuiData.setCount(-1);
            layuiData.setMsg("发布失败！");
        }
        return layuiData;
    }

    /**
     * 删除单个文章：同时删除ES中的和MySQL中的。
     */
    @RequestMapping("/blogArticle/delBlog")
    @ResponseBody
    @Operation(value = "删除博客")
    public LayuiData delBlog(HttpServletRequest request){
        LayuiData layuiData = new LayuiData();
        int blogId = Integer.parseInt(request.getParameter("blogId"));
        try {
            blogArticleService.delBlog(blogId);
            layuiData.setMsg("删除成功！");
            /** 删除ES中的 **/
            blogArticleRepository.deleteById(blogId);
        } catch (Exception e) {
            e.printStackTrace();
            layuiData.setCode(-1);
            layuiData.setMsg("删除失败！");
        }
        return layuiData;
    }

    /**
     * 批量删除：同时删除ES中的和MySQL中的。
     */
    @RequestMapping("/blogArticle/batchDel")
    @ResponseBody
    @Operation(value = "批量删除博客")
    public LayuiData batchDel(HttpServletRequest request){
        LayuiData layuiData = new LayuiData();
        String ids = request.getParameter("ids");
        String[] splitIds = ids.split(",");
        try {
            blogArticleService.batchDelBlog(splitIds);
            layuiData.setMsg("删除成功！");
            /** 删除ES中的 **/
            for (String splitId : splitIds) {
                blogArticleRepository.deleteById(Integer.parseInt(splitId));
            }
        } catch (Exception e) {
            e.printStackTrace();
            layuiData.setMsg("删除失败！");
        }
        return layuiData;
    }

    /**
     * 修改博客前的回显中转
     *      前端传入一个blogId查询数据库的数据，然后放入session中，BlogArticle一定要序列化，才能通过session获取值
     *      前端通过session获取数据回显在修改文章的页面(添加文章的页面)，共用一个页面。
     */
    @RequestMapping("/blogArticle/editBlogView/{blogId}")
    @Operation(value = "进入修改博客页面")
    public ModelAndView editBlog(@PathVariable("blogId") String blogId){
        BlogArticle blogArticle = blogArticleService.selectById(Integer.parseInt(blogId));
        logger.info("【回显文章：" +blogArticle);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/blog/addBlog");
        modelAndView.addObject("blogArticle",blogArticle);
        return modelAndView;
    }

    /**
     * 修改博客：同时修改MySQL中的和ES中的。
     */
    @RequestMapping("/blogArticle/editBlog")
    @ResponseBody
    @Operation(value = "修改博客")
    public LayuiData editBlog(BlogArticle blogArticle){
        LayuiData layuiData = new LayuiData();
        try {
            blogArticleService.updateBlog(blogArticle);
            layuiData.setMsg("修改成功！");
            /** 修改博客，更新ES中的此条博客数据，存在主键即可 **/
            blogArticleRepository.save(blogArticle);
        } catch (Exception e) {
            e.printStackTrace();
            layuiData.setCode(-1);
            layuiData.setMsg("修改失败！");
        }
        return layuiData;
    }

}
