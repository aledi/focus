'use strict';

function getCheckedCheckboxesFor (checkboxName) {
    var checkboxes = document.querySelectorAll('input[name="' + checkboxName + '"]:checked'), values = [];
    Array.prototype.forEach.call(checkboxes, function(el) {
        values.push(parseInt(el.value, 10));
    });

    return values;
}

function checkAll (checkedBox) {
    var checkboxes = document.getElementsByName('panelistaCheckbox');
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].className !== 'hidden') {
            checkboxes[i].checked = checkedBox.checked;
        }
    }
}

$(document).on('ready', function () {
    $('#paneles-header-option').addClass('selected');

    /*
    *   Función tomada de internet, funciona bien, pero aparentemente
    *   pueda llegar a tener problemas de ineficiencia dado a que es
    *   un objeto dependiente de la tabla y la cantidad de panelistas.
    */

    $('#filteringText').keyup(function () {
        //split the current value of searchInput
        var data = this.value.split(' ');

        //create a jquery object of the rows
        var jsonObject = $("#fbody").find("tr");
        if (this.value == '') {
            jsonObject.show();
            return;
        }

        //hide all the rows
        jsonObject.hide();

        //Recusively filter the jquery object to get results.
        jsonObject.filter(function (i, v) {
            var $table = $(this);
            for (var x = 0; x < data.length; x++) {
                if ($table.text().toLowerCase().indexOf(data[x].toLowerCase()) > -1) {
                    return true;
                }
            }
            return false;
        })
        //show the rows that match.
        .show();
    }).focus(function () {
        this.value = '';

        $(this).css({"color": "black"});
        $(this).unbind('focus');
    });

    var flagLoadingPanelist = 0;
    event.preventDefault();

    var id = window.location.search.substring(1);
    id = id.substring(3);

    $.ajax({
        type: 'POST',
        url: '../api/controller.php',
        data: {
            'action': 'GET_PANELISTAS',
            'panel': id
        },
        dataType: 'json',
        success: function (response) {
            if (flagLoadingPanelist == 0) {
                var currentHTML = '<thead>';
                currentHTML += '<tr style="cursor:pointer">';
                currentHTML += '<th>Nombre</th>';
                currentHTML += '<th>Género</th>';
                currentHTML += '<th>Edad</th>';
                currentHTML += '<th>Educación</th>';
                currentHTML += '<th>Municipio</th>';
                currentHTML += '<th>Estado</th>';
                currentHTML += '<th><input type="checkbox" onclick="checkAll(this)"/></th>';
                currentHTML += '</tr>';
                currentHTML += '</thead>';
                currentHTML += '<tbody id="fbody">';

                for (var i = 0; i < response.results.length; i++) {
                    var result = response.results[i];
                    var elegible = (result.genero !== -1 && result.edad !== 0 && result.estado !== '');

                    currentHTML += '<tr value="' + result.id + '" class="' + (elegible ? '' : 'red') + '">';
                    currentHTML += '<td>' + result.nombre + ' ' + result.apellidos + '</td>';
                    currentHTML += '<td>' + convertGenero(result.genero) + '</td>';
                    currentHTML += '<td class="centered">' + result.edad + '</td>';
                    currentHTML += '<td>' + convertEducacion(result.educacion) + '</td>';
                    currentHTML += '<td>' + result.municipio + '</td>';
                    currentHTML += '<td class="centered">' + result.estado + '</td>';
                    currentHTML += '<td class="centered"><input type="checkbox" value=' + result.id + ' name="panelistaCheckbox"' + (result.checked ?  ' checked' : '') + ' class="' + (elegible ? '' : 'hidden') + '"></td>';
                    currentHTML += '</tr>';

                    $('#tablaPanelistas').append(currentHTML);
                    currentHTML = '';
                }

                flagLoadingPanelist = 1;
            }

            currentHTML += '</tbody>';

            $('tablaPanelistas').tablesorter({
                // pass the headers argument and assing an object
                headers: {
                    // assign the secound column (we start counting zero)
                    4: {
                        // disable it by setting the property sorter to false
                        sorter: false
                    },
                    // assign the third column (we start counting zero)
                }
            });
        },
        error: function (error) {
            $('#feedback').html('Error cargando los clientes');
        }
    });

    $('#ligar-panelistas').on('click', function (event) {
        event.preventDefault();

        var panelistas = getCheckedCheckboxesFor('panelistaCheckbox');
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
            success: function (response) {
                alert('Panel ligado exitosamente.');
                location.replace('paneles.php');
            },
            error: function (error) {
                alert("error");
                $('#feedback').html('Panel no ligado, ha ocurrido un error.');
            }
        });
    });
});
