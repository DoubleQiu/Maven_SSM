package com.ball.blog.po;

import java.io.Serializable;

public class Type implements Serializable{
    private Integer id;//分类ID
    private String name;//分类名称
    private Integer sort;//分类排序

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }
}
