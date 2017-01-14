'use strict';

function changeType (tipo, action) {
    return action === 0 ? (tipo === 1 ? 'Imagen' : 'Video') : (tipo === 'Imagen' ? 1 : 2);
}

function getData () {
    $.ajax({
        type: 'POST',
        url: '../api/controller.php',
        data: {action: 'GET_RECURSOS'},
        dataType: 'json',
        success: function (response) {
            var currentHTML = '<thead>';
            currentHTML += '<tr>';
            currentHTML += '<th>Nombre</th>';
            currentHTML += '<th>Tipo</th>';
            currentHTML += '<th>Eliminar</th>';
            currentHTML += '</tr>';
            currentHTML += '</thead>';
            currentHTML += '<tbody>';

            for (var i = 0; i < response.results.length; i++) {
                var result = response.results[i];
                var urlToResource = result.tipo == 1 ? "../resources/images/" : "../resources/videos/";
                urlToResource += result.nombre;

                currentHTML += '<tr id="' + result.nombre + '&' + result.tipo +'">';
                currentHTML += '<td><a href="' + urlToResource + '" target="_blank">' + result.nombre + '</a></td>';
                currentHTML += '<td>' + changeType(result.tipo, 0) + '</td>';
                currentHTML += '<td class="deleteButton"><button id="delete" type="button">Eliminar</button></td>';
                currentHTML += '</tr>';

                $('#all-resources').append(currentHTML);
                currentHTML = '';
            }

            currentHTML += '</tbody>';
        },
        error: function (error) {
            $('#feedback').html('Error cargando los recursos');
        }
    });
}

$(document).on('ready', function () {
    $('#recursos-header-option').addClass('selected');

    $('input[type=radio][name=tipo]').change(function () {
        var currentHTML = '';

        $('#extension').empty();

        if (this.value == '1') {
            currentHTML += '<option value="jpg">jpg</option>' +
            '<option value="png">png</option>';

            $('#extension').append(currentHTML);
        } else if (this.value == '2') {
            currentHTML += '<option value="mp4">mp4</option>';
            $('#extension').append(currentHTML);
        }
    });

    $('#upload-data').on('click', function () {
        $('#feedback').html('');

        var file_data = $('#file').prop('files')[0];
        var fileType = $('#extension').val();
        var name = $('#file-name').val().trim().split(' ').join('_');
        var type = $('input[name=tipo]:checked').val();
        var form_data = new FormData();

        if (name != '' && type != undefined && fileType != '' && file_data != undefined) {
            $('#feedback').html('');
            form_data.append('file', file_data);
            form_data.append('fileType', fileType);
            form_data.append('file-name', name);
            form_data.append('tipo', type);
            form_data.append('action', 'ALTA_RECURSO');

            $('#feedback').html('El archivo aparecerá en la lista una vez termine de subirse.');

            $.ajax({
                url: '../api/controller.php',
                dataType: 'json',
                cache: false,
                contentType: false,
                processData: false,
                data: form_data,
                type: 'post',
                success: function(response) {
                    if (response.status == 'ERROR') {
                        $('#feedback').html(response.reason);
                    } else {
                        location.reload();
                    }
                }
            });
        }
        else {
            $('#feedback').html('Favor de llenar todos los campos');
        }
    });

    // -----------------------------------------------------------------------------------------------
    // Fetch Resources
    // -----------------------------------------------------------------------------------------------

    setTimeout(function () {
        $('#all-resources').empty();
        $('#feedback').html('');

        getData();
    });

    $('#refresh').on('click', function () {
        $('#all-resources').empty();
        $('#feedback').html('');

        getData();
    });

    // -----------------------------------------------------------------------------------------------
    // Delete Resources
    // -----------------------------------------------------------------------------------------------

    $('#all-resources').on('click', '.deleteButton', function () {
        $('#feedback').html('');

        var self = this;
        var data = $(this).parent().attr('id').split('&');

        if (confirmDelete('este Recurso')) {
            $.ajax({
                url: '../api/controller.php',
                type: 'POST',
                data: {
                    action: 'DELETE_RECURSO',
                    nombre: data[0],
                    tipo: data[1]
                },
                dataType: 'json',
                success: function (response) {
                    alert('Recurso eliminado exitosamente.');
                    $(self).parent().remove();
                },
                error: function (errorMsg) {
                    alert('Error eliminando recurso.');
                }
            });
        }
    });

});
