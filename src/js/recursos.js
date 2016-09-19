'use strict';

$(document).on('ready', function () {

	$('#uploadData').on('click', function (event) {
		$.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                action: 'ALTA_RECURSO',
               	nombre: $('#file-name').val(),
               	archivo: $('#file').val(),
                tipo: 1
            },
            dataType: 'json',
            success: function (response) {
              alert("Hola");  
            },
            error: function (errorMsg) {
                alert('Error eliminando administrador.');
            }
        });
	});
});
