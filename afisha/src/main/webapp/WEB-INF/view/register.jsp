<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Afisha</title>
    <script type="text/javascript" src="<c:url value='/static/js/jquery-1.11.1.min.js' />"></script>
    <script type="text/javascript" src="<c:url value='/static/js/bootstrap.min.js' />"></script>
    <link rel="stylesheet" href="<c:url value='/static/css/bootstrap.min.css' />">
    <link rel="stylesheet" href="<c:url value='/static/css/bootstrap-datetimepicker.min.css' />">
    <link rel="stylesheet" href="<c:url value='/static/css/index.css' />">
    <link rel="stylesheet" href="<c:url value='/static/css/fonts-v3.css' />">
    <script type="text/javascript" src="<c:url value='/static/js/createEvent.js' />"></script>
    <style>
        #eventImage {
            height: 100px;
        }
        .error {
            color:red;
        }
    </style>
</head>
<body>

<!--Header-->
<div class="navbar navbar-inverse">
    <div class="container-fluid">
        <ul class="nav navbar-nav">
            <li class="active">
                <a class="navbar-brand projectBrand" href="<%=request.getContextPath()%>">AFISHA</a>
            </li>
        </ul>

    </div>
</div>
<!--Content-->
<div class="row">
    <div class="col-xs-4 col-xs-offset-4">
        <div class="text-center">
            <h1> Регистрация </h1>
            <hr>
        </div>
        <form:form method="post" id="form" action="register?${_csrf.parameterName}=${_csrf.token}" modelAttribute="user" enctype="multipart/form-data">
            <!--Image-->
            <div class="form-group">
                <div class="eventImg thumbnail">
                    <img id="eventImage" class="img-responsive"/>
                </div>
                <div class="pull-right">
                    <input type="file" class="filestyle" id="imageInput" accept="image/jpeg" name="userimg">
                </div>
            </div>

            <div class="form-group">
                <div><form:errors class="error" path="nickName"/></div>
                <label for="nickName">Логин*</label>
                <form:input path="nickName" cssClass="form-control" />
            </div>

            <div class="form-group">
                <div><form:errors class="error" path="password"/></div>
                <label for="password">Пароль*</label>
                <form:input type="password" path="password" cssClass="form-control" />
            </div>

            <div class="form-group">
                <label for="fullName">Имя</label>
                <form:input path="fullName" cssClass="form-control" />
            </div>

            <div class="form-group">
                <div><form:errors class="error" path="birthDate"/></div>
                <label for="datetimepicker">Дата рождения</label>
                <div class="input-group" id="datetimepicker">
                    <form:input path="birthDate" cssClass="form-control" />
                    <span class="input-group-addon">
                        <span class="glyphicon-calendar glyphicon"></span>
                    </span>
                </div>
                <script src="<c:url value='/static/js/moment-with-locales.min.js' />"></script>
                <script src="<c:url value='/static/js/bootstrap-datetimepicker.min.js' />"></script>
                <script type="text/javascript">
                    $(function () {
                        var dateNow = new Date();
                        $('#datetimepicker').datetimepicker({language: 'ru', format: 'DD-MM-YYYY' });
                    });
                </script>
            </div>

            <div class="form-group">
                <label for="genderId">Пол</label>
                <form:select path="genderId" items="${genders}" itemLabel="name" itemValue="id" cssClass="form-control" />
            </div>

            <div class="form-group">
                <label for="cityId">Город</label>
                <form:select path="cityId" items="${cities}" itemLabel="name" itemValue="id" cssClass="form-control" />
            </div>
            <div class="form-group pull-right">
                <input type="submit" class="btn btn-primary" value="Зарегистрироваться">
            </div>
            <br>
            <br>
            <br>
            <p class="pull-right">*Обязательные поля</p>
        </form:form>
    </div>
</div>
</body>
</html>
