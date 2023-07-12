package com.book.backend.pojo.dto;

import com.book.backend.pojo.BooksBorrow;
import lombok.Data;
import io.swagger.annotations.ApiModelProperty;
import java.io.Serializable;

@Data
public class BooksBorrowDTO extends BooksBorrow implements Serializable {
    @ApiModelProperty(value = "接受图书管理员的id")
    public Integer bookAdminId;

}
