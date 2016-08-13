$(document).on('ready', function () {
    $('#sendInfoPanelistas').on('click', function (event) {
        var idPanelista = window.location.search.substring(1)
        idPanelista = idPanelista.substring(3);

        var nombre = $('#fName').val();
        var apellidos = $('#lName').val();
        var email = $('#email').val();
        var username = $('#username').val();
        var password = $('#password').val();
        var genero = $('input[name=gender]:checked').val();
        var fechaNacimiento = $('#fechaNacimiento').val();
        var educacion = $('input[name=nivel_educativo]:checked').val();
        var calleNumero = $('#calleNumero').val();
        var colonia = $('#colonia').val();
        var municipio = $('#municipio').val();
        var estado = $('#estado').val();
        var cp = $('#cp').val();

        var parameters = {
            'action': 'ALTA_PANELISTA',
            'nombre': nombre,
            'apellidos': apellidos,
            'email' : email,
            'username' : username,
            'password' : password,
            'genero' : genero,
            'fechaNacimiento' : fechaNacimiento,
            'educacion' : educacion,
            'calleNumero' : calleNumero,
            'colonia' : colonia,
            'municipio' : municipio,
            'estado' : estado,
            'cp' : cp
        };

        if(idPanelista != ''){
            parameters['id'] = idPanelista;
        }

        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: parameters,
            dataType: 'json',
            success: function (obj) {
                alert('Panelista agregado exitosamente.');
            },
            error: function (error) {
                 $('#feedback').html('Panelista no añadido, ha ocurrido un error.');
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

        if (username === '' || password === '' || email === '' || nombre === '' ||
            apPaterno === '' || apMaterno === '') {
            $('#feedback').html('Favor de llenar todos los campos');

            return;
        }

        if(password != passwordConf){
            $('#feedback').html('Las contraseñas no coinciden.');
            return;
        }

        if(idAdministrador == ''){
            var parameters = {
                'action': 'ALTA_ADMIN',
                'nombre': nombre,
                'apPaterno': apPaterno,
                'apMaterno': apMaterno,
                'email' : email,
                'username' : username,
                'password' : password
            };
        }
        else {
            var parameters = {
                'action': 'ALTA_ADMIN',
                'nombre': nombre,
                'apPaterno': apPaterno,
                'apMaterno': apMaterno,
                'email' : email,
                'username' : username,
                'password' : password,
                'id' : idAdministrador
            };
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

        if (username === '' || password === '' || email === '' || nombre === '' ||
            apPaterno === '' || apMaterno === '') {
            $('#feedback').html('Favor de llenar todos los campos');

            return;
        }

        if(password != passwordConf){
            $('#feedback').html('Las contraseñas no coinciden.');
            return;
        }


        if (idCliente == ''){
            var parameters = {
                'action': 'ALTA_CLIENTE',
                'nombre': nombre,
                'apPaterno': apPaterno,
                'apMaterno': apMaterno,
                'email' : email,
                'username' : username,
                'password' : password
            };
        }
        else {
            var parameters = {
                'action': 'ALTA_CLIENTE',
                'nombre': nombre,
                'apPaterno': apPaterno,
                'apMaterno': apMaterno,
                'email' : email,
                'username' : username,
                'password' : password,
                'id' : idCliente
            };
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

                var currentHTML = '';
                if(flagLoading == 0){
                    currentHTML += '<tr>';
                        currentHTML += '<th></th>';
                        currentHTML += '<th>Username</th>';
                        currentHTML += '<th>Nombre</th>';
                        currentHTML += '<th>Correo</th>';
                        currentHTML += '<th colspan="2">Acción</th>';
                    currentHTML += '</tr>';
                    for(var i = 0; i < obj.results.length; i++)
                    {
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
        var parameters = {
            'action': 'GET_CLIENTES'
        };

        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: parameters,
            dataType: 'json',
            success: function (obj) {
            var currentHTML = '';
                currentHTML += '<tr>';
                    currentHTML += '<th></th>';
                    currentHTML += '<th>Username</th>';
                    currentHTML += '<th>Nombre</th>';
                    currentHTML += '<th>Correo</th>';
                    currentHTML += '<th colspan="2">Acción</th>';
                currentHTML += '</tr>';
                for(var i = 0; i < obj.results.length; i++) {
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

    var flagLoadingPanelist = 0;
    setTimeout(function (event) {
        var parameters = {
            'action': 'GET_PANELISTAS'
        };

        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: parameters,
            dataType: 'json',
            success: function (obj) {
                console.log(obj);
                var currentHTML = '';
                if(flagLoadingPanelist == 0){
                    currentHTML += '<tr>';
                        currentHTML += '<th></th>';
                        currentHTML += '<th>Nombre</th>';
                        currentHTML += '<th>Género</th>';
                        currentHTML += '<th>Edad</th>';
                        currentHTML += '<th>Municipio</th>';
                        currentHTML += '<th>Estado</th>';
                        currentHTML += '<th colspan="2">Acción</th>';
                    currentHTML += '</tr>';
                    for(var i = 0; i < obj.results.length; i++)
                    {
                        currentHTML += '<tr value="' + obj.results[i].id +'">';
                            currentHTML += '<td></td>';
                            currentHTML += '<td>' + obj.results[i].nombre +'</td>';
                            currentHTML += '<td>' + convertData('Genero', obj.results[i].genero) +'</td>';
                            currentHTML += '<td>' + obj.results[i].edad +'</td>';
                            currentHTML += '<td>' + obj.results[i].municipio +'</td>';
                            currentHTML += '<td>' + obj.results[i].estado +'</td>';
                            currentHTML += '<td class=modifyButton><input id= modify type=  submit  value= Modificar ></td>'
                            currentHTML += '<td class=deleteButton><input id= delete type=  submit  value= Eliminar ></td>';
                        currentHTML += '</tr>';
                        $('#allPanelists').append(currentHTML);
                        currentHTML = '';
                    }
                    flagLoadingPanelist = 1;
                }
            },
            error: function (error) {
                 $('#feedback').html('Error cargando los clientes.');
            }
        });
    }, 500);
});
