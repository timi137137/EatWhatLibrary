package com.book.backend.common;

import lombok.Data;
import java.util.HashMap;

@Data
public class R<T> {

    /**
     * 响应状态码
     * | 200  | OK                    | 请求成功
     * | 201  | CREATED               | 创建成功
     * | 204  | DELETED               | 删除成功
     * | 400  | BAD REQUEST           | 请求的地址不存在或者包含不支持的参数
     * | 401  | UNAUTHORIZED          | 未授权
     * | 403  | FORBIDDEN             | 被禁止访问
     * | 404  | NOT FOUND             | 请求的资源不存在
     * | 422  | Unprocesable entity   | [POST/PUT/PATCH] 当创建一个对象时，发生一个验证错误
     * | 500  | INTERNAL SERVER ERROR | 内部错误
     */
    private Integer status;

    /**
     * 返回给前端的自定义信息
     */
    private String msg;

    /**
     * 前端发送请求所需要接受到的真实数据
     */
    private T data;

    /**
     * 动态数据
     */
    private HashMap<String, Object> map = new HashMap<>();

    /**
     * 注册成功后的响应方法
     * @param message 响应消息
     * @return R<String>
     */
    public static <T> R<String> register(String message) {
        R<String> r = new R<>();
        r.setStatus(200);
        r.setMsg(message);
        r.setData(null);
        return r;
    }

    /**
     * 注册失败后的响应方法
     * @param message 错误消息
     * @return R<String>
     */
    public static <T> R<String> failed(String message) {
        R<String> r = new R<>();
        r.setStatus(500);
        r.setMsg(message);
        r.setData(null);
        return r;
    }

    /**
     * 自定义类型的添加 加入到动态数据 HashMap 中
     * @param key string
     * @param value Object
     * @return R<T>
     */
    public R<T> add(String key, Object value) {
        this.map.put(key, value);
        return this;
    }

    /**
     * 成功响应
     * @param object 响应对象
     * @param message 响应消息
     * @param <T> 类型参数
     * @return R<T>
     */
    public static <T> R<T> success(T object, String message) {
        R<T> r = new R<>();
        r.setStatus(200);
        r.setMsg(message);
        r.setData(object);
        return r;
    }

    /**
     * 失败响应
     * @param msg 错误消息
     * @param <T> 类型参数
     * @return R<T>
     */
    public static <T> R<T> error(String msg) {
        R<T> r = new R<>();
        r.setStatus(500);
        r.setMsg(msg);
        return r;
    }

    /**
     * 失败响应
     * @param msg 错误消息
     * @param code 状态码
     * @param <T> 类型参数
     * @return R<T>
     */
    public static <T> R<T> error(String msg, int code) {
        R<T> r = new R<>();
        r.setStatus(code);
        r.setMsg(msg);
        return r;
    }
}
