'use strict';

$(document).on('ready', function () {
    setTimeout(function (event) {
        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: {'action': 'GET_PANELES'},
            dataType: 'json',
            success: function (obj) {
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

                for (var i = 0; i < obj.results.length; i++) {
                    var result = obj.results[i];

                    currentHTML += '<tr value="' + result.id +'">';
                    currentHTML += '<td>' + result.nombre +'</td>';
                    currentHTML += '<td>' + result.fechaInicio +'</td>';
                    currentHTML += '<td>' + result.fechaFin +'</td>';
                    currentHTML += '<td>' + result.cliente +'</td>';
                    currentHTML += '<td class="centered"><input type="radio" value=' + result.id + ' name="id"></td>';
                    currentHTML += '</tr>';

                    $('#allPanels').append(currentHTML);
                    currentHTML = '';
                }

                currentHTML += '</tbody>';
            },
            error: function (error) {
                $('#feedback').html('Error cargando los clientes');
            }
        });
    }, 500);

    setTimeout(function (event) {
        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: {'action': 'GET_ENCUESTAS'},
            dataType: 'json',
            success: function (obj) {
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
            },
            error: function (error) {
                $('#feedback').html('Error cargando los clientes');
            }
        });
    }, 500);

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

        var parameters = {
            'action': 'ALTA_ENCUESTA',
            'nombre': nombre,
            'fechaInicio': fechaInicio,
            'fechaFin': fechaFin,
            'panel' : panel
        };

        if (idEncuesta != '') {
            parameters.id = idEncuesta;
        }

        var actionText = idEncuesta !== '' ? 'modificada' : 'agregada';
        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: parameters,
            dataType: 'json',
            success: function (obj) {
                alert('Encuesta ' + actionText + ' exitosamente.');
                //location.replace('preguntas.php?id=' + obj.id);
            },
            error: function (error) {
                $('#feedback').html('Encuesta no ' + actionText + '. Ha ocurrido un error.');
            }
        });
    });

    $('#allEncuestas').on('click', '.deleteButton', function(){
        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                'action': 'DELETE_ENCUESTA',
                'id': $(this).parent().attr('value')
            },
            dataType: 'json',
            success: function (obj) {
                alert('Encuesta eliminada exitosamente.');
                $(this).parent().find('td.id').remove();
            },
            error: function (errorMsg) {
                alert('Error eliminando encuesta.');
            }
        });
    });

    $('#allEncuestas').on('click', '.modifyButton', function(){
        var idEncuesta = $(this).parent().attr('value');

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $('ul.tabs li').first().addClass('current');
        $("#tab-agregarEncuesta").addClass('current');

        $('#headerTitle').text('Modificar Encuesta');
        $('#saveEncuesta').text('Modificar');

        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                'action': 'GET_ENCUESTAS',
                'id': idEncuesta
            },
            dataType: 'json',
            success: function (obj) {
                for (var i = 0; i < obj.results.length; i++) {
                    var result = obj.results[i];

                    if (result.id === idEncuesta) {
                        $('#nombre').val(result.nombre);
                        getDatefromString(obj.results[i].fechaInicio, 0);
                        getDatefromString(obj.results[i].fechaFin, 1);
                        $('input[name=id][value="' + result.id + '"]').prop('checked', true);

                        var myURL = window.location.href.split('?')[0];
                        myURL = myURL + '?id=' + result.id;
                        history.pushState({}, null, myURL);
                    }
                }
            },
            error: function (errorMsg) {
                alert('Error modificando encuesta.');
            }
        });
    });

    $('#cancelModify').on('click', function (event) {
        $('#tab-agregarEncuesta').find('input').val('');
        $('#allPanels input').removeAttr('checked');
        $('#headerTitle').text('Agregar Encuesta');
        $('#saveEncuesta').text('Agregar');

        var myURL = window.location.href.split('?')[0];
        history.pushState({}, null, myURL);

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $('ul.tabs li').last().addClass('current');
        $("#tab-modificarEncuesta").addClass('current');
    });

     $(document).on('change', '#mes', function(){
        var mes = parseInt($('select#mes').val());
        var anio = parseInt($('select#anio').val());
        var dias = getMonthDays(mes, anio);
        fillDay(dias, 1);
    });

    $(document).on('change', '#anio', function(){
        var mes = parseInt($('select#mes').val());
        var anio = parseInt($('select#anio').val());
        var dias = getMonthDays(mes, anio);
        fillDay(dias, 1);
    });
});
