'use strict';

var currentEncuesta = 0;

function getData () {
    if (currentEncuesta <= 0) {
        $('#refresh').hide();
        return;
    }

    $('#refresh').show();

    $.ajax({
        type: 'POST',
        url: '../api/controller.php',
        data: {
            'action': 'CURRENT_ANSWERS',
            'encuesta': currentEncuesta
        },
        dataType: 'json',
        success: function (response) {
            var summaryHTLM = 'Respuestas: ' + response.respuestas + ' (' + (response.porcentaje * 100).toFixed(2) + '%)';
            summaryHTLM += '<br>';
            summaryHTLM += readableDate(response.fechaInicio) + ' - ' + readableDate(response.fechaFin) + ' (' + (response.dias < 0 ? 0 : response.dias) + ' días restantes)';
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
                currentHTML += '<td>' + validateHour(panelista.horaIni) + '</td>';
                currentHTML += '<td>' + readableDate(panelista.fechaFin) + '</td>';
                currentHTML += '<td>' + validateHour(panelista.horaFin) + '</td>';
                currentHTML += '</tr>';
            }

            currentHTML += '</tbody>';
            $('#avances-table').append(currentHTML);
        },
        error: function (errorMsg) {
            $('#selects-feedback').html('Error obteniendo panelistas');
        }
    });
}

$(document).on('ready', function () {
    $('#avances-header-option').addClass('selected');
    $('#clientes-filter-select').hide();
    $('#paneles-filter-select').hide();
    $('#encuestas-filter-select').hide();
    $('#refresh').hide();

    fillClientesSelect();

    $('#clientes-filter-select').on('change', function() {
        var value = parseInt($('#clientes-filter-select').val(), 10);

        $('#paneles-filter-select').hide();
        $('#encuestas-filter-select').hide();
        $('#avances-table').empty();
        $('#avance-summary').empty();
        $('#selects-feedback').html('');
        $('#refresh').hide();

        if (value > 0) {
            fillPanelesSelect(value);
        }
    });

    $('#paneles-filter-select').on('change', function() {
        var value = parseInt($('#paneles-filter-select').val(), 10);

        $('#encuestas-filter-select').hide();
        $('#avances-table').empty();
        $('#avance-summary').empty();
        $('#selects-feedback').html('');
        $('#refresh').hide();

        if (value > 0) {
            fillEncuestasSelect(value);
        }
    });

    $('#encuestas-filter-select').on('change', function() {
        currentEncuesta = parseInt($(this).val(), 10);

        $('#avances-table').empty();
        $('#avance-summary').empty();
        $('#selects-feedback').html('');

        getData();
    });

    $('#refresh').on('click', function() {
        $('#avances-table').empty();
        $('#avance-summary').empty();
        $('#selects-feedback').html('');

        getData();
    });

});
