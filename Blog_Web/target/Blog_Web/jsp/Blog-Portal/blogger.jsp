<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8"  %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JAVA-SSM 个人信息</title>
    <link rel="stylesheet" href="../../font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../css/main.css">
    <script src="../../js/jquery.min.js" type="text/javascript"></script>
    <script src="../../js/main.js" type="text/javascript"></script>
</head>
<body>
<div class="base">
    <div class="header"></div>
    <div class="nav">
        <ul>
            <li><a href="<c:url value="/user/indexPro.action"/> ">首&#x3000;页</a></li>

        </ul>

        <ul class="user-info">
            <c:choose>
                <c:when test="${not empty user}">
                    <li>${user.username}&#x3000;&#x3000;</li>
                    <li><a href="<c:url value="/user/logout.action"/>">注&#x3000;销</a></li>
                    <li> <a href="<c:url value="/jsp/Blog-Portal/blogger.jsp"/> ">个人信息</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="<c:url value="/jsp/Blog-Portal/login.jsp"/> ">登&#x3000;录</a></li>
                    <li><a href="<c:url value="/jsp/Blog-Portal/register.jsp"/>">注&#x3000;册</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>

        <div class="control">

            <div class="control-left">
                <div class="section">
                    <div class="title">
                        <i class="fa fa-address-book"></i>&nbsp;&nbsp;个人信息
                        <button id="blogger-edit" onclick="bloggerEdit();">编辑资料</button>
                    </div>

                    <form id="form-user" action="<c:url value="/user/updateUser.action"/> " method="post">
                    <div class="main">
                        <div class="title">基本资料</div>
                        <div class="content">
                            <input type="hidden" name="id"  value="${user.id}">
                            <div class="line">
                                <small>年龄:&nbsp;&nbsp;&nbsp;
                                    <input type="text" name="age" value="${user.age}" disabled>
                                    <input type="hidden" name="age" value="${user.age}">
                                </small>
                            </div>
                            <div class="line">
                                <small>职业:&nbsp;&nbsp;&nbsp;
                                    <input type="text" name="career" value="${user.career}" disabled>
                                    <input type="hidden" name="career" value="${user.career}" >
                                </small>
                            </div>
                            <div class="line">
                                <small>QQ:&nbsp;&nbsp;&nbsp;
                                    <input type="text" name="qq" value="${user.qq}" disabled>
                                    <input type="hidden" name="qq" value="${user.qq}" >
                                </small>
                            </div>
                            <div class="line">
                                <small>权限:&nbsp;&nbsp;&nbsp;${user.permission}</small>
                            </div>
                        </div>
                        <div class="title">账号密码</div>
                        <div class="content">
                            <div class="line">
                                <small>账号:&nbsp;&nbsp;&nbsp;${user.username}</small>
                            </div>
                            <div class="line">
                                <small>密码:&nbsp;&nbsp;&nbsp;
                                    <input type="text" name="password" value="${user.password}" disabled>
                                    <input type="hidden" name="password" value="${user.password}">
                                </small>
                            </div>
                        </div>
                    </div>
                        <input type="hidden" name="username"  value="${user.username}">
                        <input type="hidden" name="head"  value="${user.head}">
                        <input type="hidden" name="permission"  value="${user.permission}">
                    </form>


                </div>
            </div>
        <div class="aside-base">
            <div class="aside">
                <div class="title">
                    <i class="fa fa-user"></i>&nbsp;&nbsp;我的头像
                </div>
                <div class="info">
                    <img class="head" id="head" src="${user.head}">
                    <em id="head-name">${user.username}</em>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>
