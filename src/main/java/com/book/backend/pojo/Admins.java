package com.book.backend.pojo;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * @TableName t_admins
 */
@TableName(value ="t_admins")
@Data
public class Admins implements Serializable {
    @ApiModelProperty(value = "管理员表的唯一标识")
    @TableId(type = IdType.AUTO)
    private Integer adminId;

    @ApiModelProperty(value = "用户名", example = "root")
    private String username;

    @ApiModelProperty(value = "密码", example = "123456")
    private String password;

    @ApiModelProperty(value = "管理员真实姓名")
    private String adminName;

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
