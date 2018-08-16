<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JAVA-SSM 个人博客后台管理 —— 博文管理</title>
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
            <li><a href="<c:url value="/jsp/Blog-Back/back-index.jsp"/> "><i class="fa fa-home"></i>&#x3000;首&#x3000;&#x3000;页</a>
            </li>
            <li><a href="<c:url value="/user/userinfo.action"/>"><i class="fa fa-user"></i>&#x3000;&nbsp;用户管理</a></li>
            <li><a href="<c:url value="/type/typeinfo.action"/>"><i class="fa fa-tags"></i>&#x3000;分类管理</a></li>
            <li id="bg-white"><a href="<c:url value="/blog/bloginfo.action"/> " id="color-red"><i
                    class="fa fa-clipboard"></i>&#x3000;博文管理</a></li>
            <li><a href="<c:url value="/comment/commentinfo.action"/>"><i class="fa fa-commenting"></i>&#x3000;评论管理</a>
            </li>
        </ul>
    </div>
</div>
<div class="back-right">
    <div class="back-right-nav">
        <div class="back-title">
            个人博客--博主后台系统
        </div>
        <ul>
            <li><a href="<c:url value="/user/backLogout.action"/> ">注销</a></li>
            <li><a href="<c:url value="/jsp/Blog-Back/back-index.jsp"/> ">主页</a></li>
        </ul>
    </div>
    <div class="back-right-left-nav">
        <ul>
            <li><a href="<c:url value="/blog/bloginfo.action"/> " id="color-black">博文管理</a></li>
            <li><a href="<c:url value="/type/typeAllForBlog.action"/> ">增加博文</a></li>
            <li><a href="#">修改博文</a></li>
            <li><a href="#">查找博文</a></li>
        </ul>
    </div>
    <div class="back-comment">
        <div class="back-title">
            博文管理
            <form method="post" action="<c:url value="/blog/findBlogByName.action"/> ">
                <div class="search">
                    <input type="text" name="title" placeholder="请输入博文名称..." size="25">
                    <button>&nbsp;<i class="fa fa-search"></i>&nbsp;&nbsp;</button>
                </div>
            </form>
        </div>
        <table>
            <tr>
                <th>ID</th>
                <th>博文名称</th>
                <th>博文分类</th>
                <th>博文内容</th>
                <th>发表时间</th>
                <th>点赞数</th>
                <th>阅读数</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${blogList}" var="blog">
                <tr>
                    <td>${blog.id}</td>
                    <td>
                        <c:choose>
                            <c:when test="${fn:length(blog.title)>5 }">
                                ${blog.title.substring(0,5)}...
                            </c:when>
                            <c:otherwise>
                                ${blog.title}
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${fn:length(blog.type.name)>5 }">
                                ${blog.type.name.substring(0,5)}...
                            </c:when>
                            <c:otherwise>
                                ${blog.type.name}
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${fn:length(blog.content)>5 }">
                                ${blog.content.substring(0,5)}...
                            </c:when>
                            <c:otherwise>
                                ${blog.content}
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td><fmt:formatDate value="${blog.time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>${blog.praise}</td>
                    <td>${blog.read}</td>
                    <td>
                        <a href="<c:url value="/blog/editBlogPro.action?id=${blog.id}"/>" class="blog-edit">修改</a>
                        <a href="<c:url value="/blog/deleteBlog.action?id=${blog.id}"/> " onclick="return delConfirm()"
                           class="blog-delete">删除</a>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="8" style="border: none;padding: 20px 0;text-align: right">
                    <ul class="pagination">
                        <li>
                            <a href="<c:url value="/blog/bloginfo.action?pageNum=${page.firstPage}"/> ">F</a>
                        </li>
                        <li>
                            <c:choose>
                                <c:when test="${page.hasPreviousPage}">
                                    <a href="<c:url value="/blog/bloginfo.action?pageNum=${page.prePage}"/> ">&laquo;</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="<c:url value="#"/> ">&laquo;</a>
                                </c:otherwise>
                            </c:choose>
                        </li>

                        <c:forEach var="i" begin="1" end="${page.pages}">
                            <c:if test="${page.pageNum ==i}">
                                <li  style="background-color: darkseagreen;">
                                    <a href="<c:url value="/blog/bloginfo.action?pageNum=${i}"/>"
                                    >${i}</a>
                                </li>
                            </c:if>
                            <c:if test="${page.pageNum !=i}">
                                <li>
                                    <a href="<c:url value="/blog/bloginfo.action?pageNum=${i}"/>">${i}</a>
                                </li>
                            </c:if>
                        </c:forEach>
                        <li>
                            <c:choose>
                                <c:when test="${page.hasNextPage}">
                                    <a href="<c:url value="/blog/bloginfo.action?pageNum=${page.nextPage}"/> ">&raquo;</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="<c:url value="#"/> ">&raquo;</a>
                                </c:otherwise>
                            </c:choose>
                            </a></li>
                        <li>
                            <a href="<c:url value="/blog/bloginfo.action?pageNum=${page.lastPage}"/> ">L</a>
                        </li>
                    </ul>
                </td>
            </tr>
        </table>
    </div>
</div>


</body>
</html>
