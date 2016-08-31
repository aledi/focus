'use strict';

$(document).on('ready', function () {
    setTimeout(function () {
        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: {
                'action': 'GET_ADMINS'
            },
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

        var parameters = {
            'action': 'ALTA_ADMIN',
            'nombre': nombre,
            'apellidos': apellidos,
            'email': email,
            'username': username
        };

        if (modifying) {
            parameters.id = idAdmin;
        } else {
            parameters.password = password
        }

        var actionText = modifying ? 'modificado' : 'agregado';
        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: parameters,
            dataType: 'json',
            success: function (obj) {
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
            success: function (obj) {
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
        $('#admin-password-confirm').hide();

        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                'action': 'GET_ADMINS',
                'id': idAdministador
            },
            dataType: 'json',
            success: function (obj) {
                for (var i = 0; i < obj.results.length; i++) {
                    var result = obj.results[i];

                    if (obj.results[i].id == idAdministador) {
                        $('#email').val(result.email);
                        $('#firstName').val(result.nombre);
                        $('#lastName').val(result.apellidos);
                        $('#username').val(result.username);

                        var myURL = window.location.href.split('?')[0];
                        myURL = myURL + '?id=' + obj.results[i].id;
                        history.pushState({}, null, myURL);
                    }
                }
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

        var myURL = window.location.href.split('?')[0];
        history.pushState({}, null, myURL);

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $('ul.tabs li').last().addClass('current');
        $("#tab-modificarAdministrador").addClass('current');
    });
});
