package com.ball.blog.service.impl;

import com.ball.blog.mapper.TypeMapper;
import com.ball.blog.po.Type;
import com.ball.blog.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class TypeServiceImpl implements TypeService {
    @Autowired
    private TypeMapper typeMapper;
    @Override
    public List<Type> selectTypeList(Type type) {
        return typeMapper.selectTypeList(type);
    }

    @Override
    public void deleteType(Integer id) {
        typeMapper.deleteType(id);
    }

    @Override
    public void insertType(Type type) {
        typeMapper.insertType(type);
    }

    @Override
    public Type selectTypeByName(String name) {
        return typeMapper.selectTypeByName(name);
    }

    @Override
    public Type selectTypeById(Integer id) {
        return typeMapper.selectTypeById(id);
    }

    @Override
    public void updateType(Type type) {
        typeMapper.updateType(type);
    }

    @Override
    public List<Type> portalSelectType(Type type) {
        return typeMapper.portalSelectType(type);
    }
}
