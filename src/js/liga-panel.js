$(document).on('ready', function () {
	/*parameters = {
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
    });*/

    var flagLoadingPanelist = 0;
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
                    currentHTML += '<th></th>';
                currentHTML += '</tr>';
                for(var i = 0; i < obj.results.length; i++) {
                    currentHTML += "<tr>";
                        currentHTML += "<td></td>";
                        currentHTML += "<td class='id'>" + obj.results[i].id +"</td>";
                        currentHTML += "<td>" + obj.results[i].nombre +"</td>";
                        currentHTML += "<td>" + convertData('Genero', obj.results[i].genero) +"</td>";
                        currentHTML += "<td>" + obj.results[i].edad +"</td>";
                        currentHTML += "<td>" + convertData('edoCivil', obj.results[i].edoCivil) +"</td>";
                        currentHTML += "<td>" + obj.results[i].municipio +"</td>";
                        currentHTML += "<td>" + obj.results[i].estado +"</td>";
                        currentHTML += '<td><input type="checkbox" value=' + obj.results[i].id + ' name="id"></td>"';
                    currentHTML += "</tr>";
                    $("#tablaPanelistas").append(currentHTML);
                    currentHTML = "";
                }
                flagLoadingPanelist = 1;
            }       
        },
        error: function (error) {
             $('#feedback').html("Error cargando los clientes.");
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
	
});
