function convertData(caso, data){
    switch(caso){
        case 'Genero' :
            return convertGender(data);
        break;

        case 'edoCivil' :
            return convertedoCivil(data);
        break;

        default :
            return 'ERROR';
        break;
    }
}

function convertedoCivil(data){
    switch(data){
        case 0 :
            return 'Casado';
        break;

        case 1 :
            return 'Viudo';
        break;

        case 2 :
            return 'Divorciado';
        break;

        case 3 :
            return 'Separado';
        break;

        case 4 :
            return 'Soltero';
        break;

        case 5 :
            return 'Unión Libre';
        break;

        default :
            return 'ERROR';
        break;
    }
}


function convertGender(data){
    switch(data){
        case 0 :
            return 'Masculino';
        break;
        case 1 :
            return 'Femenino';
        break;
    }
}

$(document).on('ready', function () {
	parameters = {
        'action' : 'VERIFY_SESSION'
    };

    $.ajax({
        type: 'POST',
        url: '../api/controller.php',
        data: parameters,
        dataType: 'json',
        success: function (obj) {
            if (obj.status == 'SUCCESS') {
                console.log(obj.username);
                document.getElementsByTagName("html")[0].style.visibility = "visible";
            }
            else {
                window.location.replace('signin.php');
            }

        },
        error: function (error) {
            alert("Please login to continue");
            window.location.replace('signin.php');
        }
    });

    $('.signOutButton').on('click', function (event) {
        event.preventDefault();

        var parameters = {
            'action': 'LOG_OUT'
        };

        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: parameters,
            dataType: 'json',
            success: function (obj) {
                if (obj.status === "SUCCESS") {
                    alert("¡Hasta pronto!");
                    location.replace("signin.php");
                }
            }
        });
    });

    $('ul.tabs li').click(function(){
        var tab_id = $(this).attr('data-tab');

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $(this).addClass('current');
        $("#"+tab_id).addClass('current');
    });

});
