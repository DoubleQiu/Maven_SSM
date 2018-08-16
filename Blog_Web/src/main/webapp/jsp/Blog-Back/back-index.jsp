<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<head>
    <meta charset="UTF-8">
    <title>JAVA-SSM 个人博客后台管理系统主页</title>
    <link rel="stylesheet" href="../../font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../css/main.css">
</head>
<body>

<div class="back-nav">
    <div class="back-nav-head">
        <img src="${blogger.head}">
        <hr>
    </div>
    <div class="back-name">
        <em>${blogger.username}</em>
    </div>

    <div class="back-left-nav">
        <ul>
            <li id="bg-white"><a href="back-index.jsp" id="color-red" ><i class="fa fa-home"></i>&#x3000;首&#x3000;&#x3000;页</a></li>
            <li><a href="<c:url value="/user/userinfo.action"/> "><i class="fa fa-user"></i>&#x3000;&nbsp;用户管理</a></li>
            <li><a href="<c:url value="/type/typeinfo.action"/> "><i class="fa fa-tags"></i>&#x3000;分类管理</a></li>
            <li><a href="<c:url value="/blog/bloginfo.action"/> "><i class="fa fa-clipboard"></i>&#x3000;博文管理</a></li>
            <li><a href="<c:url value="/comment/commentinfo.action"/>"><i class="fa fa-commenting"></i>&#x3000;评论管理</a></li>
        </ul>
    </div>
</div>
<div class="back-right">
    <img src="../../images/back-logo.png" class="back-bg">
</div>
</body>
</html>