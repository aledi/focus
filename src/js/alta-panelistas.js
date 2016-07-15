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

    $('#signOutButton').on('click', function (event) {
        event.preventDefault();

        var parameters = {
            'action': 'LOG_OUT '
        };

        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: parameters,
            dataType: 'json',
            success: function (obj) {
                if (obj.status === "SUCCESS") {
                    alert("¡Hasta pronto!");
                    location.replace("signin.php");
                }
            },
            error: function (error) {
            }
        });
    });
});
