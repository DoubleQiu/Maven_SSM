package com.ball.blog.service.impl;

import com.ball.blog.mapper.UserMapper;
import com.ball.blog.po.User;
import com.ball.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

public class UserServiceImpl implements UserService{
    @Autowired
    private UserMapper userMapper;
//    private User user;

//    public List<User> selectAll(){
//        return userMapper.selectAll();
//    }

    @Override
    public List<User> selectUserList(User user) {
        return userMapper.selectUserList(user);
    }

    public User login(Map<String,String> map){
        return userMapper.login(map);
    }

    @Override
    public void register(User user) {
        userMapper.register(user);
    }

    @Override
    public User selectByUsername(String username) {
        return userMapper.selectByUsername(username);
    }

    @Override
    public void updateUser(User user) {
        userMapper.updateUser(user);
    }

    @Override
    public User selectById(Integer id) {
        return userMapper.selectById(id);
    }

    @Override
    public void deleteUser(Integer id) {
        userMapper.deleteUser(id);
    }

    @Override
    public User selectByUserPermission(String permission) {
        return userMapper.selectByUserPermission(permission);
    }
}
