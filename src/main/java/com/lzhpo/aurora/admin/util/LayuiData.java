package com.lzhpo.aurora.admin.util;

import lombok.Data;
import java.util.List;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：
 * Layui数据格式化
 * </p>
 */
@Data
public class LayuiData {

    private Integer code = 0;
    private Integer count;
    private List data;
    private String msg = "";

}
