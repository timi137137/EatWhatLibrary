package com.book.backend.pojo;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * @TableName t_books
 */
@TableName(value ="t_books")
@Data
public class Books implements Serializable {
    @ApiModelProperty(value = "图书表唯一标识")
    @TableId(type = IdType.AUTO)
    private Integer bookId;

    @ApiModelProperty(value = "图书编号 图书的唯一标识")
    private Long bookNumber;

    @ApiModelProperty(value = "图书名称")
    private String bookName;

    @ApiModelProperty(value = "图书作者")
    private String bookAuthor;

    @ApiModelProperty(value = "图书所在图书馆名称")
    private String bookLibrary;

    @ApiModelProperty(value = "图书类别")
    private String bookType;

    @ApiModelProperty(value = "图书位置")
    private String bookLocation;

    @ApiModelProperty(value = "图书状态(未借出/已借出)")
    private String bookStatus;

    @ApiModelProperty(value = "图书描述")
    private String bookDescription;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private String createTime;

    @ApiModelProperty(value = "更新时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private String updateTime;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}