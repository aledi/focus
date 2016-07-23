$(document).on('ready', function () {
	var flagLoadingUser = 0;
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
            if(flagLoadingUser == 0){
                currentHTML += '<tr>';
                    currentHTML += '<th></th>';
                    currentHTML += '<th>ID</th>';
                    currentHTML += '<th>Username</th>';
                    currentHTML += '<th>Nombre</th>';
                    currentHTML += '<th>Correo</th>';
                    currentHTML += '<th>Seleccionar</th>';
                currentHTML += '</tr>';
                for(var i = 0; i < obj.results.length; i++)
                {
                    currentHTML += "<tr>";
                        currentHTML += "<td></td>";
                        currentHTML += "<td class='id'>" + obj.results[i].id+"</td>";
                        currentHTML += "<td>" + obj.results[i].username+"</td>";
                        currentHTML += "<td>" + obj.results[i].nombre+"</td>";
                        currentHTML += "<td>" + obj.results[i].email+"</td>";
                        currentHTML += '<td><input type="radio" value=' + obj.results[i].id + ' name="id"></td>';
                    currentHTML += "</tr>";
                    $("#tableClientes").append(currentHTML);
                    currentHTML = "";
                }
                flagLoadingUser = 1;
            }
        },
        error: function (error) {
             $('#feedback').html("Error cargando los clientes.");
        }
    });

	$('#loginButtonNuevoPanel').on('click', function (event) {
        event.preventDefault();

        var nombre = $('#panelName').val();
        var fechaInicio = $('#dateStarts').val();
        var fechaFin = $('#dateEnds').val();
        var cliente = $("input[name=id]:checked").val();

        if (nombre === '' || fechaInicio === '' || fechaFin === '' || cliente === '') {
            $('#feedback').html('Favor de llenar todos los campos');

            return;
        }

        var parameters = {
            'action': 'ALTA_PANEL',
            'nombre': nombre,
            'fechaInicio': fechaInicio,
            'fechaFin': fechaFin,
            'cliente' : cliente
        };

        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: parameters,
            dataType: 'json',
            success: function (obj) {
                alert("Panel creado exitosamente.");
                location.replace("liga-panel-panelista.php?id=" + obj.id);
            },
            error: function (error) {
                 $('#feedback').html("Panel no añadido, ha ocurrido un error.");
            }
        });
    });

    var flagLoadingPanel = 0;
    $('#tab-modPanel').on('click', function (event) {
        event.preventDefault();

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
                if(flagLoadingPanel == 0){
                    currentHTML += '<tr>';
                        currentHTML += '<th></th>';
                        currentHTML += '<th>ID</th>';
                        currentHTML += '<th>Nombre</th>';
                        currentHTML += '<th>Fecha Inicio</th>';
                        currentHTML += '<th>Fecha Fin</th>';
                        currentHTML += '<th>Cliente</th>';
                        currentHTML += '<th>Creador</th>';
                        currentHTML += '<th colspan="2">Acción</th>';
                    currentHTML += '</tr>';
                    for(var i = 0; i < obj.results.length; i++)
                    {
                        currentHTML += "<tr>";
                            currentHTML += "<td></td>";
                            currentHTML += "<td class='id'>" + obj.results[i].id +"</td>";
                            currentHTML += "<td>" + obj.results[i].nombre +"</td>";
                            currentHTML += "<td>" + obj.results[i].fechaInicio +"</td>";
                            currentHTML += "<td>" + obj.results[i].fechaFin +"</td>";
                            currentHTML += "<td>" + obj.results[i].cliente +"</td>";
                            currentHTML += "<td>" + obj.results[i].creador +"</td>";
                            currentHTML += "<td class=modifyButton><input id= modify type=  submit  value= Modificar ></td>"
                            currentHTML += "<td class=deleteButton><input id= delete type=  submit  value= Eliminar ></td>";
                        currentHTML += "</tr>";
                        $("#allPanels").append(currentHTML);
                        currentHTML = "";
                    }
                    flagLoadingPanel = 1;
                }
            },
            error: function (error) {
                 $('#feedback').html("Error cargando los clientes.");
            }
        });
    });

    $("#allPanels").on("click",".deleteButton", function(){
        var parameters = {
            "action": "DELETE_PANEL",
            "id": $(this).parent().find("td.id").text()
        }
        console.log(parameters);
        $.ajax({
            url: "../api/controller.php",
            type: "POST",
            data: parameters,
            dataType: "json",
            success: function(obj){
                alert("Panelista Eliminado!");
                console.log(obj.status);
                $(this).parent().find("td.id").remove();
            },
            error: function(errorMsg)
            {
                alert("Error eliminando Panelista");
            }
        });
    });
});
