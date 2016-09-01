'use strict';

function getEncuestas (route) {
    $.ajax({
        type: 'POST',
        url: '../api/controller.php',
        data: {'action': 'GET_ENCUESTAS'},
        dataType: 'json',
        success: function (obj) {
            var currentHTML = '';

            if (route === 'avances') {
                for (var i = 0; i < obj.results.length; i++) {
                    var result = obj.results[i];
                    currentHTML += '<option value="' + result.id + '">' + result.nombre + '</option>';
                }

                $('#encuestas-select').append(currentHTML);
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

                for (var i = 0; i < obj.results.length; i++) {
                    var result = obj.results[i];

                    currentHTML += '<tr value="' + result.id +'">';
                    currentHTML += '<td><a href="preguntas.php?id='+ result.id +'">' + result.nombre +'</a></td>';
                    currentHTML += '<td>' + result.fechaInicio +'</td>';
                    currentHTML += '<td>' + result.fechaFin +'</td>';
                    currentHTML += '<td>' + result.panel +'</td>';
                    currentHTML += '<td class=modifyButton><button id=modify type=button>Modificar</button></td>';
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
