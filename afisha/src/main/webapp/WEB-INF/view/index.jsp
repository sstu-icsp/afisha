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

    <!-- Bootstrap -->
    <script type="text/javascript" src="<c:url value='/static/js/jquery-1.11.1.min.js' />"></script>
    <script type="text/javascript" src="<c:url value='/static/js/moment-with-locales.min.js' />"></script>
    <script type="text/javascript" src="<c:url value='/static/js/bootstrap.min.js' />"></script>
    <script type="text/javascript" src="<c:url value='/static/js/bootstrap-datetimepicker.js' />"></script>
    <link rel="stylesheet" href="<c:url value='/static/css/bootstrap.min.css' />">
    <link rel="stylesheet" href="<c:url value='/static/css/bootstrap-datetimepicker.min.css' />">
    <link rel="stylesheet" href="<c:url value='/static/css/index.css' />">
    <link rel="stylesheet" href="<c:url value='/static/css/fonts-v3.css' />">
    <style>
        #hellospan {
            color: white;
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
        <c:choose>
            <c:when test="${pageContext.request.userPrincipal.name != null}">
                <div class="navbar-form navbar-right">
                    <span id="hellospan">Привет, <a
                            href="<%=request.getContextPath()%>/profile/${pageContext.request.userPrincipal.name}">${pageContext.request.userPrincipal.name}</a></span>
                    <!-- csrt for log out-->
                    <form action="<%=request.getContextPath()%>/logout" method="post" id="logoutForm">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
                    <script>
                        function formSubmit() {
                            document.getElementById("logoutForm").submit();
                        }
                    </script>
                    <a href="javascript:formSubmit()">Выйти</a>
                </div>
            </c:when>
            <c:otherwise>
                <form class="navbar-form navbar-right" role="form" name="loginForm"
                      action="<%=request.getContextPath()%>/login" method="POST">
                    <div class="form-group">
                        <input type="text" placeholder="Имя пользователя" name="username" class="form-control">
                    </div>
                    <div class="form-group">
                        <input type="password" placeholder="Пароль" name="password" class="form-control">
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-success">Войти</button>
                    <a href="register">
                        <button type="button" class="btn btn-warning">Регистрация</button>
                    </a>
                </form>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<!--Content-->
<div class="container-fluid">
    <!--Events-->
    <div class=" col-xs-9 mainContent">
        <div class="row-fluid">
            <div class="col-xs-8">
                <div class="btn-group" id="genreTypesButton">
                    <ul class="nav nav-justified">
                        <c:forEach items="${types}" var="type">
                            <li>
                                <button type="button" class="btn btn-default
                                <c:if test="${id==type.id}">
                                    active
                                </c:if>"
                                        onclick="location.href='<c:url value='/search/${type.id}'/>'">${type.name}
                                </button>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="col-xs-4">
                <form class="form-inline pull-right" role="search" action="<c:url value='/search'/>" method="get">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Поиск" name="param">
                    </div>
                    <button type="submit" class="btn btn-default">Поиск</button>
                </form>
            </div>
        </div>
        <div class="clearfix"></div>
        <hr>
        <H3>Сегодняшние мероприятия,<%= new java.util.Date() %>
        </H3>
        <div class="row-fluid">
            <!-- Конкретное событие -->
            <c:forEach items="${events}" var="event">
                <div class="col-xs-3">
                    <div class="thumbnail">
                        <a href="<%=request.getContextPath()%>/event/${event.id}">
                            <img class="img-responsive eventImage" src="<c:url value='/image?id=${event.image.id}' />"
                                 alt="EventImg">
                        </a>
                        <div class="caption">
                            <div class="pull-right">
                                <c:forEach var="i" begin="1" end="${event.rating}">
                                    <span class="glyphicon glyphicon-star"></span>
                                </c:forEach>
                                <c:forEach var="i" begin="${event.rating}" end="4">
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </c:forEach>
                            </div>
                            <a href="<%=request.getContextPath()%>/event/${event.id}"><h3
                                    class="eventTitle">${event.title}</h3></a>
                            <h4>${event.city.name}</h4>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <!-- /Конкретное событие -->
        </div>
    </div>
    <!--Filters-->
    <div class="col-xs-3 rightFilters">

        <a href="<c:url value='/new'/>" class="btn btn-default center-block">Добавить событие</a>

        <div class="cityChoosing ">
            <h2 class="text-center">Город</h2>
            <div class="col-xs-8 col-xs-offset-2 ">
                <div class="form-group">
                    <select class="form-control">
                        <option>Выберите город</option>
                        <c:forEach items="${cities}" var="city">
                            <option>
                                    ${city.name}
                            </option>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>

        <div class="dateChoosing container-fluid">
            <h2 class="text-center">Дата</h2>
            <div class="col-xs-12">
                <div class="form-group">
                    <div class="input-group date" id="datetimepicker8">
                    </div>
                </div>
            </div>
            <script type="text/javascript">
                $(function () {
                    $("#datetimepicker8").datetimepicker({
                        format: 'DD/MM/YYYY',
                        locale: 'ru',
                        inline: true,
                    });
                });
            </script>
        </div>
        <div class="clearfix"></div>

        <div class="timeChoosing container-fluid">
            <h2 class="text-center">Время</h2>
            <div class="col-xs-6">
                <p class="text-center">От</p>
                <div class="form-group">
                    <div class="input-group date" id="datetimepicker10">
                        <input type="text" class="form-control"/>
                        <span class="input-group-addon">
                                <span class="glyphicon glyphicon-time"></span>
                            </span>
                    </div>
                </div>
            </div>
            <div class="col-xs-6">
                <p class="text-center">До</p>
                <div class="form-group">
                    <div class="input-group date" id="datetimepicker11">
                        <input type="text" class="form-control"/>
                        <span class="input-group-addon">
                                <span class="glyphicon glyphicon-time"></span>
                            </span>
                    </div>
                </div>
            </div>
            <script type="text/javascript">
                $(function () {
                    $("#datetimepicker10").datetimepicker({
                        format: 'LT',
                        locale: 'ru',
                    });
                    $("#datetimepicker11").datetimepicker({
                        format: 'LT',
                        locale: 'ru',
                    });
                });
            </script>
        </div>
        <div class="clearfix"></div>

        <div class="removeFilters">
            <div class="row-fluid">
                <div class="col-xs-6 col-xs-offset-3 ">
                    <button type="button" class="btn btn-default">Сбросить фильтры</button>
                </div>
            </div>
        </div>

    </div>
</div>


</div>
</body>
</html>
