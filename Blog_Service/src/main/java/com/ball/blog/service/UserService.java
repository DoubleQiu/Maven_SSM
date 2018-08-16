package com.ball.blog.service;

import com.ball.blog.po.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    List<User> selectUserList(User user);
    User login(Map<String,String> map);
    void  register(User user);
    User selectByUsername(String username);
    void updateUser(User user);
    User selectById(Integer id);
    void deleteUser(Integer id);
    User selectByUserPermission(String permission);
}
