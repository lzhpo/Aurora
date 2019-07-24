package com.lzhpo.aurora.admin.util;

import java.util.HashMap;
import java.util.Map;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
public class ResponseBo extends HashMap<String, Object> {

    public ResponseBo() {
        put("code", 0);
        put("msg", "操作成功");
    }

    public static ResponseBo error() {
        return error(1, "操作失败");
    }

    public static ResponseBo error(String msg) {
        return error(500, msg);
    }

    public static ResponseBo error(int code, String msg) {
        ResponseBo ResponseBo = new ResponseBo();
        ResponseBo.put("code", code);
        ResponseBo.put("msg", msg);
        return ResponseBo;
    }

    public static ResponseBo ok(String msg) {
        ResponseBo ResponseBo = new ResponseBo();
        ResponseBo.put("msg", msg);
        return ResponseBo;
    }

    public static ResponseBo ok(Map<String, Object> map) {
        ResponseBo ResponseBo = new ResponseBo();
        ResponseBo.putAll(map);
        return ResponseBo;
    }

    public static ResponseBo ok() {
        return new ResponseBo();
    }

    @Override
    public ResponseBo put(String key, Object value) {
        super.put(key, value);
        return this;
    }
}