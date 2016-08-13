'use strict';

$(document).on('ready', function () {

    $('#sendInfoAdmin').on('click', function (event) {
        var idAdministrador = window.location.search.substring(1)
        idAdministrador = idAdministrador.substring(3);

        var email = $('#email').val();
        var nombre = $('#fName').val();
        var apPaterno = $('#lName').val();
        var apMaterno = $('#lName_materno').val();
        var username = $('#username').val();
        var password = $('#password').val();
        var passwordConf = $('#passwordConf').val();

        if (username === '' || password === '' || email === '' || nombre === '' || apPaterno === '' || apMaterno === '') {
            $('#feedback').html('Favor de llenar todos los campos');
            return;
        }

        if (password != passwordConf) {
            $('#feedback').html('Las contraseñas no coinciden.');
            return;
        }

        var parameters = {
            'action': 'ALTA_ADMIN',
            'nombre': nombre,
            'apPaterno': apPaterno,
            'apMaterno': apMaterno,
            'email': email,
            'username': username,
            'password': password
        };

        if (idAdministrador != '') {
            parameters.id = idAdministrador;
        }

        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: parameters,
            dataType: 'json',
            success: function (obj) {
                alert('Adminsitrador añadido exitosamente.');
            },
            error: function (error) {
                $('#feedback').html('Administrador no añadido, ha ocurrido un error.');
            }
        });
    });

    $('#sendInfoCliente').on('click', function (event) {
        var idCliente = window.location.search.substring(1)
        idCliente = idCliente.substring(3);

        var email = $('#email').val();
        var nombre = $('#fName').val();
        var apPaterno = $('#lName').val();
        var apMaterno = $('#lName_materno').val();
        var username = $('#username').val();
        var password = $('#password').val();
        var passwordConf = $('#passwordConf').val();

        if (username === '' || password === '' || email === '' || nombre === '' || apPaterno === '' || apMaterno === '') {
            $('#feedback').html('Favor de llenar todos los campos');
            return;
        }

        if (password != passwordConf) {
            $('#feedback').html('Las contraseñas no coinciden.');
            return;
        }

        var parameters = {
            'action': 'ALTA_CLIENTE',
            'nombre': nombre,
            'apPaterno': apPaterno,
            'apMaterno': apMaterno,
            'email': email,
            'username': username,
            'password': password
        };

        if (idCliente != '') {
            parameters.id = idCliente;
        }

        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: parameters,
            dataType: 'json',
            success: function (obj) {
                alert('Cliente añadido exitosamente.');
            },
            error: function (error) {
                $('#feedback').html('Cliente no añadido, ha ocurrido un error.');
            }
        });
    });

    var flagLoading = 0;
    setTimeout(function () {
        var parameters = {
            'action': 'GET_ADMINS'
        };

        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: parameters,
            dataType: 'json',
            success: function (obj) {
                if (flagLoading == 0) {
                    var currentHTML = '<tr>';
                    currentHTML += '<th></th>';
                    currentHTML += '<th>Username</th>';
                    currentHTML += '<th>Nombre</th>';
                    currentHTML += '<th>Correo</th>';
                    currentHTML += '<th colspan="2">Acción</th>';
                    currentHTML += '</tr>';

                    for (var i = 0; i < obj.results.length; i++) {
                        currentHTML += '<tr value="'+ obj.results[i].id +'">';
                        currentHTML += '<td></td>';
                        currentHTML += '<td>' + obj.results[i].username+'</td>';
                        currentHTML += '<td>' + obj.results[i].nombre+'</td>';
                        currentHTML += '<td>' + obj.results[i].email+'</td>';
                        currentHTML += '<td class=modifyButton><input id= modify type=  submit  value= Modificar ></td>'
                        currentHTML += '<td class=deleteButton><input id= delete type=  submit  value= Eliminar ></td>';
                        currentHTML += '</tr>';

                        $('#allAdmin').append(currentHTML);
                        currentHTML = '';
                    }

                    flagLoading = 1;
                }
            },
            error: function (error) {
                $('#feedback').html('Error cargando los administradores.');
            }
        });
    });

    var flagLoadingUser = 0;
    $('#tab-modUser').on('click', function (event) {
        event.preventDefault();
    }, 500);

    setTimeout(function (event) {
        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: {'action': 'GET_CLIENTES'},
            dataType: 'json',
            success: function (obj) {
                var currentHTML = '<tr>';
                currentHTML += '<th></th>';
                currentHTML += '<th>Username</th>';
                currentHTML += '<th>Nombre</th>';
                currentHTML += '<th>Correo</th>';
                currentHTML += '<th colspan="2">Acción</th>';
                currentHTML += '</tr>';

                for (var i = 0; i < obj.results.length; i++) {
                    currentHTML += '<tr value="'+ obj.results[i].id + '">';
                    currentHTML += '<td></td>';
                    currentHTML += '<td>' + obj.results[i].username+'</td>';
                    currentHTML += '<td>' + obj.results[i].nombre+'</td>';
                    currentHTML += '<td>' + obj.results[i].email+'</td>';
                    currentHTML += '<td class=modifyButton><input id= modify type=  submit  value= Modificar ></td>';
                    currentHTML += '<td class=deleteButton><input id= delete type=  submit  value= Eliminar ></td>';
                    currentHTML += '</tr>';

                    $('#allUsers').append(currentHTML);
                    currentHTML = '';
                }
            },
            error: function (error) {
                $('#feedback').html('Error cargando los clientes.');
            }
        });
    }, 500);
});
