'use strict';

$(document).on('ready', function () {
    $('#avances-header-option').addClass('selected');

    setTimeout(function (event) {
        getEncuestas('avances');
    }, 500);

    $('#avances-encuestas-select').on('change', function () {
        var idEncuesta = parseInt($(this).val(), 10);
        $('#avance-percentage').empty();
        $('#avance-panelistas').empty();
        $('#avances-table').empty();
        $('#avance-summary').empty();

        if (idEncuesta < 1) {
            return;
        }

        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                'action': 'CURRENT_ANSWERS',
                'encuesta': idEncuesta
            },
            dataType: 'json',
            success: function (response) {
                var summaryHTLM = readableDate(response.fechaInicio) + ' - ' + readableDate(response.fechaFin) + ' (' + (response.dias < 0 ? 0 : response.dias) + ' días restantes)';
                summaryHTLM += '<br><br>';
                summaryHTLM += 'Respuestas: ' + response.respuestas + '  (' + (response.porcentaje * 100).toFixed(2) + '%)';
                $('#avance-summary').html(summaryHTLM);

                var currentHTML = '<thead>';
                currentHTML += '<tr>';
                currentHTML += '<th class="left">Nombre</th>';
                currentHTML += '<th>Género</th>';
                currentHTML += '<th>Edad</th>';
                currentHTML += '<th>Educación</th>';
                currentHTML += '<th>Municipio</th>';
                currentHTML += '<th>Estado</th>';
                currentHTML += '<th>Fecha Inicio</th>';
                currentHTML += '<th>Hora Inicio</th>';
                currentHTML += '<th>Fecha Fin</th>';
                currentHTML += '<th>Hora Fin</th>';
                currentHTML += '</tr>';
                currentHTML += '</thead>';
                currentHTML += '<tbody>';

                for (var i = 0; i < response.panelistas.length; i++) {
                    var panelista = response.panelistas[i];

                    currentHTML += '<tr class="' + (panelista.fechaFin ? '' : 'red') + '">';
                    currentHTML += '<td>' + panelista.nombre + '</td>';
                    currentHTML += '<td>' + convertGenero(panelista.genero) + '</td>';
                    currentHTML += '<td class="centered">' + panelista.edad + '</td>';
                    currentHTML += '<td>' + convertEducacion(panelista.educacion) + '</td>';
                    currentHTML += '<td>' + panelista.municipio + '</td>';
                    currentHTML += '<td class="centered">' + panelista.estado + '</td>';
                    currentHTML += '<td>' + readableDate(panelista.fechaIni) + '</td>';
                    currentHTML += '<td>' + (panelista.horaIni ? panelista.horaIni : '') + '</td>';
                    currentHTML += '<td>' + readableDate(panelista.fechaFin) + '</td>';
                    currentHTML += '<td>' + (panelista.horaFin ? panelista.horaFin : '') + '</td>';
                    currentHTML += '</tr>';
                }

                currentHTML += '</tbody>';
                $('#avances-table').append(currentHTML);
            },
            error: function (errorMsg) {
                alert('Error obteniendo panelistas.');
            }
        });
    });
});
