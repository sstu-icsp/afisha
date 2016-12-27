/**
 * Created by Леонид on 16.12.2016.
 */
$(document).ready(function () {
    $('[data-rating$=' + 1 + ']').tooltip({
        trigger: 'manual',
        placement: 'left',
        title: "Для голосования за событие необходимо авторизоваться"
    });

    $(".star").click(function () {
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        var eventId = $('#eventId').val();
        var userCreator = $('#userCreator').val();
        var rating = $(this).data("rating");

        if (userCreator == null) {
            $('[data-rating$=' + 1 + ']').tooltip('show');
            setTimeout(function () {
                $('[data-rating$=' + 1 + ']').tooltip('hide');
            }, 4000);
            return;
        }
        //AddRating
        $.ajax({
            type: "POST",
            url: "/Afisha/new_rating",
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            data: {
                eventId: eventId,
                userCreator: userCreator,
                rating: rating
            },
            success: function (result) {
                $("#userRating").html(
                    "<span> Ваша оценка: <b>" + rating + "</b></span ><br>" +
                    "<a id='deleteRating'> Удалить оценку </a>");
                $('.star').removeClass("glyphicon-star").addClass("glyphicon-star-empty");
                for (i = 1; i <= rating; i++) {
                    $('[data-rating$=' + i + ']').removeClass("glyphicon-star-empty").addClass("glyphicon-star");
                }
                eventRating = rating;
            },
            error: function (jqXHR) {
                console.log(jqXHR.responseText);
            }
        });
    });
    $("#userRating").on('click', "#deleteRating", function () {
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        var eventId = $('#eventId').val();
        var userCreator = $('#userCreator').val();

        $.ajax({
            type: "POST",
            url: "/Afisha/delete_rating",
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            data: {
                eventId: eventId,
                userCreator: userCreator
            },
            success: function (result) {
                $("#userRating").empty();
            },
            error: function (jqXHR) {
                console.log(jqXHR.responseText);
            }
        });
    })
});