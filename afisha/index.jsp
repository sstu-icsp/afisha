<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <title>Afisha</title>

  <!-- Bootstrap -->
  <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
  <script type="text/javascript" src="js/moment-with-locales.min.js"></script>
  <script type="text/javascript" src="js/bootstrap.min.js"></script>
  <script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">
</head>
<body>
  <div class="container-fluid">  
    <div class="navbar navbar-inverse">
      <ul class="nav navbar-nav">
        <li class="active">
          <a class="navbar-brand" href="#">Afisha</a>
        </li>
      </ul>
    </div>
    <style>
      .event{background: #888; border-radius: 5px;}
      .eventImg{height:170px; margin-top: 5px;}
      .mainContent ul li{background: #999}
      .mainContent .btn-group-justified, .authentication{margin-top: 8px; margin-bottom: 8px;}
      .rightFilters{border-left:1px solid black; }
    </style>

    <div class="row-fluid">
      <div class=" col-sm-9 mainContent">
        <div class="row-fluid">
         <div class="col-sm-7">
           <div class="btn-group btn-group-justified">
            <div class="btn-group">
              <button type="button" class="btn btn-default">Фильмы</button>
            </div>
            <div class="btn-group">
              <button type="button" class="btn btn-default">Концерты</button>
            </div>
            <div class="btn-group">
              <button type="button" class="btn btn-default">Шоу</button>
            </div>
            <div class="btn-group">
              <button type="button" class="btn btn-default">Хобби</button>
            </div>
            <div class="btn-group">
              <button type="button" class="btn btn-default">Спорт</button>
            </div>
          </div>
        </div>
        <div class="col-sm-5">
          <form class="navbar-form navbar navbar" role="search">
            <div class="form-group">
              <input type="text" class="form-control" placeholder="Поиск">
            </div>
            <button type="submit" class="btn btn-default">Поиск</button>
          </form>
        </div>
      </div>

      <div class="row-fliud page-header">
        <H1>Today's Highlights, "Data"
        </H1>
      </div>
<!-- Конкретное событие -->
      <div class="row-fluid">
       <div class="col-sm-3 event">
        <a href="#" class="thumbnail eventImg">
          <img>
        </a>
        <div class="row-fluid">
          <div class="col-sm-12">
            <div class="row-fluid  pull-right">
              <span class="glyphicon glyphicon-star-empty"></span>
              <span class="glyphicon glyphicon-star-empty"></span>
              <span class="glyphicon glyphicon-star-empty"></span>
              <span class="glyphicon glyphicon-star-empty"></span>
              <span class="glyphicon glyphicon-star-empty"></span>
            </div>
            <hr>
          </div>
        </div>
        <p> Title: @TitleName</p>
        <p> Type: @TypeName</p>
      </div>
<!-- /Конкретное событие -->
    </div>
  </div>  

  <div class="col-sm-3 rightFilters">
    <div class="row-fluid authentication">
      <div class="col-sm-5">
        <button type="button" class="btn btn-default">Регистрация</button>
      </div>
      <div class="col-sm-5 col-sm-offset-1">
        <button type="button" class="btn btn-default">Авторизация</button>
      </div>
    </div>

    <div class="dateChoosing">
      <div class="row-fluid">
        <div class="col-sm-12">
          <h2 class="text-center">Дата</h2>
        </div>
      </div>
      <div class="row-fluid">
        <div class="col-xs-12">
          <div class="form-group">
            <div class="input-group date" id="datetimepicker8">
              <input type="text" class="form-control" />
              <span class="input-group-addon">
                <span class="glyphicon glyphicon-calendar"></span>
              </span>
            </div>
          </div>
        </div>
        <div class="col-xs-12">
          <div class="form-group">
            <div class="input-group date" id="datetimepicker9">
              <input type="text" class="form-control" />
              <span class="input-group-addon">
                <span class="glyphicon glyphicon-calendar"></span>
              </span>
            </div>
          </div>
        </div>
        <script type="text/javascript">
          $(function () {
           //Инициализация datetimepicker8 и datetimepicker9
           $("#datetimepicker8").datetimepicker({pickTime: false, language: 'ru'});
           $("#datetimepicker9").datetimepicker({pickTime: false, language: 'ru'});
           //При изменении даты в 8 datetimepicker, она устанавливается как минимальная для 9 datetimepicker
           $("#datetimepicker8").on("dp.change",function (e) {
             $("#datetimepicker9").data("DateTimePicker").setMinDate(e.date);
           });
            //При изменении даты в 9 datetimepicker, она устанавливается как максимальная для 8 datetimepicker
            $("#datetimepicker9").on("dp.change",function (e) {
             $("#datetimepicker8").data("DateTimePicker").setMaxDate(e.date);
           });
          });
        </script>
      </div>
    </div>

    <div class="timeChoosing">
      <div class="row-fluid">
        <div class="col-sm-12">
          <h2 class="text-center">Время</h2>
        </div>
      </div>
      <div class="row-fluid">
        <div class="col-xs-12">
          <div class="form-group">
            <div class="input-group date" id="datetimepicker8">
              <input type="text" class="form-control" />
              <span class="input-group-addon">
                <span class="glyphicon glyphicon-calendar"></span>
              </span>
            </div>
          </div>
        </div>
        <div class="col-xs-12">
          <div class="form-group">
            <div class="input-group date" id="datetimepicker9">
              <input type="text" class="form-control" />
              <span class="input-group-addon">
                <span class="glyphicon glyphicon-calendar"></span>
              </span>
            </div>
          </div>
        </div>
        <script type="text/javascript">
          $(function () {
           //Инициализация datetimepicker8 и datetimepicker9
           $("#datetimepicker8").datetimepicker({pickDate: false, language: 'ru'});
           $("#datetimepicker9").datetimepicker({pickDate: false, language: 'ru'});
           //При изменении даты в 8 datetimepicker, она устанавливается как минимальная для 9 datetimepicker
           $("#datetimepicker8").on("dp.change",function (e) {
             $("#datetimepicker9").data("DateTimePicker").setMinDate(e.date);
           });
            //При изменении даты в 9 datetimepicker, она устанавливается как максимальная для 8 datetimepicker
            $("#datetimepicker9").on("dp.change",function (e) {
             $("#datetimepicker8").data("DateTimePicker").setMaxDate(e.date);
           });
          });
        </script>
      </div>
    </div>

    <div class="cityChoosing">
      <div class="row-fluid">
        <div class="col-sm-12">
          <h2 class="text-center">Город</h2>
        </div>
      </div>
      <div class="row-fluid">
        <div class="col-sm-4 col-sm-offset-4 ">
          <button type="button" class="btn btn-default  btn-block dropdown-toggle" data-toggle="dropdown">
            Город
            <span class="caret"></span>
          </button>
          <ul class="dropdown-menu">
            <li><a href="#">Город1</a></li>
            <li><a href="#">Город2</a></li>
          </ul>

        </div>
      </div>
    </div>

    <div class="removeFilters">
      <div class="row-fluid">
        <div class="col-sm-6 col-sm-offset-3 ">
          <button type="button" class="btn btn-default">Сбросить фильтры</button>
        </div>
        </div>  
    </div>

  </div>
</div>
</div>
</body>
</html>
