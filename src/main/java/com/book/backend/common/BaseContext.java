package com.book.backend.common;

import io.swagger.annotations.ApiModelProperty;

/**
 * 基于ThreadLocal封装工具类，用于保存和获取当前登录用户id
 */
public class BaseContext {
    private static  ThreadLocal<Long> threadLocal = new ThreadLocal<>();

    @ApiModelProperty(value = "保存当前登录用户id")
    public static void setCurrentId(Long id){
        threadLocal.set(id);
    }

    @ApiModelProperty(value = "获取当前登录用户id")
    public static Long getCurrentId(){
        return threadLocal.get();
    }
}
