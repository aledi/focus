'use strict';

$(document).on('ready', function () {
    $('#loginButton').on('click', function (event) {
        event.preventDefault();

        var username = $('#username').val();
        var password = $('#password').val();

        if (username === '' && password === '') {
            $('#feedback').html('Por favor, indique su usuario y contraseña');
            return;
        } else if (username === '') {
            $('#feedback').html('Por favor, indique su usuario');
            return;
        } else if (password === '') {
            $('#feedback').html('Por favor, indique su contraseña');
            return;
        }

        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: {
                'action': 'WEB_LOG_IN',
                'username': username,
                'password': password
            },
            dataType: 'json',
            success: function (response) {
                if (response.status === 'SUCCESS') {
                    location.replace(response.tipo === 1 ? 'reportes.php' : 'panelistas.php');
                } else {
                    $('#feedback').html('Usuario o contraseña incorrectos');
                }
            },
            error: function (error) {
                $('#feedback').html('Usuario o contraseña incorrectos ERROR.');
            }
        });
    });
});
