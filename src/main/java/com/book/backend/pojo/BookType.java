package com.book.backend.pojo;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * @TableName t_book_type
 */
@TableName(value ="t_book_type")
@Data
public class BookType implements Serializable {
    @ApiModelProperty(value = "图书类别唯一标识")
    @TableId(type = IdType.AUTO)
    private Integer typeId;

    @ApiModelProperty(value = "借阅类别的昵称")
    private String typeName;

    @ApiModelProperty(value = "借阅类别的描述")
    private String typeContent;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private String createTime;

    @ApiModelProperty(value = "更新时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private String updateTime;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}