'use strict';

var monthArray = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];

function convertMonth (mes) {
    return monthArray[mes - 1];
}

function getMonthDays (mes, anio) {
    if (mes === 1 || mes === 3 || mes === 5 || mes === 7 || mes === 8 || mes === 10 || mes === 12) {
        return 31;
    } else if (mes === 2) {
        return (((anio % 4 === 0) && (anio % 100 !== 0)) || (anio % 400 === 0)) ? 29 : 28;
    }

    return 30;
}

function getDatefromString (stringDate, option) {
    var arrayDate = stringDate.split('-');
    if (option === 0) {
        $('#anio').val(parseInt(arrayDate[0]));
        $('#mes').val(parseInt(arrayDate[1]));
        $('#dia').val(parseInt(arrayDate[2]));
    }
    else {
        $('#anio_fin').val(arrayDate[0]);
        $('#mes_fin').val(parseInt(arrayDate[1]));
        $('#dia_fin').val(parseInt(arrayDate[2]));
    }

    return;
}

function getCompleteDate (option) {
    var dia = option === 1 ? $('select#dia').val() : $('select#dia_fin').val();
    var mes = option === 1 ? $('select#mes').val() : $('select#mes_fin').val();
    var anio = option === 1 ? $('select#anio').val() : $('select#anio_fin').val();

    var fecha = anio + '-' + mes + '-' + dia;
    return fecha;
}

function fillDay (days, option) {
    var currentHTML = '';
    for (var x = 1; x <= days; x++) {
        currentHTML += '<option value="' + x + '">' + x + '</option>';
    }

    if (option === 0) {
        $('#dia').append(currentHTML);
        $('#dia_fin').append(currentHTML);
    } else if (option === 1) {
        $('#dia').empty();
        $('#dia').append(currentHTML);
    } else {
        var currentValue = $('#dia_fin').val();
        $('#dia_fin').empty();
        $('#dia_fin').append(currentHTML);
        $('#dia_fin').val(currentValue);
    }
}

function fillMonth () {
    var currentHTML = '';
    for (var x = 1; x <= 12; x++) {
        currentHTML += '<option value="' + x + '">' + convertMonth(x) + '</option>';
    }

    $('#mes').append(currentHTML);
    $('#mes_fin').append(currentHTML);
}

function fillYear (option) {
    var currentYear = new Date().getFullYear();
    var currentHTML = '';

    if (option === 0) {
        for (var x = currentYear; x < currentYear + 10; x++) {
            currentHTML += '<option value="' + x + '">' + x + '</option>';
        }

        $('#anio').append(currentHTML);
        $('#anio_fin').append(currentHTML);
    } else {
        for (var x = currentYear - 18; x > currentYear - 100 ; x--) {
            currentHTML += '<option value="' + x + '">' + x + '</option>';
        }

        $('#anio').append(currentHTML);
    }
}

function fillSelects (option, option_form) {
    switch (option) {
        case 1:
            fillDay(31, 0);
            break;
        case 2:
            fillMonth();
            break;
        case 3:
            fillYear(option_form);
            break;
        default:
            break;
    }
}

function changeSelect (option) {
    if (option === 'Inicio') {
        var mes = parseInt($('select#mes').val());
        var anio = parseInt($('select#anio').val());
        var dias = getMonthDays(mes, anio);

        fillDay(dias, 1);
    } else if (option === 'Fin') {
        var mes = parseInt($('select#mes_fin').val());
        var anio = parseInt($('select#anio_fin').val());
        var dias = getMonthDays(mes, anio);

        fillDay(dias, 2);
    }
}

function validDateRange (startDate, endDate) {
    return endDate > startDate;
}
