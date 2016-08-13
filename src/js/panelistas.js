$(document).on('ready', function () {

    setTimeout(function (event) {
        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: {'action': 'GET_PANELISTAS'},
            dataType: 'json',
            success: function (obj) {
            	console.log(obj);
	            var currentHTML = '<tr>';
	            currentHTML += '<th></th>';
	            currentHTML += '<th>Nombre</th>';
	            currentHTML += '<th>Género</th>';
	            currentHTML += '<th>Edad</th>';
	            currentHTML += '<th>Municipio</th>';
	            currentHTML += '<th>Estado</th>';
	            currentHTML += '<th colspan="2">Acción</th>';
	            currentHTML += '</tr>';

	            for (var i = 0; i < obj.results.length; i++) {
	                currentHTML += '<tr value="' + obj.results[i].id +'">';
	                currentHTML += '<td></td>';
	                currentHTML += '<td>' + obj.results[i].nombre +'</td>';
	                currentHTML += '<td>' + convertGenero(obj.results[i].genero) +'</td>';
	                currentHTML += '<td>' + obj.results[i].edad +'</td>';
	                currentHTML += '<td>' + obj.results[i].municipio +'</td>';
	                currentHTML += '<td>' + obj.results[i].estado +'</td>';
	                currentHTML += '<td class=modifyButton><input id= modify type=  submit  value= Modificar ></td>'
	                currentHTML += '<td class=deleteButton><input id= delete type=  submit  value= Eliminar ></td>';
	                currentHTML += '</tr>';

	                $('#allPanelists').append(currentHTML);
	                currentHTML = '';
	            }
            },
            error: function (error) {
                $('#feedback').html('Error cargando los clientes.');
            }
        });
    }, 500);

	$('#sendInfoPanelistas').on('click', function (event) {
        var idPanelista = window.location.search.substring(1)
        idPanelista = idPanelista.substring(3);

        var parameters = {
            'action': 'ALTA_PANELISTA',
            'nombre': $('#fName').val(),
            'apellidos': $('#lName').val(),
            'email': $('#email').val(),
            'username': $('#username').val(),
            'password': $('#password').val(),
            'genero': $('input[name=gender]:checked').val(),
            'fechaNacimiento': $('#fechaNacimiento').val(),
            'educacion': $('input[name=nivel_educativo]:checked').val(),
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

    $('#allPanelists').on('click','.deleteButton', function(){
        var parameters = {
            'action': 'DELETE_PANELISTA',
            'id': $(this).parent().attr('value')
        }
        console.log(parameters);
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

    $('#allPanelists').on('click','.modifyButton', function(){
        var idPanelista = $(this).parent().attr('value');

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $('ul.tabs li').first().addClass('current');
        $("#tab-agregarPanelista").addClass('current');

        $('#headerTitle').text('Modificar Panelista');


        var parameters = {
            'action': 'GET_PANELISTAS',
            'id': idPanelista
        }
        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: parameters,
            dataType: 'json',
            success: function(obj){
                for(var i = 0; i < obj.results.length; i++) {
                    if(obj.results[i].id == idPanelista){
                        var nombre = obj.results[i].nombre.split(' ');

                        $('#fName').val(nombre[0]);
                        $('#lName').val(nombre[1] + ' ' + nombre[2]);
                        $('#email').val(obj.results[i].email);
                        $('#username').val(obj.results[i].username);
                        $('input[name="gender"][value="' + obj.results[i].genero + '"]').prop('checked', true);
                        $('input[name="nivel_educativo"][value="' + obj.results[i].educacion + '"]').prop('checked', true);
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
});