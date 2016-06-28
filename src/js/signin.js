$(document).on('ready', function () {
    $('#loginButton').on('click', function (event) {
        event.preventDefault();

        var username = $('#username').val();
        var password = $('#password').val();

        if (username === '' && password === '') {
            $('#feedback').html('Faltan campos');

            return;
        }

        var parameters = {
            'action': 'LOG_IN',
            'username': username,
            'password': password
        };

        $.ajax({
            type: 'POST',
            url: 'controllers/controller.php',
            data: parameters,
            dataType: 'json',
            success: function (obj) {
                $('#feedback').html(obj.status);
            },
            error: function (error) {
                alert(error);
            }
        });
    });
});
