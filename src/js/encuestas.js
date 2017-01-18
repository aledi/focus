'use strict';

var currentPanel = 0;

function locationRedirect (actionText, response, parentIdEncuesta) {

    switch (actionText) {
        case 'agregada' :
            return 'preguntas.php?id=' + response.id;
        case 'editada' :
            return 'encuestas.php';
        case 'duplicada' :
            return 'preguntas.php?id=' + response.id + '&parentid=' + parentIdEncuesta;
    }
}

function getData () {
    if (currentPanel <= 0) {
        $('#refresh').hide();
        return;
    }

    $('#refresh').show();

    $.ajax({
        type: 'POST',
        url: '../api/controller.php',
        data: {
            'action': 'GET_ENCUESTAS',
            'panel': currentPanel
        },
        dataType: 'json',
        success: function (response) {
            if (response.results.length === 0) {
                $('#selects-feedback').html('No hay encuestas disponibles');
                return;
            }

            var currentHTML = '<thead>';
            currentHTML += '<tr>';
            currentHTML += '<th>Nombre</th>';
            currentHTML += '<th>Fecha Inicio</th>';
            currentHTML += '<th>Fecha Fin</th>';
            currentHTML += '<th>Panel</th>';
            currentHTML += '<th colspan="3">Acciones</th>';
            currentHTML += '</tr>';
            currentHTML += '</thead>';
            currentHTML += '<tbody>';

            for (var i = 0; i < response.results.length; i++) {
                var result = response.results[i];

                currentHTML += '<tr id="' + result.id + '">';
                currentHTML += '<td><a href="preguntas.php?id=' + result.id + '">' + result.nombre + '</a></td>';
                currentHTML += '<td>' + readableDate(result.fechaInicio) + '</td>';
                currentHTML += '<td>' + readableDate(result.fechaFin) + '</td>';
                currentHTML += '<td>' + result.panel + '</td>';
                currentHTML += '<td class=edit-button><button id=edit type=button>Editar</button></td>';
                currentHTML += '<td class=duplicate-button><button id=duplicate type=button>Duplicar</button></td>';
                currentHTML += '<td class=deleteButton><button id=delete type=button>Eliminar</button></td>';
                currentHTML += '</tr>';
            }

            currentHTML += '</tbody>';
            $('#all-encuestas').append(currentHTML);
        },
        error: function (error) {
            $('#feedback').html('Error cargando los clientes');
        }
    });
}

