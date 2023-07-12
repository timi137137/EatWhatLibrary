package com.book.backend.pojo;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * @TableName t_comment
 */
@TableName(value ="t_comment")
@Data
public class Comment implements Serializable {
    @ApiModelProperty(value = "留言表记录的唯一标识")
    @TableId(type = IdType.AUTO)
    private Integer commentId;

    @ApiModelProperty(value = "留言的头像 链接")
    private String commentAvatar;

    @ApiModelProperty(value = "弹幕的高度(样式)")
    private String commentBarrageStyle;

    @ApiModelProperty(value = "弹幕的内容")
    private String commentMessage;

    @ApiModelProperty(value = "留言的时间(控制速度)")
    private Integer commentTime;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private String createTime;

    @ApiModelProperty(value = "更新时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private String updateTime;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}