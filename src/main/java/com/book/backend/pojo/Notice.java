package com.book.backend.pojo;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * @TableName t_notice
 */
@TableName(value ="t_notice")
@Data
public class Notice implements Serializable {
    @ApiModelProperty(value = "公告表记录的唯一标识")
    @TableId(type = IdType.AUTO)
    private Integer noticeId;

    @ApiModelProperty(value = "公告题目")
    private String noticeTitle;

    @ApiModelProperty(value = "公告内容")
    private String noticeContent;

    @ApiModelProperty(value = "发布公告的管理员id")
    private Integer noticeAdminId;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private String createTime;

    @ApiModelProperty(value = "更新时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private String updateTime;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}
