$(document).on('ready', function () {

    parametersSession = }
        'action' : 'VERIFY_SESSION'
    };


    $.ajax({
        type: 'POST',
        url: '../api/controller.php',
        data: parameters,
        dataType: 'json',
        success: function (obj) {
            console.log(obj.username);

        },
        error: function (error) {
            alert("Please login to continue");
            window.location.replace('signin.php');
        }
    });

	parameters = {
		'action': 'GET_PANEL'
	};

	$.ajax({
        type: 'POST',
        url: '../api/controller.php',
        data: parameters,
        dataType: 'json',
        success: function (obj) {
            //console.log(obj);
            var currentHTML = "";
            var x = 0;

            for(x = 0; x < obj.results.length; x++){
            	currentHTML += '<option value=' + obj.results[x].id + '>' + obj.results[x].nombre + '</option>';
            }

            $("#panelesDropdown").append(currentHTML);
            currentHTML = "";

        },
        error: function (error) {
             $('#feedback').html("Paneles han producido un error.");
        }
    });

    parameters = {
        'action': 'GET_PANELISTAS'
    };

    $.ajax({
        type: 'POST',
        url: '../api/controller.php',
        data: parameters,
        dataType: 'json',
        success: function (obj) {
            //console.log(obj);
            var currentHTML = "";
            var x = 0;

            for(x = 0; x < obj.results.length; x++){
                currentHTML += '<option value=' + obj.results[x].id + '>' + obj.results[x].nombre + '</option>';
            }

            $("#panelistasDropdown").append(currentHTML);
            currentHTML = "";

        },
        error: function (error) {
             $('#feedback').html("Panelistas han producido un error.");
        }
    });

	$('#loginButtonLigarPanel').on('click', function (event) {
        event.preventDefault();

        var panel = $('#panelesDropdown').val();
        var panelistas = $('#panelistasDropdown').val();

        if (panel === '' || panelistas === '') {
            $('#feedback').html('Favor de llenar todos los campos');

            return;
        }

        var parameters = {
            'action': 'SET_PANELISTA_PANEL',
            'panel': panel,
            'panelistas': panelistas
        };

        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: parameters,
            dataType: 'json',
            success: function (obj) {
                alert("Panel ligado exitosamente.");
            },
            error: function (error) {
                 alert("error");
                 $('#feedback').html("Panel no ligado, ha ocurrido un error.");
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
                } else {
                    $('#feedback').html("Correo o contraseña incorrectos.");
                }

            },
            error: function (error) {
                $('#feedback').html("Correo o contraseña incorrectos.");
            }
        });
    });

});