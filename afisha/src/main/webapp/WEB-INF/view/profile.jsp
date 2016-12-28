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

    <script type="text/javascript" src="<c:url value='/static/js/bootstrap-filestyle.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/static/js/createEvent.js'/>"></script>
</head>
<body>
<style>


    .top {
        margin-top: 100px;
    }

    .dataTitle {
        border-right: 1px solid #eee;
    }

    .userData .dataTitle {
        font-size: 22px;
    }
    .eventImg{cursor: pointer;}


</style>
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
<div class="container-fluid">
    <div class="row top">

    </div>
    <div class="row">
        <!--Content-->
        <div class="col-xs-2 col-xs-offset-1">
            <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="#info" data-toggle="tab">Информация</a></li>
                <li><a href="#myEvents" data-toggle="tab">Мои события</a></li>
                <li><a href="#monitoredEvents" data-toggle="tab">Отслеживаемые события</a></li>
            </ul>
        </div>
        <div class="col-xs-8">
            <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane fade in active" id="info">
                    <div class="col-xs-3">
                        <div class="eventImg thumbnail">
                            <img src="<%=request.getContextPath()%>/image?id=${user.image.id}"
                                 class="eventImg img-responsive"/>
                        </div>
                    </div>



                    <div class="col-xs-9 userData">
                        <div class="row userName">
                            <div class="col-xs-4 dataTitle">
                                <p>Имя</p>
                            </div>
                            <div class="col-xs-8">
                                <p>${user.fullName}</p>
                            </div>
                        </div>
                        <div class="row userNick">
                            <div class="col-xs-4 dataTitle">
                                <p>Ник</p>
                            </div>
                            <div class="col-xs-8">
                                <p>${user.nickName}</p>
                            </div>
                        </div>
                        <div class="row userGender">
                            <div class="col-xs-4 dataTitle">
                                <p>Пол</p>
                            </div>
                            <div class="col-xs-8">
                                <p>${user.gender.name}</p>
                            </div>
                        </div>
                        <div class="row userBirthday">
                            <div class="col-xs-4 dataTitle">
                                <p>День рождения</p>
                            </div>
                            <div class="col-xs-8">
                                <p>${user.birthDate}</p>
                            </div>
                        </div>
                        <div class="row userCity">
                            <div class="col-xs-4 dataTitle">
                                <p>Город</p>
                            </div>
                            <div class="col-xs-8">
                                <p>${user.city.name}</p>
                            </div>
                        </div>
                        <div class="row">
                            <a class="btn btn-default pull-right" href="#infoEdit"
                               data-toggle="tab">Редактировать</a>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="infoEdit">
                    <div class="col-xs-3">
                        <div class="eventImg thumbnail">
                            <img src="<%=request.getContextPath()%>/image?id=${user.image.id}"
                                 class=" eventImg img-responsive" id="eventImage"/>
                        </div>
                        <div class="pull-right">
                            <input type="file" class="filestyle" id="imageInput" accept="image/jpeg">
                        </div>
                        <script>
                            //BootstrapFileStyle init
                            $(":file").filestyle({input: false, buttonText: "Изменить фото", badge: false});
                        </script>
                    </div>
                    <div class="col-xs-9 userData">
                        <form:form>
                            <div class="row userName">
                                <div class="col-xs-4 dataTitle">
                                    <p>Имя</p>
                                </div>
                                <div class="col-xs-8">
                                    <div class="form-group">
                                        <input type="text" class="form-control" value="${user.fullName}">
                                    </div>
                                </div>
                            </div>
                            <div class="row userNick">
                                <div class="col-xs-4 dataTitle">
                                    <p>Ник</p>
                                </div>
                                <div class="col-xs-8">
                                    <div class="form-group">
                                        <input type="text" class="form-control" value="${user.nickName}">
                                    </div>
                                </div>
                            </div>
                            <div class="row userGender">
                                <div class="col-xs-4 dataTitle">
                                    <p>Пол</p>
                                </div>
                                <div class="col-xs-8">
                                    <div class="form-group">
                                        <div class="radio-inline">
                                            <label>
                                                <input id="radioMale" name="gender" type="radio" <c:if
                                                        test="${user.gender.name.equals('Мужской')}"> checked</c:if>>
                                                Мужской
                                            </label>
                                        </div>
                                        <div class="radio-inline">
                                            <label><input id="radioFemale" name="gender" type="radio" <c:if
                                                    test="${user.gender.name.equals('Женский')}"> checked</c:if>>
                                                Женский
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row userBirthday">
                                <script type="text/javascript">
                                    $(function () {
                                        $('#datetimepicker').datetimepicker({
                                            locale: 'ru',
                                            format: 'DD/MM/YYYY',
                                            defaultDate: "${user.birthDate}"
                                        });
                                    });
                                </script>
                                <div class="col-xs-4 dataTitle">
                                    <p>День рождения</p>
                                </div>
                                <div class="col-xs-8">
                                    <div class="form-group">
                                        <div class='input-group date' id='datetimepicker'>
                                            <input type='text' class="form-control"/>
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar">
                                            </span>
                                        </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row userCity">
                                <div class="col-xs-4 dataTitle">
                                    <p>Город</p>
                                </div>
                                <div class="col-xs-8">
                                    <div class="form-group">
                                        <select class="form-control">
                                            <c:forEach items="${cities}" var="city">
                                                <option>
                                                        ${city.name}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <a class="btn btn-default pull-right" href="#info"
                                   data-toggle="tab">Сохранить</a>
                            </div>
                        </form:form>
                    </div>
                </div>
                <div class="tab-pane fade" id="myEvents">
                </div>
                <div class="tab-pane fade" id="monitoredEvents"></div>
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
                    $('.eventImg').click(function(e) {
                        e.preventDefault();
                        $('#image-modal .modal-body img').attr('src', $(this).find('img').attr('src'));
                        $("#image-modal").modal('show');
                    });
                    $('#image-modal .modal-body img').on('click', function() {
                        $("#image-modal").modal('hide')
                    });
                });
            </script>
        </div>
    </div>
</div>
</body>
</html>
