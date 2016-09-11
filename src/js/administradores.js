'use strict';

$(document).on('ready', function () {
    $('#usuarios-header-option').addClass('selected');

    setTimeout(function () {
        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: {
                'action': 'GET_ADMINS'
            },
            dataType: 'json',
            success: function (response) {
                var currentHTML = '<thead>';
                currentHTML += '<tr>';
                currentHTML += '<th>Username</th>';
                currentHTML += '<th>Nombre</th>';
                currentHTML += '<th>Correo</th>';
                currentHTML += '<th colspan="2">Acción</th>';
                currentHTML += '</tr>';
                currentHTML += '</thead>';
                currentHTML += '<tbody>';

                for (var i = 0; i < response.results.length; i++) {
                    var result = response.results[i];

                    currentHTML += '<tr value="'+ result.id +'">';
                    currentHTML += '<td>' + result.username+'</td>';
                    currentHTML += '<td>' + result.nombre+'</td>';
                    currentHTML += '<td>' + result.email+'</td>';
                    currentHTML += '<td class=modifyButton><button id=modify type=button>Modificar</button></td>';
                    currentHTML += '<td class=deleteButton><button id=delete type=button>Eliminar</button></td>';
                    currentHTML += '</tr>';

                    $('#allAdmins').append(currentHTML);
                    currentHTML = '';
                }

                currentHTML += '</tbody>';
                $('#cancelModify').hide();
            },
            error: function (error) {
                $('#feedback').html('Error cargando los administradores');
            }
        });
    });

    $('#saveAdmin').on('click', function (event) {
        var idAdmin = window.location.search.substring(1);
        idAdmin = idAdmin.substring(3);

        var modifying = idAdmin != '';

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

        var data = {
            'action': 'ALTA_ADMIN',
            'nombre': nombre,
            'apellidos': apellidos,
            'email': email,
            'username': username
        };

        if (modifying) {
            data.id = idAdmin;
        } else {
            data.password = password
        }

        var actionText = modifying ? 'modificado' : 'agregado';
        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: data,
            dataType: 'json',
            success: function (response) {
                alert('Adminsitrador ' + actionText + ' exitosamente.');
            },
            error: function (error) {
                $('#feedback').html('Administrador no ' + actionText + '. Ha ocurrido un error.');
            }
        });
    });

    $('#allAdmins').on('click', '.deleteButton', function () {
        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                'action': 'DELETE_ADMIN',
                'id': $(this).parent().attr('value')
            },
            dataType: 'json',
            success: function (response) {
                alert('Administrador eliminado exitosamente.');
                $(this).parent().find('td.id').remove();
            },
            error: function (errorMsg) {
                alert('Error eliminando administrador.');
            }
        });
    });

    $('#allAdmins').on('click', '.modifyButton', function ()  {
        var idAdministador = $(this).parent().attr('value')

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $('ul.tabs li').first().addClass('current');
        $("#tab-agregarAdministrador").addClass('current');

        $('#headerTitle').text('Modificar Administrador');
        $('#saveAdmin').text('Modificar');

        $('#admin-password').hide();
        $('#admin-password-confirm').show();

        $('#cancelModify').show();

        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                'action': 'GET_ADMINS',
                'id': idAdministador
            },
            dataType: 'json',
            success: function (response) {
                var result = response.result;

                $('#email').val(result.email);
                $('#firstName').val(result.nombre);
                $('#lastName').val(result.apellidos);
                $('#username').val(result.username);

                var myURL = window.location.href.split('?')[0];
                myURL += '?id=' + result.id;
                history.pushState({}, null, myURL);
            },
            error: function (errorMsg) {
                alert('Error modificando administrador.');
            }
        });
    });

    $('#cancelModify').on('click', function (event) {
        $('#tab-agregarAdministrador').find('input').val('');
        $('#headerTitle').text('Agregar Administrador');
        $('#saveAdmin').text('Agregar');
        $('#cancelModify').hide();

        var myURL = window.location.href.split('?')[0];
        history.pushState({}, null, myURL);

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $('ul.tabs li').last().addClass('current');
        $("#tab-modificarAdministrador").addClass('current');
    });
});
