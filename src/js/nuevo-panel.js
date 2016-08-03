$(document).on('ready', function () {

    var parameters = {
        'action': 'GET_CLIENTES'
    };

    $.ajax({
        type: 'POST',
        url: '../api/controller.php',
        data: parameters,
        dataType: 'json',
        success: function (obj) {
        var currentHTML = "";
            currentHTML += '<tr>';
                currentHTML += '<th></th>';
                currentHTML += '<th>Username</th>';
                currentHTML += '<th>Nombre</th>';
                currentHTML += '<th>Correo</th>';
                currentHTML += '<th>Seleccionar</th>';
            currentHTML += '</tr>';
            for(var i = 0; i < obj.results.length; i++){
                currentHTML += '<tr value="' + obj.results[i].id + '">';
                    currentHTML += "<td></td>";
                    currentHTML += "<td>" + obj.results[i].username+"</td>";
                    currentHTML += "<td>" + obj.results[i].nombre+"</td>";
                    currentHTML += "<td>" + obj.results[i].email+"</td>";
                    currentHTML += '<td><input type="radio" value=' + obj.results[i].id + ' name="id"></td>';
                currentHTML += "</tr>";
                $("#tableClientes").append(currentHTML);
                currentHTML = "";
            }
        },
        error: function (error) {
             $('#feedback').html("Error cargando los clientes.");
        }
    });

	$('#loginButtonNuevoPanel').on('click', function (event) {
        event.preventDefault();

        var idPanel = window.location.search.substring(1)
        idPanel = idPanel.substring(3);

        var nombre = $('#panelName').val();
        var fechaInicio = $('#dateStarts').val();
        var fechaFin = $('#dateEnds').val();
        var cliente = $("input[name=id]:checked").val();

        if (nombre === '' || fechaInicio === '' || fechaFin === '' || cliente === '') {
            $('#feedback').html('Favor de llenar todos los campos');

            return;
        }

        if(idPanel == ''){
            console.log(idPanel);
            var parameters = {
                'action': 'ALTA_PANEL',
                'nombre': nombre,
                'fechaInicio': fechaInicio,
                'fechaFin': fechaFin,
                'cliente' : cliente
            };
        }
        else {
            var parameters = {
                'action': 'ALTA_PANEL',
                'nombre': nombre,
                'fechaInicio': fechaInicio,
                'fechaFin': fechaFin,
                'cliente' : cliente,
                'id' : idPanel
            };
        }

        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: parameters,
            dataType: 'json',
            success: function (obj) {
                alert("Panel creado exitosamente.");
                //location.replace("liga-panel-panelista.php?id=" + obj.id);
            },
            error: function (error) {
                 $('#feedback').html("Panel no añadido, ha ocurrido un error.");
            }
        });
    });

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

            var currentHTML = "";
                currentHTML += '<tr>';
                    currentHTML += '<th></th>';
                    currentHTML += '<th>Nombre</th>';
                    currentHTML += '<th>Fecha Inicio</th>';
                    currentHTML += '<th>Fecha Fin</th>';
                    currentHTML += '<th>Cliente</th>';
                    currentHTML += '<th colspan="2">Acción</th>';
                currentHTML += '</tr>';
                for(var i = 0; i < obj.results.length; i++) {
                    currentHTML += '<tr value="'+ obj.results[i].id +'">';
                        currentHTML += "<td></td>";
                        currentHTML += '<td><a href="liga-panel-panelista.php?id=' + obj.results[i].id +'">' + obj.results[i].nombre +"</a></td>";
                        currentHTML += "<td>" + obj.results[i].fechaInicio +"</td>";
                        currentHTML += "<td>" + obj.results[i].fechaFin +"</td>";
                        currentHTML += "<td>" + obj.results[i].cliente +"</td>";
                        currentHTML += "<td class=modifyButton><input id= modify type=  submit  value= Modificar ></td>"
                        currentHTML += "<td class=deleteButton><input id= delete type=  submit  value= Eliminar ></td>";
                    currentHTML += "</tr>";
                    $("#allPanels").append(currentHTML);
                    currentHTML = "";
                }
            },
            error: function (error) {
                 $('#feedback').html("Error cargando los clientes.");
            }
        });
    }, 500);
});
