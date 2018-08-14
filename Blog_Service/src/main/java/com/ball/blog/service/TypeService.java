package com.ball.blog.service;

import com.ball.blog.po.Type;

import java.util.List;

public interface TypeService {
    List<Type> selectTypeList(Type type);
    void  deleteType(Integer id);
    void  insertType(Type type);
    Type  selectTypeByName(String name);
    Type  selectTypeById(Integer id);
    void  updateType(Type type);
}
