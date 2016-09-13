'use strict';

$(document).on('ready', function () {
    $('#encuestas-header-option').addClass('selected');

    // -----------------------------------------------------------------------------------------------
    // Fetch Paneles
    // -----------------------------------------------------------------------------------------------

    setTimeout(function (event) {
        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: {'action': 'GET_PANELES'},
            dataType: 'json',
            success: function (response) {
                fillSelects(1, 0);
                fillSelects(2, 0);
                fillSelects(3, 0);

                var currentHTML = '<thead>';
                currentHTML += '<tr>';
                currentHTML += '<th class="left">Nombre</th>';
                currentHTML += '<th class="left">Fecha Inicio</th>';
                currentHTML += '<th class="left">Fecha Fin</th>';
                currentHTML += '<th class="left">Cliente</th>';
                currentHTML += '<th>Seleccionar</th>';
                currentHTML += '</tr>';
                currentHTML += '</thead>';
                currentHTML += '<tbody>';

                for (var i = 0; i < response.results.length; i++) {
                    var result = response.results[i];

                    currentHTML += '<tr id="' + result.id + '">';
                    currentHTML += '<td>' + result.nombre + '</td>';
                    currentHTML += '<td>' + result.fechaInicio + '</td>';
                    currentHTML += '<td>' + result.fechaFin + '</td>';
                    currentHTML += '<td>' + result.cliente + '</td>';
                    currentHTML += '<td class="centered"><input type="radio" value=' + result.id + ' name="id"></td>';
                    currentHTML += '</tr>';

                    $('#allPanels').append(currentHTML);
                    currentHTML = '';
                }

                currentHTML += '</tbody>';
                $('#cancelModify').hide();
            },
            error: function (error) {
                $('#feedback').html('Error cargando los clientes');
            }
        });
    }, 500);

    // -----------------------------------------------------------------------------------------------
    // Fetch Encuestas
    // -----------------------------------------------------------------------------------------------

    setTimeout(function (event) {
        getEncuestas('encuestas');
    }, 500);

    // -----------------------------------------------------------------------------------------------
    // Save Encuesta
    // -----------------------------------------------------------------------------------------------

    $('#saveEncuesta').on('click', function (event) {
        event.preventDefault();

        var idEncuesta = window.location.search.substring(1);
        idEncuesta = idEncuesta.substring(3);

        var nombre = $('#nombre').val();
        var fechaInicio = getCompleteDate(1);
        var fechaFin = getCompleteDate(2);
        var panel = $('input[name=id]:checked').val();

        if (nombre === '' || fechaInicio === '' || fechaFin === '' || panel === '') {
            $('#feedback').html('Favor de llenar todos los campos');
            return;
        }

        var data = {
            action: 'ALTA_ENCUESTA',
            nombre: nombre,
            fechaInicio: fechaInicio,
            fechaFin: fechaFin,
            panel: panel
        };

        if (idEncuesta != '') {
            data.id = idEncuesta;
        }

        var actionText = idEncuesta !== '' ? 'modificada' : 'agregada';
        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: data,
            dataType: 'json',
            success: function (response) {
                alert('Encuesta ' + actionText + ' exitosamente.');
                location.replace('preguntas.php?id=' + response.id);
            },
            error: function (error) {
                $('#feedback').html('Encuesta no ' + actionText + '. Ha ocurrido un error.');
            }
        });
    });

    // -----------------------------------------------------------------------------------------------
    // Modify Encuesta
    // -----------------------------------------------------------------------------------------------

    $('#allEncuestas').on('click', '.modifyButton', function() {
        var idEncuesta = $(this).parent().attr('id');

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $('ul.tabs li').first().addClass('current');
        $("#tab-agregarEncuesta").addClass('current');

        $('#headerTitle').text('Modificar Encuesta');
        $('#saveEncuesta').text('Modificar');

        $('#cancelModify').show();

        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                action: 'GET_ENCUESTAS',
                id: idEncuesta
            },
            dataType: 'json',
            success: function (response) {
                var result = response.result;
                $('#nombre').val(result.nombre);
                getDatefromString(result.fechaInicio, 0);
                getDatefromString(result.fechaFin, 1);
                $('input[name=id][value="' + result.id + '"]').prop('checked', true);

                var myURL = window.location.href.split('?')[0];
                myURL += '?id=' + result.id;
                history.pushState({}, null, myURL);
            },
            error: function (errorMsg) {
                alert('Error modificando encuesta.');
            }
        });
    });

    // -----------------------------------------------------------------------------------------------
    // Delete Encuesta
    // -----------------------------------------------------------------------------------------------

    $('#allEncuestas').on('click', '.deleteButton', function() {
        var self = this;
        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                action: 'DELETE_ENCUESTA',
                id: $(this).parent().attr('id')
            },
            dataType: 'json',
            success: function (response) {
                alert('Encuesta eliminada exitosamente.');
                $(self).parent().remove();
            },
            error: function (errorMsg) {
                alert('Error eliminando encuesta.');
            }
        });
    });

    $('#cancelModify').on('click', function (event) {
        $('#tab-agregarEncuesta').find('input').val('');
        $('#allPanels input').removeAttr('checked');
        $('#headerTitle').text('Agregar Encuesta');
        $('#saveEncuesta').text('Agregar');
        $('#cancelModify').hide();

        var myURL = window.location.href.split('?')[0];
        history.pushState({}, null, myURL);

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $('ul.tabs li').last().addClass('current');
        $("#tab-modificarEncuesta").addClass('current');
    });

    $('#mes, #anio').on('change', function() {
        changeSelect('Inicio');
    });

    $('#mes_fin, #anio_fin').on('change', function() {
        changeSelect('Fin');
    });
});
