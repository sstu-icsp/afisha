$(document).ready(function () {
    $("#sendComment").click(function () {
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        var eventId = $('#eventId').val();
        var userCreator = $('#userCreator').val();
        var userPic = $("#userPic").val();
        var comment = $('#comment').val();

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
                $("#comments_block").append(
                '<div class="media">'+
                    '<a class="pull-left" href="/Afisha/profile/'+ userCreator +'">'+
                        '<img class="media-object" src="/Afisha/image?id='+ userPic +
                                    '" alt="'+userCreator+'" width="100px" height="64px"/>'+
                    '</a>'+
                    '<div class="media-body">'+
                    '<h4 class="media-heading">'+userCreator+'</h4>'+
                    comment+
                    '</div>'+
                '</div>');
                $("#comment").val(""); // clear comment input
            },
            error: function(jqXHR) {
                console.log(jqXHR.responseText);
            }
        });
    });
});