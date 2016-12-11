$(document).ready(function () {
    $(".input-group-addon").click(function () {
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        var eventId = $('#eventId').val();
        var userCreator = $('#userCreator').val();
        var userPic = $("#userPic").val();
        var comment = $('#comment').val();

        $.ajax({
            type: "POST",
            url: "/afisha/new_comment",
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            data: {
                eventId : eventId,
                userCreator : userCreator,
                comment : comment
            },
            success: function(result) {
                $("#comments_block").append('<div style="border: 1px solid black">' +
                    '<a href="/afisha/profile/"'+ userCreator +'>'+userCreator+'</a>' +
                    '<a href="/afisha/profile/"'+ userCreator +'><img src="/afisha/image?id="'+ userPic +' /></a>' +
                    '<span>' + comment +'</span>' +
                '</div>'); // addcomment
                $(".input-group-addon").val(""); // clear comment input
            },
            error: function(jqXHR) {
                console.log(jqXHR.responseText);
            }
        });
    });
});