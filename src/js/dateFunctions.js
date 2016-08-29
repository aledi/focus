function getDatefromString(stringDate, option){
    var arrayDate;
    if(option == 0){
        arrayDate = stringDate.split('-');
        $('#anio').val(parseInt(arrayDate[0]));
        console.log(arrayDate[0]);
        $('#mes').val(parseInt(arrayDate[1]));
        $('#dia').val(parseInt(arrayDate[2]));
    }
    else{
         arrayDate = stringDate.split('-');
        $('#anio_fin').val(arrayDate[0]);
        $('#mes_fin').val(parseInt(arrayDate[1]));
        $('#dia_fin').val(parseInt(arrayDate[2]));
    }

    return;
}

function getCompleteDate(option){
    var dia = '';
    var mes = '';
    var anio = '';
    var fecha = '';

    if(option == 1){
        dia = $('select#dia_fin').val();
        mes = $('select#mes_fin').val();
        anio = $('select#anio_fin').val();

        fecha = anio + '-' + mes + '-' + dia;
    }
    else{
        dia = $('select#dia_fin').val();
        mes = $('select#mes_fin').val();
        anio = $('select#anio_fin').val();

        fecha = anio + '-' + mes + '-' + dia;
    }
    console.log(fecha);
    return fecha;
}

function fillDay(days, option){
    var currentHTML = '';
    for(var x = 1; x < days + 1; x++){
        currentHTML += '<option value="' + x + '">' + x + '</option>';
    }

    if(option == 0){
        $('#dia').append(currentHTML);
        $('#dia_fin').append(currentHTML);
    }
    else if(option == 1){    
        $('#dia').empty();
        $('#dia').append(currentHTML);
    }
    else{      
        $('#dia_fin').empty();
        $('#dia_fin').append(currentHTML);
    }
}

function fillMonth(){
    var currentHTML = '';
    for(var x = 1; x < 13; x++){
        currentHTML += '<option value="' + x + '">' + convertMonth(x) + '</option>';
    }
    $('#mes').append(currentHTML);
    $('#mes_fin').append(currentHTML);
}

function fillYear(option){
    var currentTime = new Date();
    var currentYear = currentTime.getFullYear();
    var currentHTML = '';
    
    if(option == 0){
        for(var x = currentYear; x < currentYear + 10; x++){
            currentHTML += '<option value="' + x + '">' + x + '</option>';
        }
        $('#anio').append(currentHTML);
        $('#anio_fin').append(currentHTML);
    }
    else {
        currentYear = currentYear - 18;
        for(var x = currentYear; x > currentYear - 100 ; x--){
            currentHTML += '<option value="' + x + '">' + x + '</option>';
        }
        $('#anio').append(currentHTML);
    }
}

function fillSelects(option, option_form){
    switch (option) {
        case 1 : 
                fillDay(31, 0);
            break;
        case 2 :
                fillMonth();
            break;
        case 3 : 
                fillYear(option_form);
            break;
        default :
            break;
    }
}
