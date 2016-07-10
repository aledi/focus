$(document).on('ready', function () {

	parameters = {
		'action': 'GET_CLIENTES'
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
            	currentHTML += '<option value=' + obj.results[x].id + '>' + obj.results[x].username + '</option>';
            }

            $("#clientesDropdown").append(currentHTML);
            currentHTML = "";

        },
        error: function (error) {
             $('#feedback').html("Cliente no añadido, ha ocurrido un error.");
        }
    });

	$('#loginButtonNuevoPanel').on('click', function (event) {
        event.preventDefault();

        var nombre = $('#panelName').val();
        var fechaInicio = $('#dateStarts').val();
        var fechaFin = $('#dateEnds').val();
        var cliente = $("#clientesDropdown").val();
        var creador = $("#panelCreator").val();

        if (nombre === '' || fechaInicio === '' || fechaFin === '' || cliente === '' ||
            creador === '') {
            $('#feedback').html('Favor de llenar todos los campos');

            return;
        }

        var parameters = {
            'action': 'ALTA_PANEL',
            'nombre': nombre,
            'fechaInicio': fechaInicio,
            'fechaFin': fechaFin,
            'cliente' : cliente,
            'creador' : creador
        };

        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: parameters,
            dataType: 'json',
            success: function (obj) {
                //console.log(obj);
                alert("Panel added successfully.");
            },
            error: function (error) {
                 $('#feedback').html("Panel no añadido, ha ocurrido un error.");
            }
        });
    });


});	