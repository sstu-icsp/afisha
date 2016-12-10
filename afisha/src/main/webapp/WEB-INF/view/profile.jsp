<%--
  Created by IntelliJ IDEA.
  User: walto
  Date: 10.12.2016
  Time: 20:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>Title</title>
    <div><img src="<%=request.getContextPath()%>/image?id=${user.image.id}" alt="profileImg" style="height: 100px"></div>
    <div>${user.nickName}</div>
    <div>${user.birthDate}</div>
</head>
<body>

</body>
</html>
