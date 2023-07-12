package com.book.backend.pojo.dto;

import com.book.backend.pojo.Books;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class BookDTO extends Books {

    @ApiModelProperty(value = "书籍类型")
    public Integer bookTypeNumber;

}
