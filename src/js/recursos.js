'use strict';

function getTypeWithNumber(tipo) {
    if (tipo === 1) {
        return "Imagen";
    }
    else {
        return "Video";
    }
}

$(document).on('ready', function () {

    setTimeout(function () {
        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: {
                'action': 'GET_RECURSOS'
            },
            dataType: 'json',
            success: function (response) {
                var currentHTML = '<thead>';
                currentHTML += '<tr>';
                currentHTML += '<th>Nombre</th>';
                currentHTML += '<th>Tipo</th>';
                currentHTML += '<th>Eliminar</th>';
                currentHTML += '</tr>';
                currentHTML += '</thead>';
                currentHTML += '<tbody>';

                for (var i = 0; i < response.results.length; i++) {
                    var result = response.results[i];

                    currentHTML += '<tr id="'+ result.id +'">';
                    currentHTML += '<td>' + result.nombre+'</td>';
                    currentHTML += '<td>' + getTypeWithNumber(result.tipo) +'</td>';
                    currentHTML += '<td class="deleteButton"><button id="delete" type="button">Eliminar</button></td>';
                    currentHTML += '</tr>';

                    $('#allResources').append(currentHTML);
                    currentHTML = '';
                }

                currentHTML += '</tbody>';
            },
            error: function (error) {
                $('#feedback').html('Error cargando los recursos');
            }
        });
    });
/*
	$('#uploadData').on('click', function (event) {
		$.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                action: 'ALTA_RECURSO',
               	nombre: $('#file-name').val(),
               	archivo: $('#file').val(),
                tipo: 1
            },
            dataType: 'json',
            success: function (response) {
              alert(response.status);
            },
            error: function (errorMsg) {
                alert('Error eliminando administrador.');
            }
        });
	});
*/

});
