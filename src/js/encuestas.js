$(document).on('ready', function () {

	setTimeout(function (event) {
        var parameters = {
            'action': 'GET_PANELES'
        };

        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: parameters,
            dataType: 'json',
            success: function (obj) {

            var currentHTML = '';
                currentHTML += '<tr>';
                    currentHTML += '<th></th>';
                    currentHTML += '<th>Nombre</th>';
                    currentHTML += '<th>Fecha Inicio</th>';
                    currentHTML += '<th>Fecha Fin</th>';
                    currentHTML += '<th>Cliente</th>';
                    currentHTML += '<th>Seleccionar</th>';
                currentHTML += '</tr>';
                for(var i = 0; i < obj.results.length; i++) {
                    currentHTML += '<tr value="' + obj.results[i].id +'">';
                        currentHTML += '<td></td>';
                        currentHTML += '<td>' + obj.results[i].nombre +'</td>';
                        currentHTML += '<td>' + obj.results[i].fechaInicio +'</td>';
                        currentHTML += '<td>' + obj.results[i].fechaFin +'</td>';
                        currentHTML += '<td>' + obj.results[i].cliente +'</td>';
                         currentHTML += '<td><input type="radio" value=' + obj.results[i].id + ' name="id"></td>';
                     currentHTML += '</tr>';
                    $('#allPanels').append(currentHTML);
                    currentHTML = '';
                }
            },
            error: function (error) {
                 $('#feedback').html('Error cargando los clientes.');
            }
        });
    }, 500);

    setTimeout(function (event) {
        var parameters = {
            'action': 'GET_ENCUESTAS'
        };

        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: parameters,
            dataType: 'json',
            success: function (obj) {

            var currentHTML = '';
                currentHTML += '<tr>';
                    currentHTML += '<th></th>';
                    currentHTML += '<th>Nombre</th>';
                    currentHTML += '<th>Fecha Inicio</th>';
                    currentHTML += '<th>Fecha Fin</th>';
                    currentHTML += '<th>Panel</th>';
                    currentHTML += '<th columnSpan = "2">Acción</th>';
                currentHTML += '</tr>';
                for(var i = 0; i < obj.results.length; i++) {
                    currentHTML += '<tr value="' + obj.results[i].id +'">';
                        currentHTML += '<td></td>';
                        currentHTML += '<td><a href="preguntas.php?id='+ obj.results[i].id +'">' + obj.results[i].nombre +'</a></td>';
                        currentHTML += '<td>' + obj.results[i].fechaInicio +'</td>';
                        currentHTML += '<td>' + obj.results[i].fechaFin +'</td>';
                        currentHTML += '<td>' + obj.results[i].panel +'</td>';
                        currentHTML += '<td class=modifyButton><input id= modify type=  submit  value= Modificar ></td>'
                        currentHTML += '<td class=deleteButton><input id= delete type=  submit  value= Eliminar ></td>';
                    currentHTML += '</tr>';
                    $('#allSurveys').append(currentHTML);
                    currentHTML = '';
                }
            },
            error: function (error) {
                 $('#feedback').html('Error cargando los clientes.');
            }
        });
    }, 500);

    $('#sendInfoEncuestas').on('click', function (event) {
        event.preventDefault();

        var idSurvey = window.location.search.substring(1)
        idSurvey = idSurvey.substring(3);

        var nombre = $('#nombre').val();
        var fechaInicio = $('#dateStarts').val();
        var fechaFin = $('#dateEnds').val();
        var panel = $('input[name=id]:checked').val();

        if (nombre === '' || fechaInicio === '' || fechaFin === '' || panel === '') {
            $('#feedback').html('Favor de llenar todos los campos');

            return;
        }

        if(idSurvey == ''){
            console.log(idSurvey);
            var parameters = {
                'action': 'ALTA_ENCUESTA',
                'nombre': nombre,
                'fechaInicio': fechaInicio,
                'fechaFin': fechaFin,
                'panel' : panel
            };
        }
        else {
            var parameters = {
                'action': 'ALTA_ENCUESTA',
                'nombre': nombre,
                'fechaInicio': fechaInicio,
                'fechaFin': fechaFin,
                'panel' : panel,
                'id' : idSurvey
            };
        }

        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: parameters,
            dataType: 'json',
            success: function (obj) {
                alert('Encuesta creada exitosamente.');
                location.replace('preguntas.php?id=' + obj.id);
            },
            error: function (error) {
                 $('#feedback').html('Encuesta no añadida, ha ocurrido un error.');
            }
        });
    });
});
