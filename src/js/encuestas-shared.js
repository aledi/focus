'use strict';

function getEncuestas (route) {
    $.ajax({
        type: 'POST',
        url: '../api/controller.php',
        data: {'action': 'GET_ENCUESTAS'},
        dataType: 'json',
        success: function (response) {
            var currentHTML = '';

            if (route !== 'encuestas') {
                if (!response.results.length) {
                    $('#available-encuestas-feedback').html('Por el momento no hay encuestas disponibles');
                }

                for (var i = 0; i < response.results.length; i++) {
                    var result = response.results[i];
                    currentHTML += '<option value="' + result.id + '">' + result.nombre + '</option>';
                }

                $('#' + route + '-encuestas-select').append(currentHTML);
            } else {
                var currentHTML = '<thead>';
                currentHTML += '<tr>';
                currentHTML += '<th>Nombre</th>';
                currentHTML += '<th>Fecha Inicio</th>';
                currentHTML += '<th>Fecha Fin</th>';
                currentHTML += '<th>Panel</th>';
                currentHTML += '<th columnSpan = "2">Acción</th>';
                currentHTML += '</tr>';
                currentHTML += '</thead>';
                currentHTML += '<tbody>';

                for (var i = 0; i < response.results.length; i++) {
                    var result = response.results[i];

                    currentHTML += '<tr id="' + result.id + '">';
                    currentHTML += '<td><a href="preguntas.php?id=' + result.id + '">' + result.nombre + '</a></td>';
                    currentHTML += '<td>' + result.fechaInicio + '</td>';
                    currentHTML += '<td>' + result.fechaFin + '</td>';
                    currentHTML += '<td>' + result.panel + '</td>';
                    currentHTML += '<td class=edit-button><button id=edit type=button>Editar</button></td>';
                    currentHTML += '<td class=deleteButton><button id=delete type=button>Eliminar</button></td>';
                    currentHTML += '</tr>';

                    $('#allEncuestas').append(currentHTML);
                    currentHTML = '';
                }

                currentHTML += '</tbody>';
            }
        },
        error: function (error) {
            $('#feedback').html('Error cargando los clientes');
        }
    });
}
