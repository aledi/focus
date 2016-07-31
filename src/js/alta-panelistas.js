$(document).on('ready', function () {

    $('#sendInfoPanelistas').on('click', function (event) {
        var idPanelista = window.location.search.substring(1)
        idPanelista = idPanelista.substring(3);

        var email = $('#email').val();
        var nombre = $('#fName').val();
        var apPaterno = $('#lName').val();
        var apMaterno = $('#lName_materno').val();
        var genero = $("input[name=gender]:checked").val();
        var educacion = $("input[name=nivel_educativo]:checked").val();
        var fechaNacimiento = $('#fechaNacimiento').val();;
        var edoCivil = $("input[name=estadoCivil]:checked").val();
        var estado = $("#estado").val();
        var municipio = $('#municipio').val();
        var cuartos = $("input[name=cuartos]:checked").val();
        var banios = $("input[name=banos]:checked").val();
        var regadera = $("input[name=regaderas]:checked").val();
        var focos = $("input[name=focos]:checked").val();
        var piso = $("input[name=piso]:checked").val();
        var autos = $("input[name=auto]:checked").val();
        var estudiosProv = $("input[name=nivel_educativo_ingreso]:checked").val();
        var estufa = $("input[name=estufa]:checked").val();
        var movil = $('#telefono_cel').val();
        var fotoINE = "";

        if(idPanelista == ''){
            var parameters = {
                'action': 'ALTA_PANELISTA',
                'nombre': nombre,
                'apPaterno': apPaterno,
                'apMaterno': apMaterno,
                'email' : email,
                'genero' : genero,
                'educacion' : educacion,
                'fechaNacimiento' : fechaNacimiento,
                'edoCivil' : edoCivil,
                'estado' : estado,
                'municipio' : municipio,
                'cuartos' : cuartos,
                'banios' : banios,
                'regadera' : regadera,
                'focos' : focos,
                'piso' : piso,
                'autos' : autos,
                'estudiosProv' : estudiosProv,
                'estufa' : estufa,
                'movil' : movil,
                'fotoINE' : fotoINE
            };
        }

        else {
            console.log(idPanelista);
            var parameters = {
                'action': 'ALTA_PANELISTA',
                'nombre': nombre,
                'apPaterno': apPaterno,
                'apMaterno': apMaterno,
                'email' : email,
                'genero' : genero,
                'educacion' : educacion,
                'fechaNacimiento' : fechaNacimiento,
                'edoCivil' : edoCivil,
                'estado' : estado,
                'municipio' : municipio,
                'cuartos' : cuartos,
                'banios' : banios,
                'regadera' : regadera,
                'focos' : focos,
                'piso' : piso,
                'autos' : autos,
                'estudiosProv' : estudiosProv,
                'estufa' : estufa,
                'movil' : movil,
                'fotoINE' : fotoINE,
                'id' : idPanelista
            };
        }

        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: parameters,
            dataType: 'json',
            success: function (obj) {
                //console.log(obj);
                alert("Panelista agregado exitosamente.");
            },
            error: function (error) {
                 $('#feedback').html("Panelista no añadido, ha ocurrido un error.");
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
                //console.log(obj);
                alert("Adminsitrador añadido exitosamente.");
            },
            error: function (error) {
                 $('#feedback').html("Administrador no añadido, ha ocurrido un error.");
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
                alert("Cliente añadido exitosamente.");
                console.log("h");
            },
            error: function (error) {
                 $('#feedback').html("Cliente no añadido, ha ocurrido un error.");
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

                var currentHTML = "";
                if(flagLoading == 0){
                    currentHTML += '<tr>';
                        currentHTML += '<th></th>';
                        currentHTML += '<th>ID</th>';
                        currentHTML += '<th>Username</th>';
                        currentHTML += '<th>Nombre</th>';
                        currentHTML += '<th>Correo</th>';
                        currentHTML += '<th colspan="2">Acción</th>';
                    currentHTML += '</tr>';
                    for(var i = 0; i < obj.results.length; i++)
                    {
                        currentHTML += "<tr>";
                            currentHTML += "<td></td>";
                            currentHTML += "<td class='id'>" + obj.results[i].id+"</td>";
                            currentHTML += "<td>" + obj.results[i].username+"</td>";
                            currentHTML += "<td>" + obj.results[i].nombre+"</td>";
                            currentHTML += "<td>" + obj.results[i].email+"</td>";
                            currentHTML += "<td class=modifyButton><input id= modify type=  submit  value= Modificar ></td>"
                            currentHTML += "<td class=deleteButton><input id= delete type=  submit  value= Eliminar ></td>";
                        currentHTML += "</tr>";
                        $("#allAdmin").append(currentHTML);
                        currentHTML = "";
                    }
                    flagLoading = 1;
                }
            },
            error: function (error) {
                 $('#feedback').html("Error cargando los administradores.");
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
            var currentHTML = "";
                currentHTML += '<tr>';
                    currentHTML += '<th></th>';
                    currentHTML += '<th>ID</th>';
                    currentHTML += '<th>Username</th>';
                    currentHTML += '<th>Nombre</th>';
                    currentHTML += '<th>Correo</th>';
                    currentHTML += '<th colspan="2">Acción</th>';
                currentHTML += '</tr>';
                for(var i = 0; i < obj.results.length; i++) {
                    currentHTML += "<tr>";
                        currentHTML += "<td></td>";
                        currentHTML += "<td class='id'>" + obj.results[i].id+"</td>";
                        currentHTML += "<td>" + obj.results[i].username+"</td>";
                        currentHTML += "<td>" + obj.results[i].nombre+"</td>";
                        currentHTML += "<td>" + obj.results[i].email+"</td>";
                        currentHTML += "<td class=modifyButton><input id= modify type=  submit  value= Modificar ></td>";
                        currentHTML += "<td class=deleteButton><input id= delete type=  submit  value= Eliminar ></td>";
                    currentHTML += "</tr>";
                    $("#allUsers").append(currentHTML);
                    currentHTML = "";
                }
            },
            error: function (error) {
                 $('#feedback').html("Error cargando los clientes.");
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

                var currentHTML = "";
                if(flagLoadingPanelist == 0){
                    currentHTML += '<tr>';
                        currentHTML += '<th></th>';
                        currentHTML += '<th>ID</th>';
                        currentHTML += '<th>Nombre</th>';
                        currentHTML += '<th>Género</th>';
                        currentHTML += '<th>Edad</th>';
                        currentHTML += '<th>Estado Civil</th>';
                        currentHTML += '<th>Municipio</th>';
                        currentHTML += '<th>Estado</th>';
                        currentHTML += '<th colspan="2">Acción</th>';
                    currentHTML += '</tr>';
                    for(var i = 0; i < obj.results.length; i++)
                    {
                        currentHTML += "<tr>";
                            currentHTML += "<td></td>";
                            currentHTML += "<td class='id'>" + obj.results[i].id +"</td>";
                            currentHTML += "<td>" + obj.results[i].nombre +"</td>";
                            currentHTML += "<td>" + convertData('Genero', obj.results[i].genero) +"</td>";
                            currentHTML += "<td>" + obj.results[i].edad +"</td>";
                            currentHTML += "<td>" + convertData('edoCivil', obj.results[i].edoCivil) +"</td>";
                            currentHTML += "<td>" + obj.results[i].municipio +"</td>";
                            currentHTML += "<td>" + obj.results[i].estado +"</td>";
                            currentHTML += "<td class=modifyButton><input id= modify type=  submit  value= Modificar ></td>"
                            currentHTML += "<td class=deleteButton><input id= delete type=  submit  value= Eliminar ></td>";
                        currentHTML += "</tr>";
                        $("#allPanelists").append(currentHTML);
                        currentHTML = "";
                    }
                    flagLoadingPanelist = 1;
                }
            },
            error: function (error) {
                 $('#feedback').html("Error cargando los clientes.");
            }
        });
    }, 500);
});
