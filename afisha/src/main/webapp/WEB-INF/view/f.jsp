<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Студенты</title>
 
    <style>
        tr:first-child{
            font-weight: bold;
            background-color: #C6C9C4;
        }
    </style>
 
</head>
<body>
	<div><a href="<c:url value='/' />">< назад</a></div>
    <h2>Список студентов</h2>  
    <table>
        <tr>
            <td>Полное имя</td><td>Группа</td><td>Дата рождения</td><td></td><td></td>
        </tr>
        <c:forEach items="${events}" var="event">
            <tr>
            <td>${event.title}</td>
            
            
            </tr>
        </c:forEach>
    </table>
    <br/>
    <a href="<c:url value='/student/new' />">добавить нового студента</a>
</body>
</html>