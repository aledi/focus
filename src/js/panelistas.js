'use strict';

$(document).on('ready', function () {
    setTimeout(function (event) {
        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: {'action': 'GET_PANELISTAS'},
            dataType: 'json',
            success: function (obj) {
	            var currentHTML = '<thead>';
                currentHTML += '<tr>';
	            currentHTML += '<th class="left">Nombre</th>';
	            currentHTML += '<th>Género</th>';
	            currentHTML += '<th>Edad</th>';
	            currentHTML += '<th>Municipio</th>';
	            currentHTML += '<th>Estado</th>';
	            currentHTML += '<th colspan="2">Acción</th>';
                currentHTML += '</tr>';
	            currentHTML += '</thead>';
                currentHTML += '<tbody>';

	            for (var i = 0; i < obj.results.length; i++) {
	                currentHTML += '<tr value="' + obj.results[i].id +'">';
	                currentHTML += '<td>' + obj.results[i].nombre + " " + obj.results[i].apellidos +'</td>';
	                currentHTML += '<td>' + convertGenero(obj.results[i].genero) +'</td>';
	                currentHTML += '<td>' + obj.results[i].edad +'</td>';
	                currentHTML += '<td>' + obj.results[i].municipio +'</td>';
	                currentHTML += '<td>' + obj.results[i].estado +'</td>';
	                currentHTML += '<td class=modifyButton><button id=modify type=button>Modificar</button></td>';
	                currentHTML += '<td class=deleteButton><button id=delete type=button>Eliminar</button></td>';
	                currentHTML += '</tr>';


	                $('#allPanelistas').append(currentHTML);
	                currentHTML = '';
	            }

                currentHTML += '</tbody>';
            },
            error: function (error) {
                $('#feedback').html('Error cargando los clientes.');
            }
        });
    }, 500);

	$('#savePanelista').on('click', function (event) {
        var idPanelista = window.location.search.substring(1)
        idPanelista = idPanelista.substring(3);

        var parameters = {
            'action': 'ALTA_PANELISTA',
            'nombre': $('#firstName').val(),
            'apellidos': $('#lastName').val(),
            'email': $('#email').val(),
            'username': $('#username').val(),
            'password': $('#password').val(),
            'genero': $('input[name=gender]:checked').val(),
            'fechaNacimiento': $('#fechaNacimiento').val(),
            'educacion': $('#educacion').val(),
            'calleNumero': $('#calleNumero').val(),
            'colonia': $('#colonia').val(),
            'municipio': $('#municipio').val(),
            'estado': $('#estado').val(),
            'cp': $('#cp').val()
        };

        if(idPanelista != '') {
            parameters.id = idPanelista;
        }

        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: parameters,
            dataType: 'json',
            success: function (obj) {
                alert('Panelista agregado exitosamente.');
            },
            error: function (error) {
                $('#feedback').html('Panelista no añadido, ha ocurrido un error.');
            }
        });
    });

    $('#allPanelistas').on('click','.deleteButton', function(){
        var parameters = {
            'action': 'DELETE_PANELISTA',
            'id': $(this).parent().attr('value')
        }

        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: parameters,
            dataType: 'json',
            success: function (obj) {
                alert('Panelista Eliminado!');
                $(this).parent().find('td.id').remove();
            },
            error: function (errorMsg) {
                alert('Error eliminando Panelista');
            }
        });
    });

    $('#allPanelistas').on('click','.modifyButton', function(){
        var idPanelista = $(this).parent().attr('value');

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $('ul.tabs li').first().addClass('current');
        $("#tab-agregarPanelista").addClass('current');

        $('#headerTitle').text('Modificar Panelista');
        $('#savePanelista').text('Modificar');

        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                'action': 'GET_PANELISTAS',
                'id': idPanelista
            },
            dataType: 'json',
            success: function(obj){
                for (var i = 0; i < obj.results.length; i++) {
                    if (obj.results[i].id == idPanelista) {

                        $('#firstName').val(obj.results[i].nombre);
                        $('#lastName').val(obj.results[i].apellidos);
                        $('#email').val(obj.results[i].email);
                        $('#username').val(obj.results[i].username);
                        $('input[name="gender"][value="' + obj.results[i].genero + '"]').prop('checked', true);
                        $('#educacion').val(obj.results[i].educacion + '');
                        $('#calleNumero').val(obj.results[i].calleNumero);
                        $('#colonia').val(obj.results[i].colonia);
                        $('#municipio').val(obj.results[i].municipio);
                        $('#estado').val(obj.results[i].estado);
                        $('#cp').val(obj.results[i].cp);

                        var myURL = window.location.href.split('?')[0];
                        myURL = myURL + '?id=' + obj.results[i].id;
                        history.pushState({}, null, myURL);
                    }
                }
            },
            error: function (errorMsg) {
                alert('Error modificando Panelista');
            }
        });
    });

    $('#cp').keypress(function (event) {
        if (!event.metaKey && event.charCode !== 13 && (event.charCode < 48 || event.charCode > 57)) {
            event.preventDefault();
        }
    });
});
