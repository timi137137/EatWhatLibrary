package com.book.backend.common;

import io.swagger.annotations.ApiModelProperty;

/**
 * 常量类
 * 防止魔法值
 */
public class Constant {

    @ApiModelProperty(value = "字符串NULL判断")
    public  static final String NULL = "null";

    @ApiModelProperty(value = "预检请求")
    public static final String OPTIONS = "OPTIONS";

    @ApiModelProperty(value = "账号为可用状态")
    public static final Integer  AVAILABLE = 1;

    @ApiModelProperty(value = "账号为禁用状态")
    public static final Integer DISABLE = 0;

    @ApiModelProperty(value = "图书已借出状态")
    public static final String BOOKDISABLE = "已借出";

    @ApiModelProperty(value = "图书未借出状态")
    public static final String BOOKAVAILABLE = "未借出";

    @ApiModelProperty(value = "用户可用状态 字符串")
    public static  final String USERAVAILABLE = "可用";

    @ApiModelProperty(value = "用户禁用状态 字符串")
    public static final String USERDISABLE = "禁用";
}