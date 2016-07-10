$(document).on('ready', function () {
    $('#loginButton').on('click', function (event) {
        event.preventDefault();

        var username = $('#username').val();
        var password = $('#password').val();

        if (username === '' && password === '') {
            $('#feedback').html('Usuario y Contraseña invalidos.');

            return;
        }
        else if(username == ''){
            $('#feedback').html('Usuario invalido.');
            return;
        }
        else if (password == '' ){
            $('#feedback').html('Contraseña invalida.');
            return;
        }

        var parameters = {
            'action': 'ADMIN_LOG_IN',
            'username': username,
            'password': password
        };

        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: parameters,
            dataType: 'json',
            success: function (obj) {
                if (obj.status === "SUCCESS") {
                    location.replace("home.php");
                } else {
                    $('#feedback').html("Usuario o contraseña incorrectos.");
                }

            },
            error: function (error) {
                $('#feedback').html("Usuario o contraseña incorrectos.");
            }
        });
    });


    $('#loginButtonPanelista').on('click', function (event) {
        event.preventDefault();

        var email = $('#email').val();
        var password = $('#password').val();

        if (email === '' && password === '') {
            $('#feedback').html('Correo y Contraseña invalidos.');

            return;
        }
        else if(email == ''){
            $('#feedback').html('Correo invalido.');
            return;
        }
        else if (password == '' ){
            $('#feedback').html('Contraseña invalida.');
            return;
        }

        var parameters = {
            'action': 'PANELISTA_LOG_IN',
            'email': email,
            'password': password
        };

        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: parameters,
            dataType: 'json',
            success: function (obj) {
                if (obj.status === "SUCCESS") {
                    location.replace("home.php");
                } else {
                    $('#feedback').html("Correo o contraseña incorrectos.");
                }

            },
            error: function (error) {
                $('#feedback').html("Correo o contraseña incorrectos.");
            }
        });
    });

    $('#loginButtonCliente').on('click', function (event) {
        event.preventDefault();

        var username = $('#username').val();
        var password = $('#password').val();

        if (username === '' && password === '') {
            $('#feedback').html('Usuario y Contraseña invalidos.');

            return;
        }
        else if(username == ''){
            $('#feedback').html('Usuario invalido.');
            return;
        }
        else if (password == '' ){
            $('#feedback').html('Contraseña invalida.');
            return;
        }

        var parameters = {
            'action': 'CLIENTE_LOG_IN',
            'username': username,
            'password': password
        };

        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: parameters,
            dataType: 'json',
            success: function (obj) {
                if (obj.status === "SUCCESS") {
                    location.replace("home.php");
                } else {
                    $('#feedback').html("Correo o contraseña incorrectos.");
                }

            },
            error: function (error) {
                $('#feedback').html("Correo o contraseña incorrectos.");
            }
        });
    });
});