$(document).on('ready', function () {
    $('#encuestas-header-option').addClass('selected');
    $('#select-paneles').hide();
    $('#clientes-filter-select').hide();
    $('#paneles-filter-select').hide();
    $('#cancel-edit').hide();
    $('#refresh').hide();

    fillSelects(1, 0);
    fillSelects(2, 0);
    fillSelects(3, 0);
    fillClientesSelect();

    $('#clientes-filter-select').on('change', function() {
        var value = parseInt($('#clientes-filter-select').val(), 10);

        $('#paneles-filter-select').hide();
        $('#all-encuestas').empty();
        $('#selects-feedback').html('');
        $('#refresh').hide();

        if (value > 0) {
            fillPanelesSelect(value);
        }
    });

    $('#paneles-filter-select').on('change', function() {
        currentPanel = parseInt($('#paneles-filter-select').val(), 10);

        $('#all-encuestas').empty();
        $('#selects-feedback').html('');

        getData();
    });

    $('#refresh').on('click', function () {
        $('#all-encuestas').empty();
        $('#selects-feedback').html('');

        getData();
    });

    // -----------------------------------------------------------------------------------------------
    // Fetch Paneles
    // -----------------------------------------------------------------------------------------------

    $.ajax({
        type: 'POST',
        url: '../api/controller.php',
        data: {'action': 'GET_PANELES'},
        dataType: 'json',
        success: function (response) {
            if (response.results.length === 0) {
                $('#available-paneles-feedback').html('No hay paneles disponibles');
                return;
            }

            var currentHTML = '<option value=0> Selecciona un panel </option>';

            for (var i = 0; i < response.results.length; i++) {
                var result = response.results[i];

                currentHTML += '<option value=' + result.id + '>';
                currentHTML += result.nombre + "   ---   " + result.cliente;
                currentHTML += "</option>";
            }

            $('#select-paneles').append(currentHTML);
            $('#select-paneles').show();
        },
        error: function (error) {
            $('#feedback').html('Error cargando los clientes');
        }
    });

    // -----------------------------------------------------------------------------------------------
    // Save Encuesta
    // -----------------------------------------------------------------------------------------------

    $('#save-encuesta').on('click', function (event) {
        event.preventDefault();

        var parentIdEncuesta = 0;
        var idEncuesta = 0;
        var parameters = window.location.search.substring(1);
        var actionText = '';

        if (parameters.includes('parentid')) {
            parentIdEncuesta =  parameters.substring(9);
            idEncuesta = '';
            actionText = 'duplicada';
        } else if (parameters.substring(3) !== '' && actionText === '') {
            actionText = 'editada';
            idEncuesta = parameters.substring(3);
        } else {
            actionText = 'agregada';
            idEncuesta = '';
        }

        var nombre = $('#nombre').val();
        var fechaInicio = getCompleteDate(1);
        var fechaFin = getCompleteDate(2);
        var panel = parseInt($('#select-paneles').val());

        if (!nombre || !nombre.trim()) {
            $('#feedback').html('Favor de elegir un nombre');
            return;
        }

        if (!panel || panel === 0) {
            $('#feedback').html('Favor de seleccionar un panel');
            return;
        }

        var startDate = new Date($('select#anio').val(), parseInt($('select#mes').val(),10) - 1, $('select#dia').val());
        var endDate = new Date($('select#anio-fin').val(), parseInt($('select#mes-fin').val(),10) - 1, $('select#dia-fin').val());

        if (endDate <= startDate) {
            $('#feedback').html('La fecha fin debe ser posterior a la fecha de inicio');
            return;
        }

        var parameters = {
            action: 'ALTA_ENCUESTA',
            nombre: nombre,
            fechaInicio: fechaInicio,
            fechaFin: fechaFin,
            panel: panel
        };

        if (idEncuesta !== '') {
            parameters.id = idEncuesta;
        }

        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: parameters,
            dataType: 'json',
            success: function (response) {
                if (response.status === 'SUCCESS') {
                    alert('Encuesta ' + actionText + ' exitosamente.');
                    location.replace(locationRedirect(actionText, response, parentIdEncuesta));
                } else if (response.status === 'RECORD_EXISTS') {
                    $('#feedback').html('La encuesta ya existe. Por favor, elija un nombre diferente.');
                } else {
                    $('#feedback').html('Hubo un error al guardar la encuesta. Por favor, intente más tarde');
                }
            },
            error: function (error) {
                $('#feedback').html('Encuesta no ' + actionText + '. Ha ocurrido un error.');
            }
        });
    });

    // -----------------------------------------------------------------------------------------------
    // Edit Encuesta
    // -----------------------------------------------------------------------------------------------

    $('#all-encuestas').on('click', '.edit-button', function() {
        var idEncuesta = $(this).parent().attr('id');

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $('ul.tabs li').first().addClass('current');
        $("#tab-agregar-encuesta").addClass('current');

        $('#header-title').text('Editar Encuesta');
        $('#save-encuesta').text('Editar');

        $('#cancel-edit').show();

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
                $('#select-paneles').val(result.panel);

                var myURL = window.location.href.split('?')[0];
                myURL += '?id=' + result.id;
                history.pushState({}, null, myURL);
            },
            error: function (errorMsg) {
                alert('Error editando encuesta.');
            }
        });
    });

    // -----------------------------------------------------------------------------------------------
    // Delete Encuesta
    // -----------------------------------------------------------------------------------------------

    $('#all-encuestas').on('click', '.deleteButton', function() {
        var self = this;

        if (confirmDelete('esta Encuesta')) {
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
        }
    });

    $('#cancel-edit').on('click', function (event) {
        $('#tab-agregar-encuesta').find('input').val('');
        $('#allPanels input').removeAttr('checked');
        $('#header-title').text('Agregar Encuesta');
        $('#save-encuesta').text('Agregar');
        $('#cancel-edit').hide();

        var myURL = window.location.href.split('?')[0];
        history.pushState({}, null, myURL);

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $('ul.tabs li').last().addClass('current');
        $('#tab-view-encuestas').addClass('current');
    });

    // -----------------------------------------------------------------------------------------------
    // Duplicate Encuesta
    // -----------------------------------------------------------------------------------------------

    $('#all-encuestas').on('click', '.duplicate-button', function() {
        var parentIdEncuesta = $(this).parent().attr('id');

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $('ul.tabs li').first().addClass('current');
        $("#tab-agregar-encuesta").addClass('current');

        $('#header-title').text('Agregar Encuesta');
        $('#save-encuesta').text('Agregar');

        $('#cancel-edit').show();

        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                action: 'GET_ENCUESTAS',
                id: parentIdEncuesta
            },
            dataType: 'json',
            success: function (response) {
                var result = response.result;
                $('#nombre').val(result.nombre);
                getDatefromString(result.fechaInicio, 0);
                getDatefromString(result.fechaFin, 1);
                $('#select-paneles').val(result.panel);

                var myURL = window.location.href.split('?')[0];
                myURL += '?parentid=' + result.id;
                history.pushState({}, null, myURL);
            },
            error: function (errorMsg) {
                alert('Error agregando encuesta.');
            }
        });
    });

    // -----------------------------------------------------------------------------------------------
    // Date Functions
    // -----------------------------------------------------------------------------------------------

    $('#mes, #anio').on('change', function() {
        changeSelect('Inicio');
    });

    $('#mes-fin, #anio-fin').on('change', function() {
        changeSelect('Fin');
    });
});
