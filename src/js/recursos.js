'use strict';

function changeType(tipo, action) {
    switch (action) {
        case 0:
            if (tipo === 1) {
                return "Imagen";
            }
            else {
                return "Video";
            }
        break;
        case 1:
            if (tipo === "Imagen") {
                return 1;
            }
            else {
                return 2;
            }
        break;
    }
}

$(document).on('ready', function () {

    // -----------------------------------------------------------------------------------------------
    // Fetch Resources
    // -----------------------------------------------------------------------------------------------

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
                    currentHTML += '<td id="nombre">' + result.nombre+'</td>';
                    currentHTML += '<td class="Type">' + changeType(result.tipo, 0) +'</td>';
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

    // -----------------------------------------------------------------------------------------------
    // Delete Resources
    // -----------------------------------------------------------------------------------------------

    $('#allResources').on('click', '.deleteButton', function () {
        var self = this;
        console.log($(this).parent().find('#nombre').text());
        console.log(changeType($(this).parent().find('.Type').text(), 1));
        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                action: 'DELETE_RECURSO',
                id: $(this).parent().attr('id'),
                nombre: $(this).parent().find('#nombre').text(),
                tipo: changeType($(this).parent().find('.Type').text(), 1)
            },
            dataType: 'json',
            success: function (response) {
                alert('Recurso eliminado exitosamente.');
                $(self).parent().remove();
            },
            error: function (errorMsg) {
                alert('Error eliminando recurso.');
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
