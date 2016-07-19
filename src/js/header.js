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
            }
            else {
                //alert("Please login to continue");
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
});