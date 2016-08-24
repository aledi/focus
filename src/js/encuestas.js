'use strict';

$(document).on('ready', function () {
    setTimeout(function (event) {
        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: {'action': 'GET_PANELES'},
            dataType: 'json',
            success: function (obj) {
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
                    currentHTML += '<tr value="' + obj.results[i].id +'">';
                    currentHTML += '<td>' + obj.results[i].nombre +'</td>';
                    currentHTML += '<td>' + obj.results[i].fechaInicio +'</td>';
                    currentHTML += '<td>' + obj.results[i].fechaFin +'</td>';
                    currentHTML += '<td>' + obj.results[i].cliente +'</td>';
                    currentHTML += '<td class="centered"><input type="radio" value=' + obj.results[i].id + ' name="id"></td>';
                    currentHTML += '</tr>';

                    $('#allPanels').append(currentHTML);
                    currentHTML = '';
                }

                currentHTML += '</tbody>';
            },
            error: function (error) {
                $('#feedback').html('Error cargando los clientes.');
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
                    currentHTML += '<tr value="' + obj.results[i].id +'">';
                    currentHTML += '<td><a href="preguntas.php?id='+ obj.results[i].id +'">' + obj.results[i].nombre +'</a></td>';
                    currentHTML += '<td>' + obj.results[i].fechaInicio +'</td>';
                    currentHTML += '<td>' + obj.results[i].fechaFin +'</td>';
                    currentHTML += '<td>' + obj.results[i].panel +'</td>';
                    currentHTML += '<td class=modifyButton><button id=modify type=button>Modificar</button></td>';
                    currentHTML += '<td class=deleteButton><button id=delete type=button>Eliminar</button></td>';
                    currentHTML += '</tr>';

                    $('#allSurveys').append(currentHTML);
                    currentHTML = '';
                }

                currentHTML += '</tbody>';
            },
            error: function (error) {
                $('#feedback').html('Error cargando los clientes.');
            }
        });
    }, 500);

    $('#saveEncuesta').on('click', function (event) {
        event.preventDefault();

        var idSurvey = window.location.search.substring(1)
        idSurvey = idSurvey.substring(3);
        console.log(idSurvey);

        var nombre = $('#nombre').val();
        var fechaInicio = $('#dateStarts').val();
        var fechaFin = $('#dateEnds').val();
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

        if (idSurvey != '') {
            parameters.id = idSurvey;
        }

        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: parameters,
            dataType: 'json',
            success: function (obj) {
                alert('Encuesta creada exitosamente.');
                location.replace('preguntas.php?id=' + parameters.id);
            },
            error: function (error) {
                $('#feedback').html('Encuesta no añadida, ha ocurrido un error.');
            }
        });
    });

    $('#allSurveys').on('click','.deleteButton', function(){
        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                'action': 'DELETE_ENCUESTA',
                'id': $(this).parent().attr('value')
            },
            dataType: 'json',
            success: function (obj) {
                alert('Encuesta Eliminada!');
                $(this).parent().find('td.id').remove();
            },
            error: function (errorMsg) {
                alert('Error eliminando cliente');
            }
        });
    });

    $('#allSurveys').on('click','.modifyButton', function(){
        var idSurvey = $(this).parent().attr('value');

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
                'id': idSurvey
            },
            dataType: 'json',
            success: function(obj) {
               for (var i = 0; i < obj.results.length; i++) {
                    if (obj.results[i].id == idSurvey) {
                        console.log(obj.results[i].id)
                        $('#nombre').val(obj.results[i].nombre);
                        $('#dateStarts').val(obj.results[i].fechaInicio);
                        $('#dateEnds').val(obj.results[i].fechaFin);
                        $('input[name=id][value="' + obj.results[i].id + '"]').prop('checked', true);

                        var myURL = window.location.href.split('?')[0];
                        myURL = myURL + '?id=' + obj.results[i].id;
                        history.pushState({}, null, myURL);
                    }
                }
            },
            error: function (errorMsg) {
                alert('Error modificando Panelista');
            }
        });
    });

    $('#cancelModify').on('click', function (event) {
        $('#tab-agregarEncuesta').find('input').val('');
        $('#allPanels input').removeAttr('checked');
    });

});
