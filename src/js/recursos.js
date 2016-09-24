'use strict';

function changeType(tipo, action) {
    return (action === 0) ? (tipo === 1 ? "Imagen" : "Video") : (tipo === "Imagen" ? 1 : 2);
}

$(document).on('ready', function () {

    $('input[type=radio][name=tipo]').change(function() {
        var currentHTML = ''
        $('#extension').empty();
        if (this.value == '1') {
            currentHTML += '<option value="jpg">jpg</option>' +
            '<option value="png">png</option>';

            $('#extension').append(currentHTML);
        }
        else if (this.value == '2') {
            currentHTML += '<option value="mp4">mp4</option>';

            $('#extension').append(currentHTML);
        }
    });

    $('#uploadData').on('click', function() {
        var file_data = $('#file').prop('files')[0]; 
        var fileType = $('#extension').val();  
        var name = $('#file-name').val();
        var type = $('input[name=tipo]:checked').val();
        var form_data = new FormData();


        if (name != '' && type != undefined && fileType != '' && file_data != undefined) {
            $('#feedback').html('');
            form_data.append('file', file_data);
            form_data.append('fileType', fileType);
            form_data.append('file-name', name);
            form_data.append('tipo', type);
            form_data.append('action', 'ALTA_RECURSO');                          
            $.ajax({
                    url: '../api/controller.php', // point to server-side PHP script 
                    dataType: 'json',  // what to expect back from the PHP script, if anything
                    cache: false,
                    contentType: false,
                    processData: false,
                    data: form_data,                         
                    type: 'post',
                    success: function(response){
                        if (response.status == 'ERROR') {
                            $('#feedback').html(response.reason);
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
        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: {
                'action': 'GET_RECURSOS'
            },
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

                    currentHTML += '<tr id="'+ result.id + '&' + result.nombre + '&' + result.tipo +'">';
                    currentHTML += '<td>' + result.nombre + '</td>';
                    currentHTML += '<td>' + changeType(result.tipo, 0) + '</td>';
                    currentHTML += '<td class="deleteButton"><button id="delete" type="button">Eliminar</button></td>';
                    currentHTML += '</tr>';

                    $('#allResources').append(currentHTML);
                    currentHTML = '';
                }

                currentHTML += '</tbody>';
            },
            error: function (error) {
                $('#feedback').html('Error cargando los recursos');
            }
        });
    });

    // -----------------------------------------------------------------------------------------------
    // Delete Resources
    // -----------------------------------------------------------------------------------------------

    $('#allResources').on('click', '.deleteButton', function () {
        var self = this;
        var data = $(this).parent().attr('id').split('&');
        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                action: 'DELETE_RECURSO',
                id: data[0],
                nombre: data[1],
                tipo: changeType(data[2], 1)
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
    });

});
