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
    <script type="text/javascript" src="<c:url value='/static/js/bootstrap-filestyle.min.js' />"></script>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="<c:url value='/static/css/bootstrap.min.css' />">
    <link rel="stylesheet" href="<c:url value='/static/css/bootstrap-datetimepicker.min.css' />">
    <script type="text/javascript" src="<c:url value='/static/js/bootstrap.min.js' />"></script>
    <link rel="stylesheet" href="<c:url value='/static/css/index.css' />">
    <link rel="stylesheet" href="<c:url value='/static/css/fonts-v3.css' />">

    <!--YandexMaps-->
    <script src="<c:url value='https://api-maps.yandex.ru/2.1/?lang=ru_RU" type="text/javascript' />"></script>
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
        <form:form method="POST" id="form" action="new" modelAttribute="event" cssClass="form-horizontal col-xs-offset-3" enctype="multipart/form-data">
            <div class="form-group">
                <!--Image-->
                <div class="col-xs-3">
                    <div class="eventImg thumbnail">
                        <img id="eventImage" class="img-responsive"/>
                    </div>
                    <div class="pull-right">
                        <input type="file" class="filestyle" id="imageInput" accept="image/jpeg" name="eventimg">
                    </div>
                </div>
                <script>
                    //BootstrapFileStyle init
                    $(":file").filestyle({input: false, buttonText: "Выбрать фото", badge: false});
                </script>

                <div class="col-xs-6 col-xs-offset-1">
                    <!--Title-->
                    <div class="form-group">
                        <div><form:errors class="error" path="title"/></div>
                        <label for="eventTitleInput">Введите название события</label>
                        <form:input path="title" id="eventTitleInput" cssClass="form-control" maxlength="45" placeholder="Введите название события" />
                    </div>
                    <!--Type-->
                    <div class="form-group">
                        <label for="eventTypeSelect">Выберите тип события</label>
                        <form:select path="typeId" id="eventTypeSelect" items="${types}" itemLabel="name" itemValue="id" cssClass="form-control" />
                    </div>
                    <!--Date-->
                    <div class="form-group">
                        <div><form:errors class="error" path="date"/></div>
                        <label for="datetimepicker">Выберите дату и время</label>
                        <div class="input-group" id="datetimepicker">
                            <form:input path="date" id="eventDateInput" cssClass="form-control" />
                            <span class="input-group-addon">
                                <span class="glyphicon-calendar glyphicon"></span>
                            </span>
                        </div>
                        <script src="<c:url value='/static/js/moment-with-locales.min.js' />"></script>
                        <script src="<c:url value='/static/js/bootstrap-datetimepicker.min.js' />"></script>
                        <script type="text/javascript">
                            $(function () {
                                var dateNow = new Date();
                                $('#datetimepicker').datetimepicker({language: 'ru', format: 'DD-MM-YYYY HH:mm:ss', inline: true, sideBySide: true, defaultDate:dateNow});
                            });
                        </script>
                    </div>
                    <!--Description-->
                    <div class="form-group">
                        <label for="eventDescriptionInput">Краткое описание</label>
                        <form:textarea path="description" id="eventDescriptionInput" cssClass="form-control noresize" rows="4" placeholder="Введите краткое описание события" />
                    </div>
                    <!--City-->
                    <div class="form-group">
                        <label for="eventTypeSelect">Выберите город</label>
                        <form:select path="cityId" items="${cities}" id="eventCitySelect" itemLabel="name" itemValue="id" cssClass="form-control" />
                    </div>
                    <!--Coords-->
                    <div class="mapChoose">
                        <div class="form-group">
                            <form:hidden path="coords" id="mapCoordsInput" name="coords" />
                            <label>Выберите точку на карте,где будет проводиться событие</label>
                        </div>
                        <div id="map" class="form-group" style="width: 600px; height: 400px"></div>
                    </div>

                    <form:hidden path="creatorId" value="1" />

                    <div class="form-group">
                        <form:button type="submit" class="btn btn-default">Создать событие</form:button>
                    </div>
                </div>
            </div>
        </form:form>
    </div>
</div>

</body>
</html>
