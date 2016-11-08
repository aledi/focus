'use strict';
var arrEstadosMunicipios = {};

$(document).on('ready', function () {
    $('#panelistas-header-option').addClass('selected');
    $('#cancel-edit').hide();

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
                currentHTML += '<th>Fecha Registro</th>';
                currentHTML += '<th colspan="2">Acción</th>';
                currentHTML += '</tr>';
                currentHTML += '</thead>';
                currentHTML += '<tbody id="fbody">';

                for (var i = 0; i < response.results.length; i++) {
                    var result = response.results[i];
                    var elegible = (result.genero !== -1 && result.edad !== 0 && result.estado !== '');

                    currentHTML += '<tr id="' + result.id + '" class="' +  (elegible ? '' : 'red') + '">';
                    currentHTML += '<td>' + result.nombre + " " + result.apellidos + '</td>';
                    currentHTML += '<td>' + convertGenero(result.genero) + '</td>';
                    currentHTML += '<td>' + result.edad + '</td>';
                    currentHTML += '<td>' + result.municipio + '</td>';
                    currentHTML += '<td>' + result.estado + '</td>';
                    currentHTML += '<td>' + readableDate(result.fechaRegistro) + '</td>';
                    currentHTML += '<td class=edit-button><button id=edit type=button>Editar</button></td>';
                    currentHTML += '<td class=deleteButton><button id=delete type=button>Eliminar</button></td>';
                    currentHTML += '</tr>';

                    $('#allPanelistas').append(currentHTML);
                    currentHTML = '';
                }

                currentHTML += '</tbody>';
            },
            error: function (error) {
                $('#feedback').html('Error cargando los clientes');
            }
        });

        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: {'action': 'GET_MUNICIPIOS'},
            dataType: 'json',
            success: function (response) {
                arrEstadosMunicipios = response.estados;
                var currentHTML = '<option value=\'0\'>Selecciona un estado</option>';
                var estado;
                for(estado in arrEstadosMunicipios){
                    currentHTML += '<option value=' + stateAbreviations(estado) + '>' + estado + '</option>';
                }

                $('#estado').append(currentHTML);
            },
            error: function (error) {
                $('#feedback').html('Error cargando los municipios');
            }
        });

    }, 500);

    // -----------------------------------------------------------------------------------------------
    // Save Panelista
    // -----------------------------------------------------------------------------------------------

    $('#savePanelista').on('click', function (event) {
        var idPanelista = window.location.search.substring(1);
        idPanelista = idPanelista.substring(3);

        var editing = idPanelista != '';

        var firstName = $('#firstName').val();
        var lastName = $('#lastName').val();
        var email = $('#email').val();
        var username = $('#username').val();
        var password = $('#password').val();
        var fechaNacimiento = getCompleteDate(1);
        var educacion = $('#educacion').val();
        var calleNumero = $('#calleNumero').val();
        var colonia = $('#colonia').val();
        var municipio = $('#municipio').val();
        var estado = $('#estado').val();
        var cp = $('#cp').val();

        if (firstName === '' || lastName === '' || email === '' || username === '' || (!editing && password === '') ||
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

        if (editing) {
            data.id = idPanelista;
        } else {
            data.password = password;
        }

        $('#feedback').empty();

        var actionText = editing ? 'editado' : 'agregado';
        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: data,
            dataType: 'json',
            success: function (response) {
                if (response.status === 'SUCCESS') {
                    alert('Panelista '+ actionText + ' exitosamente.');
                    location.replace('panelistas.php');
                } else if (response.status === 'USER_EXISTS') {
                    $('#feedback').html('El panelista ya existe. Por favor, elija otro.');
                } else {
                    $('#feedback').html('Hubo un error al guardar el panelista. Por favor, intente más tarde.');
                }
            },
            error: function (error) {
                $('#feedback').html('Panelista no ' + actionText + '. Ha ocurrido un error.');
            }
        });
    });

    // -----------------------------------------------------------------------------------------------
    // Edit Panelista
    // -----------------------------------------------------------------------------------------------

    $('#allPanelistas').on('click', '.edit-button', function () {
        var idPanelista = $(this).parent().attr('id');

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $('ul.tabs li').first().addClass('current');
        $('#tab-agregar-panelista').addClass('current');

        $('#header-title').text('Editar Panelista');
        $('#savePanelista').text('Editar');

        $('#panelista-password').hide();
        $('#cancel-edit').show();

        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                action: 'GET_PANELISTAS',
                id: idPanelista
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
                $('#estado').val(result.estado);
                fillMunicipios();
                $('#municipio').val(result.municipio);
                $('#cp').val(result.cp);

                var myURL = window.location.href.split('?')[0];
                myURL += '?id=' + result.id;
                history.pushState({}, null, myURL);
                
            },
            error: function (errorMsg) {
                alert('Error editando panelista.');
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

        if(confirmDelete('este Panelista')) {
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
        }
    });

    $('#cancel-edit').on('click', function (event) {
        $('#tab-agregar-panelista').find('input').val('');
        $('#tab-agregar-panelista').find('select').val('0');
        $('#tab-agregar-panelista').find('input').removeAttr('checked');
        $('#header-title').text('Agregar Panelista');
        $('#savePanel').text('Agregar');
        $('#cancel-edit').hide();

        var myURL = window.location.href.split('?')[0];
        history.pushState({}, null, myURL);

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $('ul.tabs li').last().addClass('current');
        $('#tab-view-panelistas').addClass('current');
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

    ///////////////////////////////////////////////////////////////////////////////
    // Change municipios depending on state
    ///////////////////////////////////////////////////////////////////////////////

    $('#estado').on('change', function() {
        $('#municipio').empty();
        fillMunicipios();
    });
});


