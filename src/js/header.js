$(document).on('ready', function () {

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