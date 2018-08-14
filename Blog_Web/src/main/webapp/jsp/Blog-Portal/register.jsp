<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>JAVA-SSM 个人博客注册</title>
    <link rel="stylesheet" href="../../font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<div class="register">
    <div class="register-title">
        <img src="../../images/regist-logo.png">
    </div>
    <div class="login">
        <form action="<c:url value='/user/register.action'/> " method="post">

            <div class="content">
                <input type="text" name="username" value="${user.username}" placeholder="请输入账号..." REQUIRED/>
                <small>${msg}</small>
            </div>
            <div class="content">
                <input type="text" name="password" value="${user.password}" placeholder="请输入密码..." REQUIRED>
            </div>
            <div class="content">
                <input type="text" name="qq" value="${user.qq}" placeholder="请输入qq..." REQUIRED>
            </div>
            <div class="content">
                <input type="text" name="age" value="${user.age}" placeholder="请输入年龄..." REQUIRED>
            </div>
            <div class="content">
                <input type="text" name="career" value="${user.career}" placeholder="请输入职业..." REQUIRED>
            </div>
            <div class="footer">
                <a href="login.jsp">已有账号!赶快登录吧</a>
                <button>注册</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
