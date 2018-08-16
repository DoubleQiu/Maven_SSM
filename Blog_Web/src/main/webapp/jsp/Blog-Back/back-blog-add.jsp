<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JAVA-SSM 个人博客后台管理 —— 增加博文</title>
    <link rel="stylesheet" href="../../font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../css/main.css">
    <!-- 配置文件 -->
    <script type="text/javascript" src="../../UEditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="../../UEditor/ueditor.all.js"></script>
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
            <li><a href="<c:url value="/comment/commentinfo.action"/>"><i class="fa fa-commenting"></i>&#x3000;评论管理</a></li>
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
            <li><a href="<c:url value="/blog/bloginfo.action"/> ">博文管理</a></li>
            <li><a href="#" id="color-black">增加博文</a></li>
            <li><a href="#">修改博文</a></li>
            <li><a href="#">查找博文</a></li>
        </ul>
    </div>
    <div class="back-comment">
        <div class="back-title">
            增加博文
        </div>
        <form method="post" action="<c:url value="/blog/insertBlog.action"/>">
            <div class="blog-content">
                <input type="text" name="title" placeholder="请输入博文标题...">
            </div>
            <div class="blog-content">
                <select name="type_id" title="type">
                    <option name="type_id">--请选择博文类别--</option>
                    <c:forEach items="${typeList}" var="type">
                        <option name="type_id" value="${type.id}">${type.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="blog-content">
                <!-- 加载编辑器的容器 -->
                <script id="container" name="content" type="text/plain">
					您的内容分享...

                </script>
            </div>
            <div class="blog-content">
                <button>添加</button>
            </div>
        </form>
    </div>
</div>

<script>
    var ue = UE.getEditor('container', {
            toolbars: [
                ['fullscreen', 'source', 'undo', 'redo', 'bold', 'simpleupload']
            ],
            //focus时自动清空初始化时的内容
            autoClearinitialContent: true,
            //关闭字数统计
            wordCount: false,
            //关闭elementPath
            elementPathEnabled: false,
            //默认的编辑区域高度
            initialFrameHeight: 100,
            scaleEnabled: true
        }
    );
    var images = document.getElementsByTagName("img");
    for (var i = 0; i < images.length; i++) {
        console.log(images[i].src);
    }

</script>
</body>
</html>
