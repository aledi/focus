'use strict';

var currentCliente = 0;

function getData () {
    if (currentCliente <= 0) {
        $('#refresh').hide();
        return;
    }

    $('#refresh').show();

    $.ajax({
        type: 'POST',
        url: '../api/controller.php',
        data: {
            'action': 'GET_PANELES',
            'cliente': currentCliente
        },
        dataType: 'json',
        success: function (response) {
            if (response.results.length === 0) {
                $('#available-paneles-feedback').html('No hay paneles disponibles');
                return;
            }

            var currentHTML = '<thead>';
            currentHTML += '<tr>';
            currentHTML += '<th>Nombre</th>';
            currentHTML += '<th>Fecha Inicio</th>';
            currentHTML += '<th>Fecha Fin</th>';
            currentHTML += '<th>Cliente</th>';
            currentHTML += '<th colspan="2">Acción</th>';
            currentHTML += '</tr>';
            currentHTML += '</thead>';
            currentHTML += '<tbody>';

            for (var i = 0; i < response.results.length; i++) {
                var result = response.results[i];

                currentHTML += '<tr id="'+ result.id +'">';
                currentHTML += '<td><a href="liga-panel-panelista.php?id=' + result.id + '&num=' + result.numParticipantes+'">' + result.nombre +"</a></td>";
                currentHTML += "<td>" + readableDate(result.fechaInicio) + "</td>";
                currentHTML += "<td>" + readableDate(result.fechaFin) + "</td>";
                currentHTML += "<td>" + result.cliente + "</td>";
                currentHTML += '<td class=edit-button><button id=edit type=button>Editar</button></td>';
                currentHTML += '<td class=deleteButton><button id=delete type=button>Eliminar</button></td>';
                currentHTML += '</tr>';
            }

            currentHTML += '</tbody>';
            $('#all-panels').append(currentHTML);
        },
        error: function (error) {
            $('#feedback').html('Error cargando los paneles');
        }
    });
}

