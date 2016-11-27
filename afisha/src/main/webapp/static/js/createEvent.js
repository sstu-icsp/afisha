//ImageInputTooltip, eventTitleInput, DateTimePicker init
$(document).ready(function () {
    $('.bootstrap-filestyle').tooltip({
        trigger: 'manual',
        placement: 'left',
        title: "Загружено",
        html: true
    });

    $('#eventTitleInput').tooltip({
        trigger: 'manual',
        title: "Поле обязательно для заполнения",
    });
});

//Validation
$(document).ready(function () {
    //ImageValidation
    $("#imageInput").change(function () {
        if ($(this)[0].files.length == 0)return;
        // Устанавливаем настройки
        // Флаг для валидации расширения файла
        var good_ext = false;
        // Флаг для валидации размера файла
        var good_size = false;
        // Разрешенные расширения файла
        var ext_arr = ['jpg', 'jpeg', 'png', 'gif'];
        // Максимальный размер 1MB
        var maxsize = 1024 * 1024;

        // Для хранения размера загружаемого файла
        var iSize = 0;

        iSize = $(this)[0].files[0].size;

        // Делаем проверку что файл не превышает допустимого размера
        if (maxsize > iSize) {
            // Если файл допустимого размера - выставляем флаг
            good_size = true;
        }
        // Пробегаемся по нашему массиву разрешенных типов файлов
        for (var i in ext_arr) {
            // Если совпадения найдены
            if ('image/' + ext_arr[i] == $(this)[0].files[0].type) {
                // Выставляем флаг - что расширение файла допустимо
                good_ext = true;
            }
        }
        // Для хранения ошибки
        var error = '';
        // Если расширение не совпадает с фильтром
        if (!good_ext) {
            error += "Неверное расширение фото. Поддерживаемые форматы: .jpg, .jpeg, .png, .gif";
        }
        // Если у нас уже есть ошибка - ставим переход на новую строку
        if (error != '') {
            error += "<br/><br/>";
        }
        // Если не прошли валидацию по размеру файла
        if (!good_size) {
            error += "Слишком большой файл. Максимальный размер загружаемого файла: 1МБ";
        }
        // Если есть ошибки
        if (error != '') {
            // очищаем значение input file
            $(this).val(null);
        }
        else {
            error = "Загружено";
            $("#eventImage")[0].src = window.URL.createObjectURL(this.files[0]);
        }
        $('.bootstrap-filestyle').attr('data-original-title', error)
            .tooltip('fixTitle')
            .tooltip('show');
        setTimeout(function () {
            $('.bootstrap-filestyle').tooltip('hide');
        }, 4000);
    });


    //TitleValidation
    var title = $('#eventTitleInput');
    $('#form').submit(function () {

        if (title[0].value.length === 0) {
            title.tooltip('show');
            title.parent('.form-group').addClass('has-error').removeClass('has-success');
            $('html, body').animate({ scrollTop: $('.container-fluid').offset().top }, 500);
            return false;
        }
        else {
            title.tooltip('hide');
            title.parent('.form-group').addClass('has-success').removeClass('has-error');
            return true;
        }
    });
    $('#form').on('keydown', 'input', function () {

        title.tooltip('hide');
        title.parent('.form-group').addClass('has-success').removeClass('has-error');
    })

});


