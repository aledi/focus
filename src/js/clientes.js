'use strict';

$(document).on('ready', function () {
    $('#usuarios-header-option').addClass('selected');
    $('#cancel-edit').hide();

    // -----------------------------------------------------------------------------------------------
    // Fetch Clientes
    // -----------------------------------------------------------------------------------------------

    setTimeout(function (event) {
        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: {'action': 'GET_CLIENTES'},
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

                    currentHTML += '<tr id="'+ result.id + '">';
                    currentHTML += '<td>' + result.username+'</td>';
                    currentHTML += '<td>' + result.nombre + " " + result.apellidos+'</td>';
                    currentHTML += '<td>' + result.email+'</td>';
                    currentHTML += '<td class=edit-button><button id=edit type=button>Editar</button></td>';
                    currentHTML += '<td class=deleteButton><button id=delete type=button>Eliminar</button></td>';
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

    // -----------------------------------------------------------------------------------------------
    // Save Cliente
    // -----------------------------------------------------------------------------------------------

    $('#save-cliente').on('click', function (event) {
        var idCliente = window.location.search.substring(1);
        idCliente = idCliente.substring(3);

        var editing = idCliente != '';

        var email = $('#email').val();
        var nombre = $('#firstName').val();
        var apellidos = $('#lastName').val();
        var username = $('#username').val();
        var password = $('#password').val();
        var passwordConfirm = $('#passwordConfirm').val();

        if (nombre === '' || username === '' || (!editing && (password === '' || passwordConfirm === ''))) {
            $('#feedback').html('Favor de llenar todos los campos');
            return;
        }

        if (!editing && (password != passwordConfirm)) {
            $('#feedback').html('Las contraseñas no coinciden');
            return;
        }

        var data = {
            action: 'ALTA_CLIENTE',
            nombre: nombre,
            apellidos: apellidos,
            email: email,
            username: username
        };

        if (editing) {
            data.id = idCliente;
        } else {
            data.password = password;
        }
        
        $('#feedback').empty();

        var actionText = editing ? 'editado' : 'agregado';
        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: data,
            dataType: 'json',
            success: function (response) {
                if (response.status === 'SUCCESS') {
                    alert('Cliente ' + actionText + ' exitosamente.');
                    location.replace('clientes.php');
                } else if (response.status === 'USER_EXISTS') {
                    $('#feedback').html('El usuario ya existe. Por favor, elija otro');
                } else {
                    $('#feedback').html('Hubo un error al guardar el usuario. Por favor, intente más tarde');
                }
            },
            error: function (error) {
                $('#feedback').html('Cliente no ' + actionText + '. Ha ocurrido un error.');
            }
        });
    });

    // -----------------------------------------------------------------------------------------------
    // Edit Cliente
    // -----------------------------------------------------------------------------------------------

    $('#allUsers').on('click', '.edit-button', function () {
        var idUser = $(this).parent().attr('id')
        $('#header-title').text('Editar Cliente');
        $('#save-cliente').text('Editar');

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $('ul.tabs li').first().addClass('current');
        $("#tab-agregar-cliente").addClass('current');

        $('#cliente-password').hide();
        $('#cliente-password-confirm').hide();

        $('#cancel-edit').show();

        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                action: 'GET_CLIENTES',
                id: idUser
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
                alert('Error editando cliente.');
            }
        });
    });

    // -----------------------------------------------------------------------------------------------
    // Delete Cliente
    // -----------------------------------------------------------------------------------------------

    $('#allUsers').on('click', '.deleteButton', function () {
        var self = this;
        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                action: 'DELETE_CLIENTE',
                id: $(this).parent().attr('id')
            },
            dataType: 'json',
            success: function (response) {
                alert('Cliente eliminado exitosamente.');
                $(self).parent().remove();
            },
            error: function (errorMsg) {
                alert('Error eliminando cliente.');
            }
        });
    });

    $('#cancel-edit').on('click', function (event) {
        $('#tab-agregar-cliente').find('input').val('');
        $('#header-title').text('Agregar Usuario');
        $('#save-cliente').text('Agregar');
        $('#cancel-edit').hide();
        $('#cliente-password').show();
        $('#cliente-password-confirm').show();

        var myURL = window.location.href.split('?')[0];
        history.pushState({}, null, myURL);

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $('ul.tabs li').last().addClass('current');
        $('#tab-view-clientes').addClass('current');
    });
});
