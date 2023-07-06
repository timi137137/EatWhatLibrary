package com.book.backend.mapper;

import com.book.backend.pojo.Users;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
* @description 针对表【t_users】的数据库操作Mapper
* @Entity com.book.backend.pojo.Users
*/
@Mapper
public interface UsersMapper extends BaseMapper<Users> {

}




