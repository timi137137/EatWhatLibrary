package com.book.backend.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.book.backend.common.BasePage;
import com.book.backend.common.R;
import com.book.backend.pojo.Users;
import com.book.backend.pojo.dto.UsersDTO;

/**
 * 针对表【t_users】的数据库操作 Service
 */
public interface UsersService extends IService<Users> {

    /**
     * 根据用户ID获取用户信息
     * @param userId 用户ID
     * @return R<Users>
     */
    R<Users> getUserByUserId(Integer userId);

    /**
     * 修改用户密码
     * @param users 用户对象（需要包含新密码和旧密码）
     * @return R<String>
     */
    R<String> updatePassword(Users users);

    /**
     * 借阅用户登录
     * @param users 用户对象
     * @return R<Users>
     */
    R<Users> login(Users users);

    R<Users> getUserData(Users users);

    /**
     * 获取借阅证列表(用户列表)
     * @param basePage 分页参数
     * @return R<Page<Users>>
     */
    R<Page<Users>> getStatementList(BasePage basePage);

    /**
     * 根据用户ID获取用户信息（用于回显借阅证信息）
     * @param userId 用户ID
     * @return R<UsersDTO>
     */
    R<UsersDTO> getStatementByUserId(Integer userId);

    /**
     * 修改借阅证信息(用户信息)
     * @param usersDTO 用户DTO
     * @return R<String>
     */
    R<String> updateStatement(UsersDTO usersDTO);

    /**
     * 删除借阅证信息 根据用户id
     * @param userId 用户ID
     * @return R<String>
     */
    R<String> deleteStatementByUserId(Integer userId);

    /**
     * 用户注册功能
     * @param users 用户对象
     * @return R<String>
     */
    R<String> register(Users users);
}
