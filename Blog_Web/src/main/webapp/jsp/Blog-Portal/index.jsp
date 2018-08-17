<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JAVA-SSM 个人博客系统</title>
    <link rel="stylesheet" href="../../font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../css/main.css">
    <script src="../../js/jquery.min.js"></script>
    <script src="../../js/main.js"></script>
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
                    <li><a href="<c:url value="/jsp/Blog-Portal/register.jsp"/> ">注&#x3000;册</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
        <form method="post" action="<c:url value="/blog/frontFindBlogByName.action"/> ">
        <div class="search">
            <input type="text" name="title" placeholder="请输入博客标题..." size="25">
            <button>&nbsp;<i class="fa fa-search"></i>&nbsp;&nbsp;</button>
        </div>
        </form>
    </div>
    <div class="control">
        <div class="control-left">
            <div class="section">
                <div class="title">
                    <i class="fa fa-list-ul"></i>&nbsp;&nbsp;最新博客
                </div>
                <c:forEach items="${blogList}" var="blog">
                    <div class="article">
                        <div class="article-date"><a href="<c:url value="/blog/frontBlogInfo.action?id=${blog.id}&read=${blog.read}"/> "><strong><fmt:formatDate value="${blog.time}" pattern="yyyy-MM-dd HH:mm:ss"/></strong></a></div>
                        <div class="article-title"><strong>${blog.title}</strong></div>
                        <div class="article-context">
                            <c:choose>
                                <c:when test="${fn:length(blog.content)>=10 }">
                                    ${blog.content.substring(0,10)}...
                                </c:when>
                                <c:otherwise>
                                    ${blog.content }
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="article-footer">
                            <small>&nbsp;&nbsp;阅读&nbsp;(${blog.read})</small>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>
        <div class="aside-base">
            <div class="aside">
                <div class="title">
                    <i class="fa fa-user"></i>&nbsp;&nbsp;博主信息
                </div>
                <div class="info">
                    <img class="head" src="${blogger.head}">
                    <div class="name"><em>${blogger.username}</em></div>
                </div>

            </div>
            <div class="aside">
                <div class="title">
                    <i class="fa fa-align-justify"></i>&nbsp;&nbsp;按日志分类
                </div>
                <ul>
                    <c:forEach items="${typeList}" var="type">
                        <li><a href="<c:url value="/blog/findBlogByType.action?id=${type.id}"/>">${type.name}&nbsp(${type.count})</a></li>
                    </c:forEach>
                </ul>
            </div>
            <%--<div class="aside">--%>
                <%--<div class="title">--%>
                    <%--<i class="fa fa-hourglass-end"></i>&nbsp;&nbsp;按时间分类--%>
                <%--</div>--%>
                <%--<ul>--%>
                    <%--<li><a href="#">2018年7月(0)</a></li>--%>
                    <%--<li><a href="#">2018年8月(0)</a></li>--%>
                    <%--<li><a href="#">2018年9月(0)</a></li>--%>
                    <%--<li><a href="#">2018年10月(0)</a></li>--%>
                <%--</ul>--%>
            <%--</div>--%>
        </div>
    </div>
</div>
</body>
</html>
