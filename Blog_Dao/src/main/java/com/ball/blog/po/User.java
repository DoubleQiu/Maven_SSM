package com.ball.blog.po;

import java.io.Serializable;

/**
 * javabean——用户类
 */
public class User implements Serializable {
    private Integer id;//用户ID
    private String username;//用户名
    private String password;//用户密码
    private String head;//用户头像
    private Integer age;//用户年龄
    private String career;//用户职业
    private String permission;//用户权限
    private String qq;//用户QQ

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getHead() {
        return head;
    }

    public void setHead(String head) {
        this.head = head;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getCareer() {
        return career;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public void setCareer(String career) {
        this.career = career;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }
}
