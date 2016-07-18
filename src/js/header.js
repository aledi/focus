$(document).on('ready', function () {
	parametersSession = }
        'action' : 'VERIFY_SESSION'
    };


    $.ajax({
        type: 'POST',
        url: '../api/controller.php',
        data: parameters,
        dataType: 'json',
        success: function (obj) {
            console.log(obj.username);

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