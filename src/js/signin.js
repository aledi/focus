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
            url: 'api/controller.php',
            data: parameters,
            dataType: 'json',
            success: function (obj) {
                //console.log(obj);
                $('#feedback').html(obj.message);
                location.replace("alta-panelistas.php");
            },
            error: function (error) {
                 $('#feedback').html("Usuario o contraseña incorrectos.");
            }
        });
    });
});
