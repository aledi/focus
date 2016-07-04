$(document).on('ready', function () {
    $('#sendInfoPanelistas').on('click', function (event) {
        event.preventDefault();

        var email = $('#email').val();
        var fName = $('#fName').val();
        var lName = $('#lName').val();
        var gender = $("input[name=gender]:checked").val();
        var education = $("input[name=nivel_educativo]:checked").val();
        var age = $("input[name=rango_edad]:checked").val();
        var marriageStatus = $("input[name=estadoCivil]:checked").val();
        var state = $("#estado").val();
        var county = $('#municipio').val();
        var rooms = $("input[name=cuartos]:checked").val();
        var bathrooms = $("input[name=banos]:checked").val();
        var showers = $("input[name=regaderas]:checked").val();
        var bulbs = $("input[name=focos]:checked").val();
        var floorType = $("input[name=piso]:checked").val();
        var cars = $("input[name=auto]:checked").val();
        var bossEducation = $("input[name=nivel_educativo_ingreso]:checked").val();
        var stove = $("input[name=estufa]:checked").val();
        var phoneNumber = $('#telefono_cel').val();

        var parameters = {
            'action': 'ALTA_PANELISTAS',
            'fName': fName,
            'lName': lName,
            'email' : email,
            'gender' : gender,
            'education' : education,
            'age' : age,
            'marriageStatus' : marriageStatus,
            'state' : state,
            'county' : county,
            'rooms' : rooms,
            'bathrooms' : bathrooms,
            'showers' : showers,
            'bulbs' : bulbs,
            'floorType' : floorType,
            'cars' : cars,
            'bossEducation' : bossEducation,
            'stove' : stove,
            'phoneNumber' : phoneNumber

        };

        $.ajax({
            type: 'POST',
            url: 'controllers/controller.php',
            data: parameters,
            dataType: 'json',
            success: function (obj) {
                //console.log(obj);
                alert("User added successfully.");
            },
            error: function (error) {
                 $('#feedback').html("Usuario no añadido, ha ocurrido un error.");
            }
        });
    });
});
