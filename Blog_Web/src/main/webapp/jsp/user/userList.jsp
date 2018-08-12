<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach items="${userList}" var="user">
    <p>${user.username}</p>
    <p>${user.password}</p>
    <p>${user.qq}</p>
</c:forEach>
</body>
</html>
