<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8"  %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JAVA-SSM 个人博客后台管理 —— 评论管理</title>
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
            <li ><a href="<c:url value="/user/userinfo.action"/>"  ><i class="fa fa-user"></i>&#x3000;&nbsp;用户管理</a></li>
            <li><a href="<c:url value="/type/typeinfo.action"/>"><i class="fa fa-tags" ></i>&#x3000;分类管理</a></li>
            <li ><a href="<c:url value="/blog/bloginfo.action"/> " ><i class="fa fa-clipboard"></i>&#x3000;博文管理</a></li>
            <li  id="bg-white"><a href="<c:url value="/comment/commentinfo.action"/> "><i class="fa fa-commenting"  id="color-red"></i>&#x3000;评论管理</a></li>
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
            <li><a href="<c:url value="/comment/commentinfo.action"/>" id="color-black">评论管理</a></li>

            <li><a href="#">评论查询</a></li>
        </ul>
    </div>
    <div class="back-comment">
        <div class="back-title">
            评论管理
            <form action="<c:url value="/comment/selectCommentByContent.action"/>" method="post">
            <div class="search">
                <input type="text" name="content" placeholder="请输入评论名称..." size="25">
                <button>&nbsp;<i class="fa fa-search"></i>&nbsp;&nbsp;</button>
            </div>
            </form>
        </div>
        <table>
            <tr>
                <th>评论ID</th>
                <th>评论博文</th>
                <th>评论内容</th>
                <th>评论用户</th>
                <th>评论时间</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${commentList}" var="comment">
            <tr>
                <td>${comment.id}</td>
                <td>
                    <c:choose>
                        <c:when test="${fn:length(comment.blog.title)>5 }">
                            ${comment.blog.title.substring(0,5)}...
                        </c:when>
                        <c:otherwise>
                            ${comment.blog.title}
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${fn:length(comment.content)>5 }">
                            ${comment.content.substring(0,5)}...
                        </c:when>
                        <c:otherwise>
                            ${comment.content}
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>${comment.user.username}</td>
                <td>
                <fmt:formatDate value="${comment.time}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </td>
                <td>
                    <a href="<c:url value="/comment/deleteComment.action?id=${comment.id}"/> " onclick="return delConfirm()" class="delete">删除</a>
                </td>
            </tr>
            </c:forEach>
            <tr>
                <td colspan="8" style="border: none;padding: 20px 0;text-align: right">
                    <ul class="pagination">
                        <li>
                            <a href="<c:url value="/comment/commentinfo.action?pageNum=${page.firstPage}"/> ">F</a>
                        </li>
                        <li>
                            <c:choose>
                                <c:when test="${page.hasPreviousPage}">
                                    <a href="<c:url value="/comment/commentinfo.action?pageNum=${page.prePage}"/> ">&laquo;</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="<c:url value="#"/> ">&laquo;</a>
                                </c:otherwise>
                            </c:choose>
                        </li>

                        <c:forEach var="i" begin="1" end="${page.pages}">
                            <c:if test="${page.pageNum ==i}">
                                <li  style="background-color: darkseagreen;">
                                    <a href="<c:url value="/comment/commentinfo.action?pageNum=${i}"/>"
                                    >${i}</a>
                                </li>
                            </c:if>
                            <c:if test="${page.pageNum !=i}">
                                <li>
                                    <a href="<c:url value="/comment/commentinfo.action?pageNum=${i}"/>">${i}</a>
                                </li>
                            </c:if>
                        </c:forEach>
                        <li>
                            <c:choose>
                                <c:when test="${page.hasNextPage}">
                                    <a href="<c:url value="/comment/commentinfo.action?pageNum=${page.nextPage}"/> ">&raquo;</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="<c:url value="#"/> ">&raquo;</a>
                                </c:otherwise>
                            </c:choose>
                            </a></li>
                        <li>
                            <a href="<c:url value="/comment/commentinfo.action?pageNum=${page.lastPage}"/> ">L</a>
                        </li>
                    </ul>
                </td>
            </tr>
        </table>
    </div>
</div>


</body>
</html>
