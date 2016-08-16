'use strict';

$(document).on('ready', function () {
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

    $('#allUsers').on('click','.deleteButton', function () {
        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                'action': 'DELETE_CLIENTE',
                'id': $(this).parent().attr('value')
            },
            dataType: 'json',
            success: function (obj) {
                alert('Cliente Eliminado!');
                $(this).parent().find('td.id').remove();
            },
            error: function (errorMsg) {
                alert('Error eliminando cliente');
            }
        });
    });

    $('#allUsers').on('click','.modifyButton', function () {
        $('#headerTitle').text('Modificar Usuario');

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $('ul.tabs li').first().addClass('current');
        $("#tab-agregarUsuario").addClass('current');

        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: parameters = {
                'action': 'GET_CLIENTES',
                'id': $(this).parent().attr('value')
            },
            dataType: 'json',
            success: function (obj) {
                for (var i = 0; i < obj.results.length; i++) {
                    if (obj.results[i].id == idUser) {
                        var nombre = obj.results[i].nombre.split(' ');

                        $('#email').val(obj.results[i].email);
                        $('#fName').val(nombre[0]);
                        $('#lName').val(nombre[1]);
                        $('#lName_materno').val(nombre[2]);
                        $('#username').val(obj.results[i].username);

                        var myURL = window.location.href.split('?')[0];
                        myURL = myURL + '?id=' + obj.results[i].id;
                        history.pushState({}, null, myURL);
                    }
                }
            },
            error: function (errorMsg) {
                alert('Error modificando administrador');
            }
        });
    });
});
