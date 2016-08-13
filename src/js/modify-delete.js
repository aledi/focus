$(document).on('ready', function () {
    $('#allUsers').on('click','.deleteButton', function () {
        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                'action': 'DELETE_CLIENTE',
                'id': $(this).parent().attr('value')
            },
            dataType: 'json',
            success: function (obj) {
                alert('Cliente Eliminado!');
                $(this).parent().find('td.id').remove();
            },
            error: function (errorMsg) {
                alert('Error eliminando cliente');
            }
        });
    });

    $('#allUsers').on('click','.modifyButton', function () {
        $('#headerTitle').text('Modificar Usuario');

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $('ul.tabs li').first().addClass('current');
        $("#tab-agregarUsuario").addClass('current');

        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: parameters = {
                'action': 'GET_CLIENTES',
                'id': $(this).parent().attr('value')
            },
            dataType: 'json',
            success: function (obj) {
                for (var i = 0; i < obj.results.length; i++) {
                    if (obj.results[i].id == idUser) {
                        var nombre = obj.results[i].nombre.split(' ');

                        $('#email').val(obj.results[i].email);
                        $('#fName').val(nombre[0]);
                        $('#lName').val(nombre[1]);
                        $('#lName_materno').val(nombre[2]);
                        $('#username').val(obj.results[i].username);

                        var myURL = window.location.href.split('?')[0];
                        myURL = myURL + '?id=' + obj.results[i].id;
                        history.pushState({}, null, myURL);
                    }
                }
            },
            error: function (errorMsg) {
                alert('Error modificando administrador');
            }
        });
    });

    $('#allAdmin').on('click','.deleteButton', function(){
        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                'action': 'DELETE_ADMIN',
                'id': $(this).parent().attr('value')
            },
            dataType: 'json',
            success: function(obj){
                alert('¡Administrador Eliminado!');
                $(this).parent().find('td.id').remove();
            },
            error: function (errorMsg) {
                alert('Error eliminando administrador');
            }
        });
    });

    $('#allAdmin').on('click','.modifyButton', function(){
        var idAdministador = $(this).parent().attr('value')

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $('ul.tabs li').first().addClass('current');
        $("#tab-agregarAdministrador").addClass('current');

        $('#headerTitle').text('Modificar Administrador');

        var parameters = {
            'action': 'GET_ADMINS',
            'id': idAdministador
        }
        console.log(parameters);
        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: parameters,
            dataType: 'json',
            success: function(obj){
                for(var i = 0; i < obj.results.length; i++) {
                    if(obj.results[i].id == idAdministador){
                        var nombre = obj.results[i].nombre.split(' ');

                        $('#email').val(obj.results[i].email);
                        $('#fName').val(nombre[0]);
                        $('#lName').val(nombre[1]);
                        $('#lName_materno').val(nombre[2]);
                        $('#username').val(obj.results[i].username);

                        var myURL = window.location.href.split('?')[0];
                        myURL = myURL + '?id=' + obj.results[i].id;
                        history.pushState({}, null, myURL);
                    }
                }
            },
            error: function (errorMsg) {
                alert('Error modificando administrador');
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

    $('#allPanels').on('click','.deleteButton', function(){
        var parameters = {
            'action': 'DELETE_PANEL',
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

    $('#allPanels').on('click','.modifyButton', function(){
        var idPanel = $(this).parent().attr('value');

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $('ul.tabs li').first().addClass('current');
        $("#tab-agregarPanel").addClass('current');

        $('#headerTitle').text('Modificar Panel');


        var parameters = {
            'action': 'GET_PANELES',
            'id': idPanel
        }
        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: parameters,
            dataType: 'json',
            success: function(obj){
                console.log(obj);
                for(var i = 0; i < obj.results.length; i++) {
                    if(obj.results[i].id == idPanel){
                        $('#panelName').val(obj.results[i].nombre);
                        $('#dateStarts').val(obj.results[i].fechaInicio);
                        $('#dateEnds').val(obj.results[i].fechaFin);
                        $('input[name="id"][value="' + obj.results[i].id + '"]').prop('checked', true);

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

    $('#allSurveys').on('click','.deleteButton', function(){
        var parameters = {
            'action': 'DELETE_ENCUESTA',
            'id': $(this).parent().attr('value')
        }
        console.log(parameters);
        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: parameters,
            dataType: 'json',
            success: function (obj) {
                alert('Encuesta Eliminada!');
                $(this).parent().find('td.id').remove();
            },
            error: function (errorMsg) {
                alert('Error eliminando cliente');
            }
        });
    });

    $('#allSurveys').on('click','.modifyButton', function(){
        var idSurvey = $(this).parent().attr('value');

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $('ul.tabs li').first().addClass('current');
        $("#tab-agregarEncuesta").addClass('current');

        $('#headerTitle').text('Modificar Encuesta');

        var parameters = {
            'action': 'GET_ENCUESTAS',
            'id': idSurvey
        }
        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: parameters,
            dataType: 'json',
            success: function(obj) {
                console.log(obj);
                for(var i = 0; i < obj.results.length; i++) {
                    if(obj.results[i].id == idSurvey){
                        $('#nombre').val(obj.results[i].nombre);
                        $('#dateStarts').val(obj.results[i].fechaInicio);
                        $('#dateEnds').val(obj.results[i].fechaFin);
                        $('input[name=id][value="' + obj.results[i].id + '"]').prop('checked', true);

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