$(document).on('ready', function () {
    $('#paneles-header-option').addClass('selected');
    $('#select-clientes').hide();
    $('#clientes-filter-select').hide();
    $('#cancel-edit').hide();
    $('#refresh').hide();

    fillSelects(1, 0);
    fillSelects(2, 0);
    fillSelects(3, 0);

    // -----------------------------------------------------------------------------------------------
    // Fetch Clientes
    // -----------------------------------------------------------------------------------------------

    $.ajax({
        type: 'POST',
        url: '../api/controller.php',
        data: {'action': 'GET_CLIENTES'},
        dataType: 'json',
        success: function (response) {
            if (response.results.length === 0) {
                $('#available-clientes-feedback').html('No hay clientes disponibles');
                $('#available-paneles-feedback').html('No hay clientes disponibles');

                return;
            }

            var currentHTML = '<option value="0"> Selecciona un cliente </option>';

            for (var i = 0; i < response.results.length; i++) {
                var result = response.results[i];

                currentHTML += '<option value="' + result.id + '">';
                currentHTML += result.nombre + ' ' + result.apellidos;
                currentHTML += '</option>';
            }

            $('#select-clientes').append(currentHTML);
            $('#clientes-filter-select').append(currentHTML);
            $('#select-clientes').show();
            $('#clientes-filter-select').show();
        },
        error: function (error) {
            $('#feedback').html('Error cargando los clientes');
        }
    });

    // -----------------------------------------------------------------------------------------------
    // Fetch Paneles
    // -----------------------------------------------------------------------------------------------

    $('#clientes-filter-select').on('change', function() {
        currentCliente = parseInt($('#clientes-filter-select').val(), 10);

        $('#all-panels').empty();
        $('#available-paneles-feedback').html('');

        getData();
    });

    $('#refresh').on('click', function (){
        $('#all-panels').empty();
        $('#available-paneles-feedback').html('');

        getData();
    });

    // -----------------------------------------------------------------------------------------------
    // Save Panel
    // -----------------------------------------------------------------------------------------------

    $('#save-panel').on('click', function (event) {
        event.preventDefault();

        var idPanel = window.location.search.substring(1);
        idPanel = idPanel.substring(3);

        var nombre = $('#panel-name').val();
        var numParticipantes = parseInt($('#participantes').val(), 10);
        var descripcion = $('#descripcion').val();
        var fechaInicio = getCompleteDate(1);
        var fechaFin = getCompleteDate(2);
        var cliente = parseInt($('#select-clientes').val());

        if (!nombre || !nombre.trim()) {
            $('#feedback').html('Favor de elegir un nombre');
            return;
        }

        if (!numParticipantes || numParticipantes === 0) {
            $('#feedback').html('El número de participantes debe ser mayor a 0');
            return;
        }

        if (!cliente || cliente === 0) {
            $('#feedback').html('Favor de seleccionar un cliente');
            return;
        }

        var startDate = new Date($('select#anio').val(), parseInt($('select#mes').val(),10) - 1, $('select#dia').val());
        var endDate = new Date($('select#anio-fin').val(), parseInt($('select#mes-fin').val(),10) - 1, $('select#dia-fin').val());

        if (endDate <= startDate) {
            $('#feedback').html('La fecha fin debe ser posterior a la fecha de inicio');
            return;
        }

        var data = {
            action: 'ALTA_PANEL',
            nombre: nombre,
            numParticipantes: numParticipantes,
            descripcion: descripcion,
            fechaInicio: fechaInicio,
            fechaFin: fechaFin,
            cliente: cliente
        };

        if (idPanel != '') {
            data.id = idPanel;
        }

        var actionText = idPanel !== '' ? 'editado' : 'agregado';
        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: data,
            dataType: 'json',
            success: function (response) {
                if (response.status === 'SUCCESS') {
                    alert('Panel ' + actionText + ' exitosamente.');
                    location.replace((actionText == 'agregado') ? 'liga-panel-panelista.php?id=' + response.id + '&num=' + response.numParticipantes : 'paneles.php');
                } else if (response.status === 'RECORD_EXISTS') {
                    $('#feedback').html('El panel ya existe. Por favor, elija un nombre diferente.');
                } else {
                    $('#feedback').html('Hubo un error al guardar el panel. Por favor, intente más tarde.');
                }
            },
            error: function (error) {
                $('#feedback').html('Panel no ' + actionText + '. Ha ocurrido un error.');
            }
        });
    });

    // -----------------------------------------------------------------------------------------------
    // Edit Panel
    // -----------------------------------------------------------------------------------------------

    $('#all-panels').on('click', '.edit-button', function () {
        var idPanel = $(this).parent().attr('id');

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $('ul.tabs li').first().addClass('current');
        $('#tab-agregar-panel').addClass('current');

        $('#header-title').text('Editar Panel');
        $('#save-panel').text('Editar');
        $('#cancel-edit').show();

        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                action: 'GET_PANELES',
                id: idPanel
            },
            dataType: 'json',
            success: function (response) {
                var result = response.result;

                $('#panel-name').val(result.nombre);
                $('#participantes').val(result.numParticipantes);
                getDatefromString(result.fechaInicio, 0);
                getDatefromString(result.fechaFin, 1);
                $('#select-clientes').val(result.cliente);

                var myURL = window.location.href.split('?')[0];
                myURL += '?id=' + result.id;
                history.pushState({}, null, myURL);
            },
            error: function (errorMsg) {
                alert('Error editando panelista.');
            }
        });
    });

    // -----------------------------------------------------------------------------------------------
    // Delete Panel
    // -----------------------------------------------------------------------------------------------

    $('#all-panels').on('click', '.deleteButton', function () {
        var self = this;
        var data = {
            'action': 'DELETE_PANEL',
            'id': $(this).parent().attr('id')
        }

        if (confirmDelete('este Panel')) {
            $.ajax({
                url: '../api/controller.php',
                type: 'POST',
                data: data,
                dataType: 'json',
                success: function (response) {
                    alert('Panel eliminado exitosamente.');
                    $(self).parent().remove();
                },
                error: function (errorMsg) {
                    alert('Error eliminando panelista.');
                }
            });
        }
    });

    $('#cancel-edit').on('click', function (event) {
        $('#tab-agregar-panel').find('input').val('');
        $('#table-clientes input').removeAttr('checked');
        $('#header-title').text('Agregar Panel');
        $('#save-panel').text('Agregar');
        $('#cancel-edit').hide();
        var myURL = window.location.href.split('?')[0];
        history.pushState({}, null, myURL);

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $('ul.tabs li').last().addClass('current');
        $('#tab-view-paneles').addClass('current');
    });

    $('#mes, #anio').on('change', function () {
        changeSelect('Inicio');
    });

    $('#mes-fin, #anio-fin').on('change', function () {
        changeSelect('Fin');
    });
});
