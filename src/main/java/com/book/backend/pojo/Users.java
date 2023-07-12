package com.book.backend.pojo;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * @TableName t_users
 */
@TableName(value ="t_users")
@Data
public class Users implements Serializable {
    @ApiModelProperty(value = "用户表的唯一标识")
    @TableId(type = IdType.AUTO)
    private Integer userId;

    @ApiModelProperty(value = "用户名", example = "雨伞下的米粒")
    private String username;

    @ApiModelProperty(value = "密码", example = "123456")
    private String password;

    @ApiModelProperty(value = "真实姓名")
    private String cardName;

    @ApiModelProperty(value = "借阅证编号 11位随机生成")
    private Long cardNumber;

    @ApiModelProperty(value = "规则编号 可自定义 权限功能")
    private Integer ruleNumber;

    @ApiModelProperty(value = "1表示可用 0表示禁用")
    private Integer status;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private String createTime;

    @ApiModelProperty(value = "更新时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private String updateTime;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}