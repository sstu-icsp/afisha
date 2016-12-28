
$(document).ready(function () {
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    $("#formProfile").submit(function () {
        $("#formProfile").click();
        return false;
    });

    $("#saveprofile").click(function() {
        var fullName = $('#fullName').val();
        var nickName = $('#nickNameLabel').text();
        var genderId = $('input[name=gender]:checked').val();
        var birthDate = $('#birthDate').val();
        var cityId = $('#city').val();
        var cityName = $("#city option:selected").text();

        $.ajax({
            type: "POST",
            url: "/Afisha/profile_update",
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            data: {
                fullName: fullName,
                nickName: nickName,
                genderId: genderId,
                birthDate: birthDate,
                cityId: cityId
            },
            success: function (result) {
                var genderName;
                if (genderId == 2)
                    genderName = "Мужской";
                else if (genderId == 3)
                    genderName = "Женский";
                else genderName = "Не определен";
                $('#fullNameLabel').text(fullName);
                $('#genderLabel').text(genderName);
                $('#birthDateLabel').text(birthDate);
                $('#cityLabel').text(cityName);
            },
            error: function (jqXHR) {
                console.log(jqXHR.responseText);
            }
        });
    });
})
;