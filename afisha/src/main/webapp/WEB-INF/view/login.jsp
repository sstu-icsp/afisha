<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Afisha</title>
    <script type="text/javascript" src="<c:url value='/static/js/jquery-1.11.1.min.js' />"></script>
    <script type="text/javascript" src="<c:url value='/static/js/moment-with-locales.min.js' />"></script>
    <script type="text/javascript" src="<c:url value='/static/js/bootstrap.min.js' />"></script>
    <script type="text/javascript" src="<c:url value='/static/js/bootstrap-datetimepicker.js' />"></script>
    <link rel="stylesheet" href="<c:url value='/static/css/bootstrap.min.css' />">
    <link rel="stylesheet" href="<c:url value='/static/css/bootstrap-datetimepicker.min.css' />">
    <link rel="stylesheet" href="<c:url value='/static/css/index.css' />">
    <link rel="stylesheet" href="<c:url value='/static/css/fonts-v3.css' />">

</head>
<body>

<!--Header-->
<div class="navbar navbar-inverse">
    <div class="container-fluid">
        <ul class="nav navbar-nav">
            <li class="active">
                <a class="navbar-brand projectBrand" href="#">AFISHA</a>
            </li>
        </ul>

    </div>
</div>
<!--Content-->
<div class="row">
    <div class="col-xs-4 col-xs-offset-4">
        <div class="text-center">
            <h1> Вход </h1>
            <hr>
        </div>
        <form name="loginForm" method="post" action="login">
            <c:if test="${param.error != null}">
                <div class="alert alert-danger">
                    <p>Неправильный логин или пароль</p>
                </div>
            </c:if>
            <c:if test="${param.logout != null}">
                <div class="alert alert-success">
                    <p>Вы вышли</p>
                </div>
            </c:if>
            <div class="form-group">
                <label for="username">Логин</label>
                <input type="text" name="username" id="username" class="form-control">
            </div>
            <div class="form-group">
                <label for="password">Пароль</label>
                <input type="password" name="password" id="password" class="form-control">
            </div>
            <div class="form-group pull-right">
                <input type="submit" class="btn btn-success" value="Вход">
                <a href="register"><input type="button" class="btn btn-warning" value="Регистрация"></a><%--data-toggle="modal"
                       data-target="#myModal"--%>
            </div>
            <%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />--%>
        </form>
    </div>
</div>

<%--<div id="myModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Восстановление пароля</h4>
            </div>
            <form name="passwordReset" class="form-inline" method="post">
                <div class="modal-body">
                    <label class="">Введите e-mail для восстановления пароля</label>
                    <input type="email" class="form-control" id="email" name="email">
                </div>
                <div class="modal-footer">
                    <input type="submit" class="btn btn-success" value="Восстановить пароль">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->--%>

</body>
</html>
