<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JAVA-SSM 博主后台登录</title>
    <link rel="stylesheet" href="../../font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<div class="login-title">
    <img src="../../images/back-login-logo.png">
</div>
<div class="login">
    <form action="<c:url value='/user/backLogin.action'/>" method="post">
        <div class="msg">${msg}</div>
        <div class="content">
            <input type="text" name="username" value="${username}"  placeholder="请输入账号...">
        </div>
        <div class="content">
            <input type="text" name="password" value="${password}" placeholder="请输入密码...">
        </div>
        <div class="footer">
            <a href="<c:url value="/jsp/Blog-Portal/login.jsp"/> ">不是博主点这里！</a>
            <button>登录</button>
        </div>
    </form>
</div>
</body>
</html>
