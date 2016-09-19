'use strict';

$(document).on('ready', function () {

	$('#uploadData').on('click', function (event) {
		$.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                action: 'ALTA_RECURSO',
               	nombre: $('#file-name').val(),
               	file: $('#file').val()
            },
            dataType: 'json',
            success: function (response) {
                
            },
            error: function (errorMsg) {
                alert('Error eliminando administrador.');
            }
        });
	});
});
