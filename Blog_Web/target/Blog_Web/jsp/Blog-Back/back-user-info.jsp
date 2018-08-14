<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JAVA-SSM 个人博客后台管理 —— 用户管理</title>
    <link rel="stylesheet" href="../../font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../css/main.css">
    <script src="../../js/main.js" type="text/javascript"></script>
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
            <li ><a href="<c:url value="/jsp/Blog-Back/back-index.jsp"/> " ><i class="fa fa-home"></i>&#x3000;首&#x3000;&#x3000;页</a></li>
            <li id="bg-white"><a href="<c:url value="/user/userinfo.action"/>"  id="color-red"><i class="fa fa-user"></i>&#x3000;&nbsp;用户管理</a></li>
            <li><a href="<c:url value="/type/typeinfo.action"/>"><i class="fa fa-tags"></i>&#x3000;分类管理</a></li>
            <li><a href="#"><i class="fa fa-clipboard"></i>&#x3000;博文管理</a></li>
            <li><a href="#"><i class="fa fa-commenting"></i>&#x3000;评论管理</a></li>
        </ul>
    </div>
</div>
<div class="back-right">
    <div class="back-right-nav">
        <div class="back-title">
            个人博客--博主后台系统
        </div>
        <ul>
            <li><a href="<c:url value="/user/backLogout.action"/> ">注销</a> </li>
            <li><a href="<c:url value="/jsp/Blog-Back/back-index.jsp"/> ">主页</a> </li>
        </ul>
    </div>
    <div class="back-right-left-nav">
        <ul>
            <li><a href="<c:url value="/user/userinfo.action"/> " id="color-black">用户管理</a> </li>
            <li><a href="#">查找用户</a> </li>
        </ul>
    </div>
    <div class="back-comment">
        <div class="back-title">
            用户管理
            <form method="post" action="<c:url value="/user/findUserByUsername.action"/> ">
            <div class="search">
                <small>${msg}</small>
                <input type="text" name="username" placeholder="请输入用户名称..." size="25">
                <button>&nbsp;<i class="fa fa-search"></i>&nbsp;&nbsp;</button>
            </div>
            </form>
        </div>
        <table>
            <tr>
                <th>ID</th>
                <th>头像</th>
                <th>昵称</th>
                <th>年龄</th>
                <th>qq</th>
                <th>职业</th>
                <th>权限</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${userList}" var="user">
            <tr>
                <td>${user.id}</td>
                <td><img src="${user.head}"></td>
                <td>${user.username}</td>
                <td>${user.age}</td>
                <td>${user.qq}</td>
                <td>${user.career}</td>
                <td>${user.permission}</td>
                <td>
                    <a onclick="return delConfirm();" class="delete" href="<c:url value="/user/deleteUser.action?id=${user.id}&permission=${user.permission}"/> " >删除</a>
                </td>
            </tr>
            </c:forEach>
        </table>
    </div>
</div>
<script>

</script>

</body>
</html>
