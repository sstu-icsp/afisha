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
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
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
    <script type="text/javascript" src="<c:url value='/static/js/comment.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/static/js/rating.js'/>"></script>
    <style>
        .rightFilters {
            border: none
        }

        #deleteRating {
            cursor: pointer;
        }

        .mainContent {
            border-right: 1px solid black;
        }

        .eventRating .glyphicon {
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

        .input-group-addon {
            cursor: pointer;
        }

        .commentbtns {
            -webkit-transition: opacity 0.3s ease-in-out;
            -moz-transition: opacity 0.3s ease-in-out;
            -ms-transition: opacity 0.3s ease-in-out;
            -o-transition: opacity 0.3s ease-in-out;
            transition: opacity 0.3s ease-in-out;
            opacity: 0;
        }

        .media-body:hover .commentbtns {
            opacity: 1;
        }

        .editcomment {
            display: none;
        }
        #eventImage{cursor:pointer;}

    </style>
</head>
<body>

<!--Header-->
<div class="navbar navbar-inverse">
    <div class="container-fluid">
        <ul class="nav navbar-nav">
            <li class="active">
                <a class="navbar-brand projectBrand" href="<%=request.getContextPath()%>/">AFISHA</a>
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
        <div class="col-xs-4 ">
            <div class="eventImg thumbnail">
                <img id="eventImage" class="img-responsive" src="<c:url value='/image?id=${event.image.id}' />">
            </div>
        </div>

        <div class="modal fade" id="image-modal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <div class="modal-title">Просмотр изображения</div>
                    </div>
                    <div class="modal-body">
                        <img class="img-responsive center-block" src="" alt="">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(function() {
                $('#eventImage').click(function(e) {
                    e.preventDefault();
                    $('#image-modal .modal-body img').attr('src', $(this).attr('src'));
                    $("#image-modal").modal('show');
                });
                $('#image-modal .modal-body img').on('click', function() {
                    $("#image-modal").modal('hide')
                });
            });
        </script>

        <div class="col-xs-8">
            <div class="row">
                <div class="col-xs-8">
                    <h1 class="eventTitle">${event.title}</h1>
                </div>
                <script>
                    var eventRating=${event.rating}
                        $(document).ready(function () {

                            $('.star').mouseover(function () {
                                $('.star').removeClass("glyphicon-star").addClass("glyphicon-star-empty");
                                for(i=1;i<=$(this).data("rating");i++){
                                    $('[data-rating$='+i+']').removeClass("glyphicon-star-empty").addClass("glyphicon-star");
                                }
                            })
                            $('.star').mouseout(function () {
                                $('.star').removeClass("glyphicon-star").addClass("glyphicon-star-empty");
                                for(i=1;i<=eventRating;i++){
                                    $('[data-rating$='+i+']').removeClass("glyphicon-star-empty").addClass("glyphicon-star");
                                }
                            })

                        });

                </script>
                <div class="eventRating col-xs-4">
                    <div class="pull-right">
                        <c:forEach var="i" begin="1" end="${event.rating}">
                            <span class="glyphicon glyphicon-star star" data-rating="${i}"></span>
                        </c:forEach>
                        <c:forEach var="i" begin="${event.rating+1}" end="5">
                            <span class="glyphicon glyphicon-star-empty star" data-rating="${i}"></span>
                        </c:forEach>
                    </div>
                    <div class="pull-right" id="userRating">
                        <c:if test="${pageContext.request.userPrincipal.name != null&&event.userRating!=0}">
                            <span>Ваша оценка: <b>${event.userRating}</b></span><br>
                            <a id='deleteRating'>Удалить оценку </a>
                        </c:if>
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
                    <c:choose>
                        <c:when test="${user != null}">
                            <h3>Оставьте комментарий</h3>
                            <form class="form-group">
                                <div class="input-group">
                                    <input type="text" id="comment" class="form-control" placeholder="Введите ваш комментарий" required="required">
                                    <span class="input-group-addon" id="sendComment">
                                        <span class="glyphicon glyphicon-comment"></span>
                                    </span>
                                </div>
                                <input type="hidden" id="eventId" value="${event.id}"/>
                                <input type="hidden" id="userCreator" value="${user.nickName}"/>
                                <input type="hidden" id="userPic" value="${user.image.id}"/>
                            </form>
                        </c:when>
                        <c:otherwise>
                            <span>Авторизуйтесь чтобы оставить комментарий</span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-12" id="comments_block">
                    <c:forEach items="${comments}" var="comment">
                        <div class="media">
                            <a class="pull-left" href="<%=request.getContextPath()%>/profile/${comment.user.nickName}">
                                <img class="media-object" src="<c:url value='/image?id=${comment.user.image.id}' />" alt="${comment.user.nickName}" width="100px" height="64px">
                            </a>
                            <div class="media-body" id="comment_${comment.id}" data-commentid="${comment.id}">
                                <c:if test="${comment.user.nickName == pageContext.request.userPrincipal.name}">
                                    <span class="btn-group pull-right normalcomment commentbtns">
                                        <span class="glyphicon glyphicon-pencil"></span>
                                        <span class="glyphicon glyphicon-remove removecom"></span>
                                    </span>
                                    <span class="btn-group pull-right editcomment commentbtns">
                                        <span class="glyphicon glyphicon-ok"></span>
                                        <span class="glyphicon glyphicon-remove cancelcom"></span>
                                    </span>
                                </c:if>
                                <h4 class="media-heading">${comment.user.nickName}</h4>
                                <div class="normalcomment commenttext">${comment.comment}</div>
                                <c:if test="${comment.user.nickName == pageContext.request.userPrincipal.name}">
                                    <textarea class="form-control editcomment" rows="1">${comment.comment}</textarea>
                                </c:if>
                            </div>
                        </div>
                    </c:forEach>
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
