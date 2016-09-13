'use strict';

$(document).on('ready', function () {
    $('#panelistas-header-option').addClass('selected');

    // -----------------------------------------------------------------------------------------------
    // Fetch Panelistas
    // -----------------------------------------------------------------------------------------------

    setTimeout(function (event) {
        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: {'action': 'GET_PANELISTAS'},
            dataType: 'json',
            success: function (response) {
                fillSelects(1, 1);
                fillSelects(2, 1);
                fillSelects(3, 1);

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

                for (var i = 0; i < response.results.length; i++) {
                    var result = response.results[i];

                    currentHTML += '<tr id="' + result.id + '">';
                    currentHTML += '<td>' + result.nombre + " " + result.apellidos + '</td>';
                    currentHTML += '<td>' + convertGenero(result.genero) + '</td>';
                    currentHTML += '<td>' + result.edad + '</td>';
                    currentHTML += '<td>' + result.municipio + '</td>';
                    currentHTML += '<td>' + result.estado + '</td>';
                    currentHTML += '<td class=modifyButton><button id=modify type=button>Modificar</button></td>';
                    currentHTML += '<td class=deleteButton><button id=delete type=button>Eliminar</button></td>';
                    currentHTML += '</tr>';


                    $('#allPanelistas').append(currentHTML);
                    currentHTML = '';
                }

                currentHTML += '</tbody>';
                $('#cancelModify').hide();
            },
            error: function (error) {
                $('#feedback').html('Error cargando los clientes');
            }
        });
    }, 500);

    // -----------------------------------------------------------------------------------------------
    // Save Panelista
    // -----------------------------------------------------------------------------------------------

    $('#savePanelista').on('click', function (event) {
        var idPanelista = window.location.search.substring(1);
        idPanelista = idPanelista.substring(3);

        var modifying = idPanelista != '';

        var firstName = $('#firstName').val();
        var lastName = $('#lastName').val();
        var email = $('#email').val();
        var username = $('#username').val();
        var fechaNacimiento = getCompleteDate(1);
        var educacion = $('#educacion').val();
        var calleNumero = $('#calleNumero').val();
        var colonia = $('#colonia').val();
        var municipio = $('#municipio').val();
        var estado = $('#estado').val();
        var cp = $('#cp').val();

        if (firstName === '' || lastName === '' || email === '' || username === '' || (!modifying && password === '') ||
            fechaNacimiento === '' || educacion === '0' || calleNumero === '' || colonia === '' || municipio === '' ||
            estado === '0' || cp === '') {
                $('#feedback').html('Favor de llenar todos los campos');
                return;
        }

        var data = {
            'action': 'ALTA_PANELISTA',
            'nombre': firstName,
            'apellidos': lastName,
            'email': email,
            'username': username,
            'genero': $('input[name=gender]:checked').val(),
            'fechaNacimiento': fechaNacimiento,
            'educacion': educacion,
            'calleNumero': calleNumero,
            'colonia': colonia,
            'municipio': municipio,
            'estado': estado,
            'cp': cp
        };

        if (modifying) {
            data.id = idPanelista;
        }

        // Clear feedback <span>
        $('#feedback').empty();

        var actionText = modifying ? 'modificado' : 'agregado';
        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: data,
            dataType: 'json',
            success: function (response) {
                alert('Panelista '+ actionText + ' exitosamente.');
            },
            error: function (error) {
                $('#feedback').html('Panelista no ' + actionText + '. Ha ocurrido un error.');
            }
        });
    });

    // -----------------------------------------------------------------------------------------------
    // Modify Panelista
    // -----------------------------------------------------------------------------------------------

    $('#allPanelistas').on('click', '.modifyButton', function () {
        var idPanelista = $(this).parent().attr('id');

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $('ul.tabs li').first().addClass('current');
        $('#tab-agregarPanelista').addClass('current');

        $('#headerTitle').text('Modificar Panelista');
        $('#savePanelista').text('Modificar');

        $('#panelista-password').hide();
        $('#cancelModify').show();

        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                'action': 'GET_PANELISTAS',
                'id': idPanelista
            },
            dataType: 'json',
            success: function (response) {
                var result = response.result;
                $('#firstName').val(result.nombre);
                $('#lastName').val(result.apellidos);
                $('#email').val(result.email);
                $('#username').val(result.username);
                $('input[name="gender"][value="' + result.genero + '"]').prop('checked', true);
                getDatefromString(result.fechaNacimiento, 0);
                $('#educacion').val(result.educacion + '');
                $('#calleNumero').val(result.calleNumero);
                $('#colonia').val(result.colonia);
                $('#municipio').val(result.municipio);
                $('#estado').val(result.estado);
                $('#cp').val(result.cp);

                var myURL = window.location.href.split('?')[0];
                myURL += '?id=' + result.id;
                history.pushState({}, null, myURL);
            },
            error: function (errorMsg) {
                alert('Error modificando panelista.');
            }
        });
    });

    // -----------------------------------------------------------------------------------------------
    // Delete Panelista
    // -----------------------------------------------------------------------------------------------

    $('#allPanelistas').on('click', '.deleteButton', function () {
        var self = this;
        var data = {
            action: 'DELETE_PANELISTA',
            id: $(this).parent().attr('id')
        }

        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: data,
            dataType: 'json',
            success: function (response) {
                alert('Panelista eliminado exitosamente.');
                $(self).parent().remove();
            },
            error: function (errorMsg) {
                alert('Error eliminando panelista.');
            }
        });
    });

    $('#cancelModify').on('click', function (event) {
        $('#tab-agregarPanelista').find('input').val('');
        $('#tab-agregarPanelista').find('select').val('0');
        $('#tab-agregarPanelista').find('input').removeAttr('checked');
        $('#headerTitle').text('Agregar Panelista');
        $('#savePanel').text('Agregar');
        $('#cancelModify').hide();

        var myURL = window.location.href.split('?')[0];
        history.pushState({}, null, myURL);

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $('ul.tabs li').last().addClass('current');
        $('#tab-modificarPanelista').addClass('current');
    });

    $('#mes, #anio').on('change', function() {
        changeSelect('Inicio');
    });

    // Listen to keypress & restrict input to numeric value
    $('#cp').keypress(function (event) {
        if (!event.metaKey && event.charCode !== 13 && (event.charCode < 48 || event.charCode > 57)) {
            event.preventDefault();
        }
    });
});