function fillMunicipios(){
    var currentState = $('#estado option:selected').text();
    var currentHTML = '<option value=\'0\'>Selecciona un municipio</option>';

    if (currentState != 'Selecciona un estado'){
        for(var county = 0; county < Object.keys(arrEstadosMunicipios[currentState]).length; county++){
            currentHTML += '<option value=' + county + '>' + arrEstadosMunicipios[currentState][county] + '</option>';
        }
    }

    $('#municipio').append(currentHTML);
}


function stateAbreviations(state){
    switch(state){
        case 'Aguascalientes':
            return 'AGS';
            break;
        case 'Baja California':
            return 'BC';
            break;
        case 'Baja California Sur':
            return 'BCS';
            break;
        case 'Campeche':
            return 'CAMP';
            break; 
        case 'Coahuila de Zaragoza':
            return 'COAH';
            break; 
        case 'Colima':
            return 'COL';
            break;
        case 'Chiapas':
            return 'CHIS';
            break;
        case 'Chihuahua':
            return 'CHI';//Start
            break;
        case 'Cuidad de México':
            return 'CDMX';
            break; 
        case 'Durango':
            return 'DGO';
            break; 
        case 'Guanajuato':
            return 'GTO';
            break; 
        case 'Guerrero':
            return 'GRO';
            break; 
        case 'Hidalgo':
            return 'HGO';
            break;
        case 'Jalisco':
            return 'JAL';
            break; 
        case 'México':
            return 'EDOMEX';
            break;
        case 'Michoacán de Ocampo':
            return 'MICH';
            break;
        case 'Morelos':
            return 'MOR';
            break;
        case 'Nayarit':
            return 'NAY';
            break;
        case 'Nuevo León':
            return 'NL';
            break;
        case 'Oaxaca':
            return 'OAX';
            break;
        case 'Puebla':
            return 'PUE';
            break;
        case 'Querétaro':
            return 'QRO';
            break;
        case 'Quintana Roo':
            return 'QROO';
            break;
        case 'San Luis Potosí':
            return 'SLP';
            break;
        case 'Sinaloa':
            return 'SIN';
            break;
        case 'Sonora':
            return 'SON';
            break;
        case 'Tabasco':
            return 'TAB';
            break;
        case 'Tamaulipas':
            return 'TAM';
            break;
        case 'Tlaxcala':
            return 'TLAX';
            break;
        case 'Veracruz de Ignacio de la Llave':
            return 'VER';
            break;
        case 'Yucatán':
            return 'YUC';
            break;
        case 'Zacatecas':
            return 'ZAC';
            break;
    }
}
