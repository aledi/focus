function getCheckedCheckboxesFor(checkboxName) {
    var checkboxes = document.querySelectorAll('input[name="' + checkboxName + '"]:checked'), values = [];
    Array.prototype.forEach.call(checkboxes, function(el) {
        values.push(parseInt(el.value, 10));
    });
    return values;
}

$(document).on('ready', function () {

    var flagLoadingPanelist = 0;
    event.preventDefault();

    var parameters = {
        'action': 'GET_PANELISTAS'
    };

    $.ajax({
        type: 'POST',
        url: '../api/controller.php',
        data: parameters,
        dataType: 'json',
        success: function (obj) {

            var currentHTML = "";
            if(flagLoadingPanelist == 0){
                currentHTML += '<tr>';
                    currentHTML += '<th></th>';
                    currentHTML += '<th>ID</th>';
                    currentHTML += '<th>Nombre</th>';
                    currentHTML += '<th>Género</th>';
                    currentHTML += '<th>Edad</th>';
                    currentHTML += '<th>Estado Civil</th>';
                    currentHTML += '<th>Municipio</th>';
                    currentHTML += '<th>Estado</th>';
                    currentHTML += '<th></th>';
                currentHTML += '</tr>';
                for(var i = 0; i < obj.results.length; i++) {
                    currentHTML += "<tr>";
                        currentHTML += "<td></td>";
                        currentHTML += "<td class='id'>" + obj.results[i].id +"</td>";
                        currentHTML += "<td>" + obj.results[i].nombre +"</td>";
                        currentHTML += "<td>" + convertData('Genero', obj.results[i].genero) +"</td>";
                        currentHTML += "<td>" + obj.results[i].edad +"</td>";
                        currentHTML += "<td>" + convertData('edoCivil', obj.results[i].edoCivil) +"</td>";
                        currentHTML += "<td>" + obj.results[i].municipio +"</td>";
                        currentHTML += "<td>" + obj.results[i].estado +"</td>";
                        currentHTML += '<td><input type="checkbox" value=' + obj.results[i].id + ' name="panelistas"></td>"';
                    currentHTML += "</tr>";
                    $("#tablaPanelistas").append(currentHTML);
                    currentHTML = "";
                }
                flagLoadingPanelist = 1;
            }       
        },
        error: function (error) {
             $('#feedback').html("Error cargando los clientes.");
        }
    });

	$('#loginButtonLigarPanel').on('click', function (event) {
        event.preventDefault();

        var panelistas = getCheckedCheckboxesFor('panelistas');
        var id = window.location.search.substring(1)
        id = id.substring(3); 

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
