<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Afisha</title>


    <script type="text/javascript" src="<c:url value='/static/js/jquery-1.11.1.min.js'/>"></script>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="<c:url value='/static/css/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/static/css/bootstrap-datetimepicker.min.css'/>">
    <script type="text/javascript" src="<c:url value='/static/js/bootstrap.min.js'/>"></script>
    <!--DateTimePicker -->

    <script type="text/javascript" src="<c:url value='/static/js/moment-with-locales.min.js'/>"></script>
    <script type="text/javascript"
            src="<c:url value='https://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/src/js/bootstrap-datetimepicker.js'/>"></script>
    <link rel="stylesheet" href="<c:url value='/static/css/index.css'/>">
    <link rel="stylesheet" href="<c:url value='/static/css/fonts-v3.css'/>">

    <!--YandexMaps-->
    <script src="<c:url value='https://api-maps.yandex.ru/2.1/?lang=ru_RU'/>" type="text/javascript"></script>
    <script type="text/javascript" src="<c:url value='/static/js/eventYandexMapsApi.js'/>"></script>
    <style>

        .rightFilters {
            border: none
        }

        .mainContent {
            border-right: 1px solid black;
        }

        #eventImage {
            height: 236px;
        }

        .eventRating {
            font-size: 25px;
        }

        .eventDescription {
            resize: none;
            background-color: white !important;
        }

        .rightFilters {
            pointer-events: none;
        }

        .mainContent li {
            pointer-events: none;
        }
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
                <a class="navbar-brand projectBrand" href="#">AFISHA</a>
            </li>
        </ul>
        <c:choose>
            <c:when test="${pageContext.request.userPrincipal.name != null}">
                <div class="navbar-form navbar-right">
                    <span id="hellospan">Привет, ${pageContext.request.userPrincipal.name}</span>
                    | <c:url value="login?logout" var="logoutUrl" />
                    <a href="${logoutUrl}">Выйти</a>
                </div>
            </c:when>
            <c:otherwise>
                <form class="navbar-form navbar-right" role="form">
                    <div class="form-group">
                        <input type="text" placeholder="Email" class="form-control">
                    </div>
                    <div class="form-group">
                        <input type="password" placeholder="Password" class="form-control">
                    </div>
                    <button type="submit" class="btn btn-success">Войти</button>
                    <button type="button" class="btn btn-warning">Регистрация</button>
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
                                <button type="button"
                                        class="btn btn-default <c:if test="${event.type.id==type.id}">active</c:if> ">
                                        ${type.name}
                                </button>
                            </li>
                        </c:forEach>
                    </ul>
                </div>

            </div>
            <div class="col-xs-4">
                <form class="form-inline pull-right" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Поиск">
                    </div>
                    <button type="submit" class="btn btn-default">Поиск</button>
                </form>
            </div>
        </div>
        <div class="clearfix"></div>
        <hr>
        <div class="col-xs-4 ">
            <div class="eventImg thumbnail">
                <img id="eventImage" class="img-responsive" src="<c:url value='/image?id=${event.image.id}' />">
            </div>
        </div>

        <div class="col-xs-8">
            <div class="row">
                <div class="col-xs-8">
                    <h1>${event.title}</h1>
                </div>
                <div class="eventRating col-xs-4">
                    <div class="pull-right">
                        <span class="glyphicon glyphicon-star-empty"></span>
                        <span class="glyphicon glyphicon-star-empty"></span>
                        <span class="glyphicon glyphicon-star-empty"></span>
                        <span class="glyphicon glyphicon-star-empty"></span>
                        <span class="glyphicon glyphicon-star-empty"></span>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <textarea readonly rows="5" class="eventDescription form-control">${event.description}</textarea>
                </div>
            </div>
            <c:if test="${event.coords ne ''}">
                <div class="row">
                    <div class="col-xs-12" id="map" style="width: 600px; height: 400px; margin-top: 10px"></div>
                    <script>
                        ymaps.ready(init);
                        var myMap;
                        var myPlacemark;
                        function init() {
                            myMap = new ymaps.Map("map", {
                                center: [${event.coords}], // Саратов
                                zoom: 11,
                                controls: ['zoomControl']
                            }, {
                                balloonMaxWidth: 200,
                                searchControlProvider: 'yandex#search'
                            });
                            myPlacemark = new ymaps.Placemark([${event.coords}]);
                            myMap.geoObjects.add(myPlacemark);
                        }
                    </script>
                </div>
            </c:if>
            <div class="row">
                <div class="col-xs-12">
                    <h3>Комментарии</h3>
                    <form class="form-group">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Введите ваш комментарий">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-comment"></span>
                            </span>
                        </div>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    Комментарии
                </div>
            </div>
        </div>
    </div>
    <!--Filters-->
    <div class="col-xs-3 rightFilters">

        <div class="city col-xs-8 col-xs-offset-2 ">

            <h2 class="text-center">Город</h2>
            <div class="row btn btn-default center-block">${event.city.name}</div>

            <fmt:parseDate value="${event.date}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate"/>

            <h2 class="text-center">Дата</h2>
            <div class="row btn btn-default center-block"><fmt:formatDate type="date" value="${parsedDate}"/></div>

            <h2 class="text-center">Время</h2>
            <div class="row btn btn-default center-block"><fmt:formatDate type="time" pattern="HH:MM"
                                                                          value="${parsedDate}"/></div>
        </div>

    </div>
</div>


</body>
</html>
