package com.ball.blog.service;

import com.ball.blog.mapper.UserMapper;
import com.ball.blog.po.User;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class UserService {
    @Autowired
    private UserMapper userMapper;

    public List<User> selectAll(){
        return userMapper.selectAll();
    }
}
