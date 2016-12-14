'use strict';

var currentChecked = 0;
var limit = 0;

function getCheckedCheckboxesFor (checkboxName) {
    var checkboxes = document.querySelectorAll('input[name="' + checkboxName + '"]:checked'), values = [];
    Array.prototype.forEach.call(checkboxes, function(el) {
        values.push(parseInt(el.value, 10));
    });

    return values;
}

function checkNumberPanelistas (checkedBox) {
    if (currentChecked + 1 > limit && checkedBox.checked) {
        alert('Cantidad de panelistas seleccionados exceden el límite de ' + limit + ' panelistas permitidos.');
        checkedBox.checked = false;

        return;
    }

    currentChecked += checkedBox.checked ? 1 : -1;
    $('#current-checked').html(currentChecked + ' / ' + limit);
}

function checkAll (checkedBox) {
    var tableSize = $('#fbody > tr').length;
    var checkboxes = document.getElementsByName('panelista-checkbox');
    if (tableSize > limit && checkedBox.checked) {
        alert('Cantidad de panelistas seleccionados exceden el límite de ' + limit + ' panelistas permitidos.');
        checkedBox.checked = false;

        return;
    }

    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].parentElement.parentElement.style.display !== 'none') {
            checkboxes[i].checked = checkedBox.checked;
            currentChecked += 1;
        }
    }

    $('#current-checked').html(currentChecked + ' / ' + limit);
}

$(document).on('ready', function () {
    $('#paneles-header-option').addClass('selected');

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

    var urlParameters = window.location.search.substring(1);
    urlParameters = urlParameters.split('&')

    var id = urlParameters[0].substring(3);
    limit = urlParameters[1].substring(4);

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
                currentHTML += '<th>Fecha Registro</th>';
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
                    currentHTML += '<td>' + result.nombre + '</td>';
                    currentHTML += '<td>' + convertGenero(result.genero) + '</td>';
                    currentHTML += '<td class="centered">' + result.edad + '</td>';
                    currentHTML += '<td>' + convertEducacion(result.educacion) + '</td>';
                    currentHTML += '<td>' + readableDate(result.fechaRegistro) + '</td>';
                    currentHTML += '<td>' + result.municipio + '</td>';
                    currentHTML += '<td class="centered">' + result.estado + '</td>';
                    currentHTML += '<td class="centered"><input type="checkbox" onclick="checkNumberPanelistas(this)" value=' + result.id + ' name="panelista-checkbox"' + (result.checked ?  ' checked' : '') + ' class="' + (elegible ? '' : 'hidden') + '"></td>';
                    currentHTML += '</tr>';

                    currentChecked += result.checked ? 1 : 0;

                    $('#tablaPanelistas').append(currentHTML);
                    currentHTML = '';
                }

                flagLoadingPanelist = 1;
            }

            $('#current-checked').html(currentChecked + ' / ' + limit);
            currentHTML += '</tbody>';
        },
        error: function (error) {
            $('#feedback').html('Error cargando los clientes');
        }
    });

    $('#ligar-panelistas').on('click', function (event) {
        event.preventDefault();

        var panelistas = getCheckedCheckboxesFor('panelista-checkbox');
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
