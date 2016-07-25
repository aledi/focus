$(document).on('ready', function () {
       
    $("#allUsers").on("click",".deleteButton", function(){
        var parameters = {
            "action": "DELETE_CLIENTE",
            "id": $(this).parent().find("td.id").text()
        }
        console.log(parameters);
        $.ajax({
            url: "../api/controller.php",
            type: "POST",
            data: parameters,
            dataType: "json",
            success: function(obj){
                alert("Cliente Eliminado!");
                console.log(obj.status);
                $(this).parent().find("td.id").remove();
            },
            error: function(errorMsg)
            {
                alert("Error eliminando cliente");
            }
        });
    });

    $("#allUsers").on("click",".modifyButton", function(){
        var idUser = $(this).parent().find("td.id").text();
        
        var parameters = {
            "action": "GET_CLIENTES",
            "id": idUser
        }
        console.log(parameters);
        $.ajax({
            url: "../api/controller.php",
            type: "POST",
            data: parameters,
            dataType: "json",
            success: function(obj){
                for(var i = 0; i < obj.results.length; i++) {
                    if(obj.results[i].id == idUser){
                        var nombre = obj.results[i].nombre.split(" ");
                        $('#email').val(obj.results[i].email);
                        $('#fName').val(nombre[0]);
                        $('#lName').val(nombre[1]);
                        $('#lName_materno').val(nombre[2]);
                        $('#username').val(obj.results[i].username);
                        
                        var myURL = document.location;
                        myURL = myURL + "?id=" + obj.results[i].id;
                        history.pushState({}, null, myURL);
                    }
                }
            },
            error: function(errorMsg)
            {
                alert("Error modificando administrador");
            }
        });
    });

    $("#allAdmin").on("click",".deleteButton", function(){
        var parameters = {
            "action": "DELETE_ADMIN",
            "id": $(this).parent().find("td.id").text()
        }
        console.log(parameters);
        $.ajax({
            url: "../api/controller.php",
            type: "POST",
            data: parameters,
            dataType: "json",
            success: function(obj){
                alert("¡Administrador Eliminado!");
                console.log(obj.status);
                $(this).parent().find("td.id").remove();
            },
            error: function(errorMsg)
            {
                alert("Error eliminando administrador");
            }
        });
    });

    $("#allAdmin").on("click",".modifyButton", function(){
        var idAdministador = $(this).parent().find("td.id").text();
        
        var parameters = {
            "action": "GET_ADMINS",
            "id": idAdministador
        }
        console.log(parameters);
        $.ajax({
            url: "../api/controller.php",
            type: "POST",
            data: parameters,
            dataType: "json",
            success: function(obj){
                console.log(obj.status);
                for(var i = 0; i < obj.results.length; i++) {
                    if(obj.results[i].id == idAdministador){
                        var nombre = obj.results[i].nombre.split(" ");
                        $('#email').val(obj.results[i].email);
                        $('#fName').val(nombre[0]);
                        $('#lName').val(nombre[1]);
                        $('#lName_materno').val(nombre[2]);
                        $('#username').val(obj.results[i].username);
                        
                        var myURL = document.location;
                        myURL = myURL + "?id=" + obj.results[i].id;
                        history.pushState({}, null, myURL);
                    }
                }
            },
            error: function(errorMsg)
            {
                alert("Error modificando administrador");
            }
        });
    });

    $("#allPanelists").on("click",".deleteButton", function(){
        var parameters = {
            "action": "DELETE_PANELISTA",
            "id": $(this).parent().find("td.id").text()
        }
        console.log(parameters);
        $.ajax({
            url: "../api/controller.php",
            type: "POST",
            data: parameters,
            dataType: "json",
            success: function(obj){
                alert("Panelista Eliminado!");
                console.log(obj.status);
                $(this).parent().find("td.id").remove();
            },
            error: function(errorMsg)
            {
                alert("Error eliminando Panelista");
            }
        });
    });

    $("#allPanelists").on("click",".modifyButton", function(){
        var idPanelista = $(this).parent().find("td.id").text();
        var parameters = {
            "action": "GET_PANELISTAS",
            "id": idPanelista
        }
        $.ajax({
            url: "../api/controller.php",
            type: "POST",
            data: parameters,
            dataType: "json",
            success: function(obj){ 
                for(var i = 0; i < obj.results.length; i++) {
                    if(obj.results[i].id == idPanelista){
                        console.log(obj);
                        var nombre = obj.results[i].nombre.split(" ");
                        $('#email').val(obj.results[i].email);
                        $('#fName').val(nombre[0]);
                        $('#lName').val(nombre[1]);
                        $('#lName_materno').val(nombre[2]);
                        $("input[name=gender][value=" + obj.results[i].genero + "]").prop('checked', true);
                        $("input[name=nivel_educativo][value=" + obj.results[i].educacion + "]").prop('checked', true);
                        $("input[name=rango_edad][value=" + obj.results[i].edad + "]").prop('checked', true);
                        $("input[name=estadoCivil][value=" + obj.results[i].edoCivil + "]").prop('checked', true);
                        $('#municipio').val(obj.results[i].municipio);
                        $('select[name^="estado"] option[value="' + obj.results[i].estado + '"]').attr("selected","selected");
                        $("input[name=cuartos][value=" + obj.results[i].cuartos + "]").prop('checked', true);
                        $("input[name=banos][value=" + obj.results[i].banios + "]").prop('checked', true);
                        $("input[name=regaderas][value=" + obj.results[i].regadera + "]").prop('checked', true);
                        $("input[name=focos][value=" + obj.results[i].focos + "]").prop('checked', true);
                        $("input[name=piso][value=" + obj.results[i].piso + "]").prop('checked', true);
                        $("input[name=auto][value=" + obj.results[i].autos + "]").prop('checked', true);
                        $("input[name=nivel_educativo_ingreso][value=" + obj.results[i].estudiosProv + "]").prop('checked', true);
                        $("input[name=estufa][value=" + obj.results[i].estufa + "]").prop('checked', true);
                        $('#telefono_cel').val(obj.results[i].movil);
                        var myURL = document.location;
                        myURL = myURL + "?id=" + obj.results[i].id;
                        history.pushState({}, null, myURL);
                    }
                }
            },
            error: function(errorMsg)
            {
                alert("Error modificando Panelista");
            }
        });
    });

    $("#allPanels").on("click",".deleteButton", function(){
        var parameters = {
            "action": "DELETE_PANEL",
            "id": $(this).parent().find("td.id").text()
        }
        console.log(parameters);
        $.ajax({
            url: "../api/controller.php",
            type: "POST",
            data: parameters,
            dataType: "json",
            success: function(obj){
                alert("Panelista Eliminado!");
                console.log(obj.status);
                $(this).parent().find("td.id").remove();
            },
            error: function(errorMsg)
            {
                alert("Error eliminando Panelista");
            }
        });
    });

    $("#allPanels").on("click",".modifyButton", function(){
        var idPanel = $(this).parent().find("td.id").text();
        var parameters = {
            "action": "GET_PANELES",
            "id": idPanel
        }
        $.ajax({
            url: "../api/controller.php",
            type: "POST",
            data: parameters,
            dataType: "json",
            success: function(obj){
                console.log(obj);
                for(var i = 0; i < obj.results.length; i++) {
                    if(obj.results[i].id == idPanel){
                        $('#panelName').val(obj.results[i].nombre);
                        $('#dateStarts').val(obj.results[i].fechaInicio);
                        $('#dateEnds').val(obj.results[i].fechaFin);
                        $("input[name=id][value=" + obj.results[i].cliente + "]").prop('checked', true);
                        var myURL = document.location;
                        myURL = myURL + "?id=" + obj.results[i].id;
                        history.pushState({}, null, myURL);
                    }
                }
            },
            error: function(errorMsg)
            {
                alert("Error modificando Panelista");
            }
        });
    });

    $("#allSurveys").on("click",".deleteButton", function(){
        var parameters = {
            "action": "DELETE_ENCUESTA",
            "id": $(this).parent().find("td.id").text()
        }
        console.log(parameters);
        $.ajax({
            url: "../api/controller.php",
            type: "POST",
            data: parameters,
            dataType: "json",
            success: function(obj){
                alert("Encuesta Eliminada!");
                $(this).parent().find("td.id").remove();
            },
            error: function(errorMsg)
            {
                alert("Error eliminando cliente");
            }
        });
    });

    $("#allSurveys").on("click",".modifyButton", function(){
        var idSurvey = $(this).parent().find("td.id").text();
        var parameters = {
            "action": "GET_ENCUESTAS",
            "id": idSurvey
        }
        $.ajax({
            url: "../api/controller.php",
            type: "POST",
            data: parameters,
            dataType: "json",
            success: function(obj){
                console.log(obj);
                for(var i = 0; i < obj.results.length; i++) {
                    if(obj.results[i].id == idSurvey){
                        $('#nombre').val(obj.results[i].nombre);
                        $('#dateStarts').val(obj.results[i].fechaInicio);
                        $('#dateEnds').val(obj.results[i].fechaFin);
                        $("input[name=id][value=" + obj.results[i].panel + "]").prop('checked', true);
                        var myURL = document.location;
                        myURL = myURL + "?id=" + obj.results[i].id;
                        history.pushState({}, null, myURL);
                    }
                }
            },
            error: function(errorMsg)
            {
                alert("Error modificando Panelista");
            }
        });
    });
});