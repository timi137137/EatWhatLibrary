package com.book.backend.pojo;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import lombok.Data;

/**
 * @TableName t_users
 */
@Data
@TableName(value ="t_users")
public class Users implements Serializable {

    /**
     * 用户表的唯一标识
     */
    @TableId(type = IdType.AUTO)
    private Integer userId;

    /**
     * 用户名
     */
    private String username;

    /**
     * 密码哈希值
     */
    private String password;

    /**
     * 加密盐值
     */
    private String salt;

    /**
     * 真实姓名
     */
    private String cardName;

    /**
     * 借阅证编号 固定11位随机生成 非空
     */
    private Long cardNumber;

    /**
     * 规则编号 可以自定义也就是权限功能
     */
    private Integer ruleNumber;

    /**
     * 1表示可用 0表示禁用
     */
    private Integer status;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private String createTime;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private String updateTime;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    public String getPassword() {
        return password;
    }

    /**
     * 设置密码并使用 BCryptPasswordEncoder 对其进行加密处理
     *
     * @param password 明文密码
     */
    public void setPassword(String password) {
        this.password = password;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }
}
