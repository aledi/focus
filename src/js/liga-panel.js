function getCheckedCheckboxesFor (checkboxName) {
    var checkboxes = document.querySelectorAll('input[name="' + checkboxName + '"]:checked'), values = [];
    Array.prototype.forEach.call(checkboxes, function(el) {
        values.push(parseInt(el.value, 10));
    });

    return values;
}

$(document).on('ready', function () {
    var flagLoadingPanelist = 0;
    event.preventDefault();

    var id = window.location.search.substring(1)
    id = id.substring(3);

    $.ajax({
        type: 'POST',
        url: '../api/controller.php',
        data: {
            'action': 'GET_PANELISTAS',
            'panel': id
        },
        dataType: 'json',
        success: function (obj) {
            if (flagLoadingPanelist == 0) {
                var currentHTML = '<tr>';
                currentHTML += '<th></th>';
                currentHTML += '<th>Nombre</th>';
                currentHTML += '<th>Edad</th>';
                currentHTML += '<th>Municipio</th>';
                currentHTML += '<th>Estado</th>';
                currentHTML += '<th>Selección</th>';
                currentHTML += '</tr>';

                for (var i = 0; i < obj.results.length; i++) {
                    currentHTML += '<tr value="' + obj.results[i].id +'">';
                    currentHTML += '<td></td>';
                    currentHTML += '<td>' + obj.results[i].nombre +'</td>';
                    currentHTML += '<td>' + obj.results[i].edad +'</td>';
                    currentHTML += '<td>' + obj.results[i].municipio +'</td>';
                    currentHTML += '<td>' + obj.results[i].estado +'</td>';

                    if (obj.results[i].checked) {
                        currentHTML += '<td><input type="checkbox" value=' + obj.results[i].id + ' name="panelistas"' + ' checked></td>';
                    } else {
                        currentHTML += '<td><input type="checkbox" value=' + obj.results[i].id + ' name="panelistas"></td>';
                    }

                    currentHTML += '</tr>';
                    $("#tablaPanelistas").append(currentHTML);
                    currentHTML = '';
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
        if (panelistas === '') {
            $('#feedback').html('Favor de llenar todos los campos');
            return;
        }

        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: {
                'action': 'SET_PANELISTAS_PANEL',
                'panelistas': panelistas,
                'panel' : id
            },
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
