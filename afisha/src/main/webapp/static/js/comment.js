$(document).ready(function () {
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    $('#comment').tooltip({
        trigger: 'manual',
        placement: 'left',
        title: "Введите текст комментария"
    });

    $("#sendComment").click(function () {
        var eventId = $('#eventId').val();
        var userCreator = $('#userCreator').val();
        var userPic = $("#userPic").val();
        var comment = $('#comment').val();

        if (comment == '' || comment == null) {
            $('#comment').tooltip('show');
            setTimeout(function () {
                $('#comment').tooltip('hide');
            }, 4000);
            return;
        }

        $.ajax({
            type: "POST",
            url: "/Afisha/new_comment",
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            data: {
                eventId : eventId,
                userCreator : userCreator,
                comment : comment
            },
            success: function(result) {
                var comment_block = '<div class="media">' +
                    '<a class="pull-left" href="/Afisha/profile/'+ userCreator +'">' +
                    '<img class="media-object" src="/Afisha/image?id='+ userPic +
                    ' alt="'+userCreator+'" width="100px" height="64px" width="100px" height="64px" /></a>' +
                    '<div class="media-body" id="comment_'+result+'" data-commentid="'+result+'">' +
                    '<span class="btn-group pull-right normalcomment commentbtns">' +
                    '<span class="glyphicon glyphicon-pencil"></span>' +
                    '<span class="glyphicon glyphicon-remove removecom"></span>' +
                    '</span>' +
                    '<span class="btn-group pull-right editcomment commentbtns">' +
                    '<span class="glyphicon glyphicon-ok"></span>' +
                    '<span class="glyphicon glyphicon-remove cancelcom"></span>' +
                    '</span>' +
                    '<h4 class="media-heading">'+userCreator+'</h4>' +
                    '<div class="normalcomment">'+comment+'</div>' +
                    '<textarea class="form-control editcomment" rows="1">'+comment+'</textarea>' +
                    '</div></div>';
                $("#comments_block").append(comment_block);
                $("#comment").val(""); // clear comment input
            },
            error: function(jqXHR) {
                console.log(jqXHR.responseText);
            }
        });
    });

    $('#comments_block').on('click', '.glyphicon-pencil', function() {
        $(".editcomment").hide();
        $(".normalcomment").show();
        $(this).parent().parent().find(".normalcomment").hide();
        $(this).parent().parent().find(".editcomment").show();
    });

    $('#comments_block').on('click', '.glyphicon-ok', function() {
        var parent = $(this).parent().parent();
        $(parent).find(".normalcomment").show();
        $(parent).find(".editcomment").hide();

        var userCreator = $('#userCreator').val();
        var comment = $(parent).find("textarea").val();
        var commentId = $(parent).data("commentid");

        $.ajax({
            type: "POST",
            url: "/Afisha/update_comment",
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            data: {
                userCreator : userCreator,
                comment : comment,
                commentId: commentId
            },
            success: function(result) {
                $(parent).find(".commenttext").text(comment);
            },
            error: function(jqXHR) {
                console.log(jqXHR.responseText);
            }
        });
    });

    $('#comments_block').on('click', '.removecom', function() {
        var parent = $(this).parent().parent();
        var userCreator = $('#userCreator').val();
        var commentId = $(parent).data("commentid");
        $.ajax({
            type: "POST",
            url: "/Afisha/remove_comment",
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            data: {
                userCreator : userCreator,
                commentId: commentId
            },
            success: function(result) {
                $(parent).parent().remove();
            },
            error: function(jqXHR) {
                console.log(jqXHR.responseText);
            }
        });
    });

    $('#comments_block').on('click', '.cancelcom', function() {
        $(this).parent().parent().find(".normalcomment").show();
        $(this).parent().parent().find(".editcomment").hide();
    });
});