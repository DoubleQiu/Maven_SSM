<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JAVA-SSM 个人博客后台管理 —— 修改分类</title>
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
            <li ><a href="<c:url value="/jsp/Blog-Back/back-index.jsp"/> " ><i class="fa fa-home"></i>&#x3000;首&#x3000;&#x3000;页</a></li>
            <li ><a href="<c:url value="/user/userinfo.action"/>"  ><i class="fa fa-user"></i>&#x3000;&nbsp;用户管理</a></li>
            <li id="bg-white"><a href="<c:url value="/type/typeinfo.action"/>" id="color-red"><i class="fa fa-tags" ></i>&#x3000;分类管理</a></li>
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
            <li><a href="<c:url value="/type/typeinfo.action"/>" >分类管理</a></li>
            <li><a href="<c:url value="/jsp/Blog-Back/back-type-add.jsp"/> ">增加分类</a></li>
            <li><a href="#"  id="color-black">修改分类</a></li>
            <li><a href="#" >分类查询</a></li>
        </ul>
    </div>
    <div class="back-comment">
        <div class="back-title">
            修改分类
            <small id="msg">${msg}</small>
        </div>
        <form method="post" action="<c:url value="/type/updateType.action"/> ">

            <div class="content">
                <%--<input type="text" name="name" value="${type.name}" placeholder="请输入分类名称...">--%>
                <input type="text" name="name" value="${type.name}" placeholder="请输入分类名称...">
                <input type="hidden" name="id" value="${type.id}">
            </div>
            <div class="content">
                <input type="text" name="sort" value="${type.sort}" placeholder="请输入分类排序...">
            </div>
            <div class="footer">
                <button>修改</button>
            </div>
        </form>
    </div>
</div>


</body>
</html>
