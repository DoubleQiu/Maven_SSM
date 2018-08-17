<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>JAVA-SSM 博客</title>
    <link rel="stylesheet" href="../../font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../css/main.css">
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
                    <li><a href="<c:url value="/jsp/Blog-Portal/register.jsp"/>">注&#x3000;册</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
        <%--<div class="search">--%>

            <%--<input type="text" placeholder="请输入博客标题..." size="25">--%>
            <%--<button>&nbsp;<i class="fa fa-search"></i>&nbsp;&nbsp;</button>--%>
        <%--</div>--%>
    <div class="control">
        <div class="control-left">
            <div class="section">
                <div class="title">
                    <i class="fa fa-list-ul"></i>&nbsp;&nbsp;博文详情
                </div>
                <div class="article">
                    <div class="article-date"><strong><fmt:formatDate value="${blog.time}" pattern="yyyy-MM-dd HH:mm:ss"/></strong> </div>
                    <div class="article-title"><strong>${blog.title}</strong></div>
                    <div class="article-context">
                        ${blog.content}
                    </div>
                    <div class="article-footer">
                        <small>&nbsp;&nbsp;阅读&nbsp;(${blog.read})&nbsp;&nbsp;<a href="#comment">评论</a>&nbsp;</small>
                    </div>
                </div>
                <%--<div class="footer">--%>
                    <%--<div class="previous"><small>上一篇:</small> <a href="#"><small>我的第一篇博客</small></a></div>--%>
                    <%--<div class="next"><small>下一篇:</small> <a href="#"><small>我的第一篇博客</small></a></div>--%>
                <%--</div>--%>

            </div>

            <div class="comment">
                <div class="title">
                    <i class="fa fa-commenting"></i>&nbsp;&nbsp;评论信息
                </div>

                <c:forEach items="${commentList}" var="comment" varStatus="status">
                <div class="content">
                    <img src="${comment.user.head}">
                    <span> &nbsp;第${status.index+1}楼  &nbsp;${comment.user.username}:&nbsp;${comment.content}</span>
                    <small><fmt:formatDate value="${comment.time}" pattern="yyyy-MM-dd HH:mm"/></small>
                </div>
                </c:forEach>

            </div>

            <div class="release">
                <div class="title">
                    <i class="fa fa-comment"></i>&nbsp;&nbsp;<a name="comment">发布评论</a>
                </div>
                <form method="post" action="<c:url value="/comment/insertComment.action"/> ">
                    <input type="hidden" name="user_id" value="${user.id}" id="user_id">
                    <input type="hidden" name="blog_id" value="${blog.id}">
                <div class="content">
                    <label>
                        <textarea name="content"></textarea>
                    </label>
                </div>
                <div class="commit">
                    <button onclick="checkUserId();">提交评论</button>
                </div>
                </form>
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
