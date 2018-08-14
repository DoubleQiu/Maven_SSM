<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JAVA-SSM 登录</title>
    <link rel="stylesheet" href="../../font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<div class="login-title">
    <img src="../../images/login-logo.png">
</div>
<div class="login">
    <form action="<c:url value="/user/login.action"/>" method="post">
        <div class="msg">${msg}</div>
        <div class="content">
            <input type="text" name="username" placeholder="请输入账号..." value="${username}">
        </div>
        <div class="content">
            <input type="password" name="password" placeholder="请输入密码..." value="${password}">
        </div>
        <div class="footer">
            <a href="#">注册账号</a>
            <button>登录</button>
        </div>
    </form>
</div>
</body>
</html>
