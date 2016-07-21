
function convertData(caso, data){
    switch(caso){
        case 'Genero' :
            return convertGender(data);
        break;

        case 'edoCivil' :
            return convertedoCivil(data);
        break;

        default :
            return 'ERROR';
        break;
    }
}


function convertedoCivil(data){
    switch(data){
        case 0 :
            return 'Casado';
        break;

        case 1 :
            return 'Viudo';
        break;

        case 2 :
            return 'Divorciado';
        break;

        case 3 :
            return 'Separado';
        break;

        case 4 :
            return 'Soltero';
        break;

        case 5 :
            return 'Unión Libre';
        break;

        default :
            return 'ERROR';
        break;
    }
}


function convertGender(data){
    switch(data){
        case 0 :
            return 'Masculino';
        break;
        case 1 :
            return 'Femenino';
        break;
    }
}

$(document).on('ready', function () {
    
    $('#sendInfoPanelistas').on('click', function (event) {
        event.preventDefault();

        var email = $('#email').val();
        var nombre = $('#fName').val();
        var apPaterno = $('#lName').val();
        var apMaterno = $('#lName_materno').val();
        var genero = $("input[name=gender]:checked").val();
        var educacion = $("input[name=nivel_educativo]:checked").val();
        var edad = $("input[name=rango_edad]:checked").val();
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

        var parameters = {
            'action': 'ALTA_PANELISTA',
            'nombre': nombre,
            'apPaterno': apPaterno,
            'apMaterno': apMaterno,
            'email' : email,
            'genero' : genero,
            'educacion' : educacion,
            'edad' : edad,
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
        event.preventDefault();

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

        if(password != passwodConf){
            $('#feedback').html('Las contraseñas no coinciden.');
            return;
        }

        var parameters = {
            'action': 'ALTA_ADMIN',
            'nombre': nombre,
            'apPaterno': apPaterno,
            'apMaterno': apMaterno,
            'email' : email,
            'username' : username,
            'password' : password
        };

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
        event.preventDefault();

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

        var parameters = {
            'action': 'ALTA_CLIENTE',
            'nombre': nombre,
            'apPaterno': apPaterno,
            'apMaterno': apMaterno,
            'email' : email,
            'username' : username,
            'password' : password
        };

        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: parameters,
            dataType: 'json',
            success: function (obj) {
                alert("Cliente añadido exitosamente.");
            },
            error: function (error) {
                 $('#feedback').html("Cliente no añadido, ha ocurrido un error.");
            }
        });
    });

    var flagLoading = 0;
    $('#tab-modAdmin').on('click', function (event) {
        event.preventDefault();

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
                if(flagLoadingUser == 0){
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
                        $("#allUsers").append(currentHTML);
                        currentHTML = "";
                    }
                    flagLoadingUser = 1;
                }       
            },
            error: function (error) {
                 $('#feedback').html("Error cargando los clientes.");
            }
        });
    });

    $("#allUsers").on("click",".deleteButton", function(){
        var parameters = {
            "action": "DELETE_CLIENTE",
            "id": $(this).parent().find("td.id").text()
        }
        console.log(parameters);
        $.ajax({
            url: "../api/controller.php",
            type: "POST",
            data: parameters,
            dataType: "json",
            success: function(obj){
                alert("Cliente Eliminado!");
                console.log(obj.status);
                $(this).parent().find("td.id").remove();
            },
            error: function(errorMsg)
            {
                alert("Error eliminando cliente");
            }
        });
    });

    $("#allAdmin").on("click",".deleteButton", function(){
        var parameters = {
            "action": "DELETE_CLIENTE",
            "id": $(this).parent().find("td.id").text()
        }
        console.log(parameters);
        $.ajax({
            url: "../api/controller.php",
            type: "POST",
            data: parameters,
            dataType: "json",
            success: function(obj){
                alert("¡Administrador Eliminado!");
                console.log(obj.status);
                $(this).parent().find("td.id").remove();
            },
            error: function(errorMsg)
            {
                alert("Error eliminando administrador");
            }
        });
    });


    var flagLoadingPanelist = 0;
    $('#tab-modPanelist').on('click', function (event) {
        event.preventDefault();

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
    });

    $("#allPanelists").on("click",".deleteButton", function(){
        var parameters = {
            "action": "DELETE_PANELISTA",
            "id": $(this).parent().find("td.id").text()
        }
        console.log(parameters);
        $.ajax({
            url: "../api/controller.php",
            type: "POST",
            data: parameters,
            dataType: "json",
            success: function(obj){
                alert("Panelista Eliminado!");
                console.log(obj.status);
                $(this).parent().find("td.id").remove();
            },
            error: function(errorMsg)
            {
                alert("Error eliminando Panelista");
            }
        });
    });
});
