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
    <script typeOfEvents="text/javascript" src="<c:url value='/static/js/jquery-1.11.1.min.js' />"></script>
    <script typeOfEvents="text/javascript" src="<c:url value='/static/js/moment-with-locales.min.js' />"></script>
    <script typeOfEvents="text/javascript" src="<c:url value='/static/js/bootstrap.min.js' />"></script>
    <script typeOfEvents="text/javascript" src="<c:url value='/static/js/bootstrap-datetimepicker.js' />"></script>
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
        <form class="navbar-form navbar-right authentication" role="form">
            <div class="form-group">
                <input typeOfEvents="text" placeholder="Email" class="form-control">
            </div>
            <div class="form-group">
                <input typeOfEvents="password" placeholder="Password" class="form-control">
            </div>
            <button typeOfEvents="submit" class="btn btn-success">Войти</button>
            <button typeOfEvents="button" class="btn btn-warning">Регистрация</button>
        </form>
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
                        <li>
                            <button typeOfEvents="button" class="btn btn-default">Фильмы</button>
                        </li>
                        <li>
                            <button typeOfEvents="button" class="btn btn-default">Концерты</button>
                        </li>
                        <li>
                            <button typeOfEvents="button" class="btn btn-default">Шоу</button>
                        </li>
                        <li>
                            <button typeOfEvents="button" class="btn btn-default">Хобби</button>
                        </li>
                        <li>
                            <button typeOfEvents="button" class="btn btn-default">Спорт</button>
                        </li>
                        <li>
                            <button typeOfEvents="button" class="btn btn-default">Театр</button>
                        </li>
                    </ul>
                </div>

                <!--В будущем этот скрипт будет фильтровать события при клике-->
                <script typeOfEvents="text/javascript">
                    $(document).ready(function () {
                        $("#genreTypesButton .btn").click(function () {
                            $("#genreTypesButton .btn.active").button('toggle')
                            $(this).button('toggle');
                        });
                    });
                </script>
            </div>
            <div class="col-xs-4">
                <form class="form-inline pull-right" role="search">
                    <div class="form-group">
                        <input typeOfEvents="text" class="form-control" placeholder="Поиск">
                    </div>
                    <button typeOfEvents="submit" class="btn btn-default">Поиск</button>
                </form>
            </div>
        </div>
        <div class="clearfix"></div>
        <hr>
        <H3>Сегодняшние мероприятия, @Today.Date
        </H3>
        <div class="row-fluid">
            <!-- Конкретное событие -->
            <c:forEach items="${events}" var="event">
                <div class="col-xs-3">
                    <div class="thumbnail">
                        <img src="<c:url value='/image?id=${event.image.id}' />" alt="EventImg">
                        <div class="caption">
                            <div class="pull-right">
                                <span class="glyphicon glyphicon-star-empty"></span>
                                <span class="glyphicon glyphicon-star-empty"></span>
                                <span class="glyphicon glyphicon-star-empty"></span>
                                <span class="glyphicon glyphicon-star-empty"></span>
                                <span class="glyphicon glyphicon-star-empty"></span>
                            </div>
                            <h3>${event.title}</h3>
                            <h4>${event.city.city}</h4>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <!-- /Конкретное событие -->
        </div>
    </div>
    <!--Filters-->
    <div class="col-xs-3 rightFilters">

        <a href="<c:url value='/createEvent'/>" class="btn btn-default center-block">Добавить событие</a>

        <div class="cityChoosing ">
            <h2 class="text-center">Город</h2>
            <div class="col-xs-8 col-xs-offset-2 ">
                <button typeOfEvents="button" class="btn btn-default  btn-block dropdown-toggle" data-toggle="dropdown">
                    Выберите город
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><a href="#">Город1</a></li>
                    <li><a href="#">Город2</a></li>
                </ul>
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
            <script typeOfEvents="text/javascript">
                $(function () {
                    var minDate = new Date();
                    //Когда будут работать запросы из БД, минимальную дату в календаре можно изменить на дату самого раннего на данный момент события
                    minDate.setMonth(minDate.getMonth() - 1);
                    $("#datetimepicker8").datetimepicker({
                        format: 'DD/MM/YYYY',
                        minDate: minDate,
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
                        <input typeOfEvents="text" class="form-control"/>
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
                        <input typeOfEvents="text" class="form-control"/>
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-time"></span>
                            </span>
                    </div>
                </div>
            </div>
            <script typeOfEvents="text/javascript">
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
                    <button typeOfEvents="button" class="btn btn-default">Сбросить фильтры</button>
                </div>
            </div>
        </div>

    </div>
</div>


</div>
</body>
</html>
