'use strict';

$(document).on('ready', function () {
    setTimeout(function (event) {
        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: {'action': 'GET_CLIENTES'},
            dataType: 'json',
            success: function (obj) {
                var currentHTML = '<thead>';
                currentHTML += '<tr>';
                currentHTML += '<th>Username</th>';
                currentHTML += '<th>Nombre</th>';
                currentHTML += '<th>Correo</th>';
                currentHTML += '<th colspan="2">Acción</th>';
                currentHTML += '</tr>';
                currentHTML += '</thead>';
                currentHTML += '<tbody>';

                for (var i = 0; i < obj.results.length; i++) {
                    var result = obj.results[i];

                    currentHTML += '<tr value="'+ result.id + '">';
                    currentHTML += '<td>' + result.username+'</td>';
                    currentHTML += '<td>' + result.nombre + " " + result.apellidos+'</td>';
                    currentHTML += '<td>' + result.email+'</td>';
                    currentHTML += '<td class=modifyButton><button id= modify type=button>Modificar</button></td>';
                    currentHTML += '<td class=deleteButton><button id= delete type=button>Eliminar</button></td>';
                    currentHTML += '</tr>';

                    $('#allUsers').append(currentHTML);
                    currentHTML = '';
                }

                currentHTML += '</tbody>';
            },
            error: function (error) {
                $('#feedback').html('Error cargando los clientes');
            }
        });
    }, 500);

    $('#saveCliente').on('click', function (event) {
        var idCliente = window.location.search.substring(1);
        idCliente = idCliente.substring(3);

        var modifying = idCliente != '';

        var email = $('#email').val();
        var nombre = $('#firstName').val();
        var apellidos = $('#lastName').val();
        var username = $('#username').val();
        var password = $('#password').val();
        var passwordConfirm = $('#passwordConfirm').val();

        if (nombre === '' || apellidos === '' || email === '' || username === '' || (!modifying && (password === '' || passwordConfirm === ''))) {
            $('#feedback').html('Favor de llenar todos los campos');
            return;
        }

        if (!modifying && (password != passwordConfirm)) {
            $('#feedback').html('Las contraseñas no coinciden');
            return;
        }

        var parameters = {
            'action': 'ALTA_CLIENTE',
            'nombre': nombre,
            'apellidos': apellidos,
            'email': email,
            'username': username
        };

        if (modifying) {
            parameters.id = idCliente;
        } else {
            parameters.password = password;
        }

        // Clear feedback <span>
        $('#feedback').empty();

        var actionText = modifying ? 'modificado' : 'agregado';
        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: parameters,
            dataType: 'json',
            success: function (obj) {
                alert('Cliente ' + actionText + ' exitosamente.');
            },
            error: function (error) {
                $('#feedback').html('Cliente no ' + actionText + '. Ha ocurrido un error.');
            }
        });
    });

    $('#allUsers').on('click', '.deleteButton', function () {
        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                'action': 'DELETE_CLIENTE',
                'id': $(this).parent().attr('value')
            },
            dataType: 'json',
            success: function (obj) {
                alert('Cliente eliminado exitosamente.');
                $(this).parent().find('td.id').remove();
            },
            error: function (errorMsg) {
                alert('Error eliminando cliente.');
            }
        });
    });

    $('#allUsers').on('click', '.modifyButton', function () {
        var idUser = $(this).parent().attr('value')
        $('#headerTitle').text('Modificar Cliente');
        $('#saveCliente').text('Modificar');

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $('ul.tabs li').first().addClass('current');
        $("#tab-agregarCliente").addClass('current');

        $('#cliente-password').hide();
        $('#cliente-password-confirm').hide();

        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                'action': 'GET_CLIENTES',
                'id': idUser
            },
            dataType: 'json',
            success: function (obj) {
                for (var i = 0; i < obj.results.length; i++) {
                    var result = obj.results[i];

                    if (result.id == idUser) {
                        $('#email').val(result.email);
                        $('#firstName').val(result.nombre);
                        $('#lastName').val(result.apellidos);
                        $('#username').val(result.username);

                        var myURL = window.location.href.split('?')[0];
                        myURL = myURL + '?id=' + result.id;
                        history.pushState({}, null, myURL);
                    }
                }
            },
            error: function (errorMsg) {
                alert('Error modificando cliente.');
            }
        });
    });

    $('#cancelModify').on('click', function (event) {
        $('#tab-agregarCliente').find('input').val('');
        $('#headerTitle').text('Agregar Usuario');
        $('#saveCliente').text('Agregar');

        var myURL = window.location.href.split('?')[0];
        history.pushState({}, null, myURL);

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $('ul.tabs li').last().addClass('current');
        $("#tab-modificarCliente").addClass('current');
    });
});
