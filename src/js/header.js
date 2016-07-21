$(document).on('ready', function () {
	parameters = {
        'action' : 'VERIFY_SESSION'
    };

    $.ajax({
        type: 'POST',
        url: '../api/controller.php',
        data: parameters,
        dataType: 'json',
        success: function (obj) {
            if (obj.status == 'SUCCESS') {
                console.log(obj.username);
                document.getElementsByTagName("html")[0].style.visibility = "visible";
            }
            else {
                window.location.replace('signin.php');
            }

        },
        error: function (error) {
            alert("Please login to continue");
            window.location.replace('signin.php');
        }
    });

    $('.signOutButton').on('click', function (event) {
        event.preventDefault();

        var parameters = {
            'action': 'LOG_OUT'
        };

        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: parameters,
            dataType: 'json',
            success: function (obj) {
                if (obj.status === "SUCCESS") {
                    alert("¡Hasta pronto!");
                    location.replace("signin.php");
                }
            }
        });
    });
 
    $('ul.tabs li').click(function(){
        var tab_id = $(this).attr('data-tab');

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $(this).addClass('current');
        $("#"+tab_id).addClass('current');
    });

});
