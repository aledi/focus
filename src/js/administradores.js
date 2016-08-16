'use strict';
$(document).on('ready', function () {

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
            },
            error: function (error) {
                $('#feedback').html('Error cargando los administradores.');
            }
        });
    });

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

	$('#allAdmin').on('click','.deleteButton', function(){
        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                'action': 'DELETE_ADMIN',
                'id': $(this).parent().attr('value')
            },
            dataType: 'json',
            success: function(obj){
                alert('¡Administrador Eliminado!');
                $(this).parent().find('td.id').remove();
            },
            error: function (errorMsg) {
                alert('Error eliminando administrador');
            }
        });
    });

    $('#allAdmin').on('click','.modifyButton', function(){
        var idAdministador = $(this).parent().attr('value')

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $('ul.tabs li').first().addClass('current');
        $("#tab-agregarAdministrador").addClass('current');

        $('#headerTitle').text('Modificar Administrador');

        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                'action': 'GET_ADMINS',
                'id': idAdministador
            },
            dataType: 'json',
            success: function(obj){
                for (var i = 0; i < obj.results.length; i++) {
                    if (obj.results[i].id == idAdministador) {
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
