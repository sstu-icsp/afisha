<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Afisha</title>

    <script type="text/javascript" src="<c:url value='/static/js/jquery-1.11.1.min.js' />"></script>
    <script type="text/javascript" src="<c:url value='/static/js/bootstrap-filestyle.min.js' />"></script>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="<c:url value='/static/css/bootstrap.min.css' />">
    <link rel="stylesheet" href="<c:url value='/static/css/bootstrap-datetimepicker.min.css' />">
    <script type="text/javascript" src="<c:url value='/static/js/bootstrap.min.js' />"></script>
    <!--DateTimePicker -->

    <script type="text/javascript" src="<c:url value='/static/js/moment-with-locales.min.js' />"></script>
    <script type="text/javascript"
            src="<c:url value='https://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/src/js/bootstrap-datetimepicker.js' />"></script>

    <link rel="stylesheet" href="<c:url value='/static/css/index.css' />">
    <link rel="stylesheet" href="<c:url value='/static/css/fonts-v3.css' />">

    <!--YandexMaps-->
    <script src="<c:url value='https://api-maps.yandex.ru/2.1/?lang=ru_RU" typeOfEvents="text/javascript' />"></script>
    <script src="<c:url value='/static/js/yandexMapsApi.js' />"></script>

    <script type="text/javascript" src="<c:url value='/static/js/createEvent.js' />"></script>
    <style>
        .addEventMain {
            padding-top: 100px;
        }

        .noresize {
            resize: none
        }

        #eventImage {
            height: 236px;
        }
        .error{
            color: red;
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
        <form class="navbar-form navbar-right authentication" role="form">
            <div class="form-group">
                <input type="text" placeholder="Email" class="form-control">
            </div>
            <div class="form-group">
                <input type="password" placeholder="Password" class="form-control">
            </div>
            <button type="submit" class="btn btn-success">Войти</button>
            <button type="button" class="btn btn-warning">Регистрация</button>
        </form>
    </div>
</div>
<!--Content-->
<div class="container-fluid">
    <div class="row-fluid addEventMain">
        <form:form commandName="eventForm" class="form-horizontal col-xs-offset-3" id="form" method="post" action="createEvent">

            <div class="form-group">
                <!--Image-->
                <div class="col-xs-3">
                    <div class="eventImg thumbnail">
                        <img id="eventImage" class="img-responsive"/>
                    </div>
                    <div class="pull-right">
                        <input type="file" formtarget="form" class="filestyle" id="imageInput" accept="image/jpeg" name="image">
                    </div>
                </div>
                <script>
                    //BootstrapFileStyle init
                    $(":file").filestyle({input: false, buttonText: "Выбрать фото", badge: false});
                </script>

                <div class="col-xs-6 col-xs-offset-1">
                    <!--Title-->
                    <div class="form-group">
                        <form:errors class="error" path="title"/>
                        <form:input path="title" id="eventTitleInput" class="form-control"
                               placeholder="Введите название события" name="title" maxlength="45"/>
                    </div>
                    <!--TypeOfEvents-->
                    <div class="form-group">
                        <form:label path="type" for="eventTypeSelect">Выберите тип события</form:label>
                        <form:select path="type" class="form-control" id="eventTypeSelect" name="typeOfEvents">
                            <c:forEach items="${types}" var="typeOfEvents">
                                <form:option value="${typeOfEvents.title}"/>
                            </c:forEach>
                        </form:select>
                    </div>
                    <!--Date-->
                    <div class="form-group">
                        <div class="row">
                            <div class="col-xs-12">
                                <form:hidden path="data" id="eventDateInput" name="date"/>
                                <div id="datetimepicker"></div>
                            </div>
                        </div>
                    </div>
                    <!--Description-->
                    <div class="form-group">
                        <form:label path="description" for="eventDescriptionInput">Краткое описание</form:label>
                        <form:textarea path="description" class="form-control noresize" rows="4" name="description"
                                  placeholder="Введите краткое описание события" id="eventDescriptionInput"/>
                    </div>
                    <!--City-->
                    <div class="form-group">
                        <label for="eventTypeSelect">Выберите город</label>
                        <form:select path="city" class="form-control" id="eventCitySelect" name="city">
                            <c:forEach items="${cities}" var="city">
                                <form:option value="${city.city}"/>
                            </c:forEach>
                        </form:select>
                    </div>
                    <!--Coords-->
                    <div class="mapChoose">
                        <div class="form-group">
                            <form:hidden path="coords" id="mapCoordsInput" name="coords"/>
                            <label>Выберите точку на карте,где будет проводиться событие</label>
                        </div>
                        <div id="map" class="form-group" style="width: 600px; height: 400px"></div>
                    </div>

                    <div class="form-group">
                        <button type="submit" class="btn btn-default">Создать событие</button>
                    </div>
                </div>
            </div>
        </form:form>
    </div>
</div>


</body>
</html>
