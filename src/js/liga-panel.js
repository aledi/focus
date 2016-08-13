function getCheckedCheckboxesFor(checkboxName) {
    var checkboxes = document.querySelectorAll('input[name="' + checkboxName + '"]:checked'), values = [];
    Array.prototype.forEach.call(checkboxes, function(el) {
        values.push(parseInt(el.value, 10));
    });
    return values;
}

$(document).on('ready', function () {
    
    /*
    *   Función tomada de internet, funciona bien, pero aparentemente
    *   pueda llegar a tener problemas de ineficiencia dado a que es
    *   un objeto dependiente de la tabla y la cantidad de panelistas.
    */

    $("#filteringText").keyup(function () {
        //split the current value of searchInput
        var data = this.value.split(" ");
        //create a jquery object of the rows
        var jo = $("#fbody").find("tr");
        if (this.value == "") {
            jo.show();
            return;
        }
        //hide all the rows
        jo.hide();

        //Recusively filter the jquery object to get results.
        jo.filter(function (i, v) {
            var $t = $(this);
            for (var d = 0; d < data.length; ++d) {
                if ($t.is(":contains('" + data[d] + "')")) {
                    return true;
                }
            }
            return false;
        })
        //show the rows that match.
        .show();
    }).focus(function () {
        this.value = "";
        $(this).css({
            "color": "black"
        });
        $(this).unbind('focus');
    });

    var flagLoadingPanelist = 0;
    event.preventDefault();

	var id = window.location.search.substring(1)
	id = id.substring(3);

    var parameters = {
        'action': 'GET_PANELISTAS',
		'panel': id
    };

    $.ajax({
        type: 'POST',
        url: '../api/controller.php',
        data: parameters,
        dataType: 'json',
        success: function (obj) {

            var currentHTML = "";
            if(flagLoadingPanelist == 0){
                currentHTML += '<thead>';
                currentHTML += '<tr>';
                    currentHTML += '<th></th>';
                    currentHTML += '<th>Nombre</th>';
                    currentHTML += '<th>Edad</th>';
                    currentHTML += '<th>Municipio</th>';
                    currentHTML += '<th>Estado</th>';
                    currentHTML += '<th>Selección</th>';
                currentHTML += '</tr>';
                currentHTML += '</thead>';
                currentHTML += '<tbody id="fbody">';
                currentHTML 
                for(var i = 0; i < obj.results.length; i++) {
                    currentHTML += '<tr value="' + obj.results[i].id +'">';
                        currentHTML += "<td></td>";
                        currentHTML += "<td>" + obj.results[i].nombre +"</td>";
                        currentHTML += "<td>" + obj.results[i].edad +"</td>";
                        currentHTML += "<td>" + obj.results[i].municipio +"</td>";
                        currentHTML += "<td>" + obj.results[i].estado +"</td>";

                        if (obj.results[i].checked) {
                            currentHTML += '<td><input type="checkbox" value=' + obj.results[i].id + ' name="panelistas"' + ' checked></td>';
                        } else {
                            currentHTML += '<td><input type="checkbox" value=' + obj.results[i].id + ' name="panelistas"></td>';
                        }
                        
                    currentHTML += "</tr>";
                    $("#tablaPanelistas").append(currentHTML);
                    currentHTML = "";
                }
                flagLoadingPanelist = 1;
            }
            currentHTML += '</tbody>';
            $("#tablaPanelistas").tablesorter();
        },
        error: function (error) {
             $('#feedback').html("Error cargando los clientes.");
        }
    });

	$('#loginButtonLigarPanel').on('click', function (event) {
        event.preventDefault();

        var panelistas = getCheckedCheckboxesFor('panelistas');

        console.log(id);
        console.log(panelistas);

        if (panelistas === '') {
            $('#feedback').html('Favor de llenar todos los campos');

            return;
        }

        var parameters = {
            'action': 'SET_PANELISTAS_PANEL',
            'panelistas': panelistas,
            'panel' : id
        };

        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: parameters,
            dataType: 'json',
            success: function (obj) {
                alert("Panel ligado exitosamente.");
            },
            error: function (error) {
                 alert("error");
                 $('#feedback').html("Panel no ligado, ha ocurrido un error.");
            }
        });
    });

});
