'use strict';

var stateObject = { 'AGS':'Aguascalientes',
                    'BC':'Baja California',
                    'BCS':'Baja California Sur',
                    'CAMP':'Campeche', 'COAH':'Coahuila',
                    'COL':'Colima',
                    'CHIS':'Chiapas',
                    'CDMX':'Ciudad de México',
                    'DGO':'Durango',
                    'GTO':'Guanajuato',
                    'HGO':'Hidalgo',
                    'JAL':'Jalisco',
                    'EDOMEX':'Estado de México',
                    'MICH':'Michoacán',
                    'MOR':'Morelos',
                    'NAY':'Nayarit',
                    'NL':'Nuevo León',
                    'OAX':'Oaxaca',
                    'PUE':'Puebla',
                    'QRO':'Querétaro',
                    'QROO':'Quintana Roo',
                    'SLP':'San Luis Potosí',
                    'SIN':'Sinaloa',
                    'TAB':'Tabasco',
                    'TAM':'Tamaulipas',
                    'TLAX':'Tlaxcala',
                    'VER':'Veracruz',
                    'YUC':'Yucatan',
                    'ZAC':'Zacatecas'
                }

google.charts.load('current', {'packages':['corechart', 'bar']});

// CHARTS
function pieChart(opciones, votes, chartNumber, title) {
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {

        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Data');
        data.addColumn('number', 'Votos');

        for (var x = 0; x < opciones.length; x++) {
            data.addRows([[opciones[x], votes[x]]]);
        }

        var options = { 'width' : 600,
                        'height' : 400,
                        'sliceVisibilityThreshold' : 0
                    };

        if (title != "") {
            options.title = title.charAt(0).toUpperCase() + title.slice(1);
        }

        var chart = new google.visualization.PieChart(document.getElementById('chart' + chartNumber));
        chart.draw(data, options);
    }
}

function barChart(opciones, votes, chartNumber, title) {
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Data');
        data.addColumn('number', 'Votos');

        for (var x = 0; x < opciones.length; x++) {
            data.addRows([[opciones[x], votes[x]]]);
        }

        var options = {
          width: 900,
          height: 500,
          bar: { groupWidth : "61.48%",
                 width : "40%"
                },
          hAxis: { format: 'percent'}
        };

        if (title != "") {
            options.title = title.charAt(0).toUpperCase() + title.slice(1);
        }

        var chart = new google.visualization.BarChart(document.getElementById('chart' + chartNumber));
        chart.draw(data, options);
    }
}

function columnChart(opciones, votes, percent, chartNumber, title){
    google.charts.setOnLoadCallback(drawStuff);

    function drawStuff() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Data');
        data.addColumn('number', 'Votos');

        for (var x = 0; x < opciones.length; x++) {
            opciones[x] +=  " (" + String(percent[x] * 100) + "%)";
            data.addRows([[opciones[x], votes[x]]]);
        }

        var options = {
          width: 900,
          height: 400,
          bar: { groupWidth : "11.48%",
                 width : "40%"
                },
          vAxis: {format : '#%'}
        };

        if (title != "") {
            options.title = title.charAt(0).toUpperCase() + title.slice(1);
        }

        var chart = new google.charts.Bar(document.getElementById('chart' + chartNumber));
        // Convert the Classic options to Material options.
        chart.draw(data, options);
      };
}

///////////////////////////////////////////
//              HELPER FUNCTIONS         //
///////////////////////////////////////////

function getNumberofArrays(response) {
    var obj;
    var arrayCounter = 0;

    for (obj in response) {
        arrayCounter += typeof response[obj] == 'object' ? 1 : 0;
    }

    return arrayCounter
}

function convertGenderArray(genero) {
    for (var x = 0; x < genero.length; x++) {
        genero[x] = genero[x] == 'H' ? 'Hombres' : 'Mujeres';
    }

    return genero;
}

function convertAgeRange(edad) {
    for (var x = 0; x < edad.length; x++) {
        switch (edad[x]) {
            case '25' :
                edad[x] = '18 - 25';
            break;
            case '35' :
                edad[x] = '26 - 35';
            break;
            case '45' :
                edad[x] = '36 - 45';
            break;
            case '55' :
                edad[x] = '46 - 55';
            break;
            case '100' :
                edad[x] = '56+';
            break;
            default:

            break;
        }
    }
    return edad;
}

function convertState(estado) {
    for (var x = 0; x < estado.length; x++) {
        estado[x] = stateObject[estado[x]];
    }

    return estado;
}

function getObjectProperties(object) {
    var properties = [];

    for(var key in object) {
        properties.push(object[key]);
    }

    return properties;
}


$(document).on('ready', function () {
    $('#reportes-header-option').addClass('selected');

    setTimeout(function (event) {
        getEncuestas('reportes');
    }, 500);

    $('#preguntas-select').hide();
    $('#edad-select').hide();
    $('#genero-select').hide();
    $('#estado-select').hide();
    $('#educacion-select').hide();
    $('#filtros-button').hide();

    $('#reportes-encuestas-select').on('change', function () {
        var idEncuesta = parseInt($(this).val(), 10);
        $('#preguntas-select').empty();

        if (idEncuesta < 1) {
            $('#preguntas-select').hide();
            $('#edad-select').hide();
            $('#genero-select').hide();
            $('#estado-select').hide();
            $('#educacion-select').hide();
            $('#filtros-button').hide();

            return;
        }

        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                action : 'GET_PREGUNTAS',
                encuesta : idEncuesta
            },
            dataType: 'json',
            success: function (response) {
                $('#preguntas-select').show();

                var currentHTML = '<option value="-1">Selecciona una pregunta</option>';

                for (var i = 0; i < response.results.length; i++) {
                    var result = response.results[i];
                    currentHTML += '<option value="' + result.numPregunta + '">' + result.pregunta + '</option>';
                }

                currentHTML += '<option value="0">General</option>';
                $('#preguntas-select').append(currentHTML);
            },
            error: function (errorMsg) {
                return;
            }
        });
    });

    $('#preguntas-select').on('change', function () {
        var numPregunta = parseInt($(this).val(), 10);
        $('#edad-select').hide();
        $('#genero-select').hide();
        $('#estado-select').hide();
        $('#educacion-select').hide();
        $('#filtros-button').hide();

        if (numPregunta < 0) {
            return;
        }

        var data = {
            action : 'REPORT_DATA',
            encuesta : parseInt($('#reportes-encuestas-select').val(), 10),
            numPregunta: numPregunta
        };

        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: data,
            dataType: 'json',
            success: function (response) {
                // Show filter options with default values
                $('#edad-select').show();
                $('#edad-select').val('0');

                $('#genero-select').show();
                $('#genero-select').val('-1');

                $('#estado-select').show();
                $('#estado-select').val('0');

                $('#educacion-select').show();
                $('#educacion-select').val('0');

                $('#filtros-button').show();

                if (response.status === "NO_DATA") {
                    document.getElementById('chart1').innerHTML = "";
                    return;
                }

                if (numPregunta === 0) {
                    //General
                    $('#edad-select').hide();
                    $('#genero-select').hide();
                    $('#estado-select').hide();
                    $('#educacion-select').hide();
                    $('#filtros-button').hide();

                    pieChart(convertGenderArray(Object.keys(response.genero)),
                            getObjectProperties(response.genero),
                            1, Object.keys(response)[2]);
                    pieChart(convertAgeRange(Object.keys(response.edad)),
                            getObjectProperties(response.edad),
                            2, Object.keys(response)[0]);
                    columnChart(convertState(Object.keys(response.estado)),
                            getObjectProperties(response.estado),
                            3, Object.keys(response)[1]);
                } else {
                    $('#chart1').html("");
                    $('#chart2').html("");
                    $('#chart3').html("");

                    if (response.tipo === 1) {
                        // Tabla
                    } else if (response.tipo === 4) {
                        barChart(getObjectProperties(response.opciones), response.votos, 1, "");
                    } else if (response.opciones.length < 4) {
                        pieChart(getObjectProperties(response.opciones), response.votos, 1, "");
                    } else {
                        columnChart(getObjectProperties(response.opciones), response.votos, response.porcentajes, 1, "");
                    }
                }

                return;
            },
            error: function (errorMsg) {
                return;
            }
        });
    });

    $('#filtros-button').on('click', function () {
        var data = {
            action: 'REPORT_DATA',
            encuesta: parseInt($('#reportes-encuestas-select').val(), 10),
            numPregunta: parseInt($('#preguntas-select').val(), 10)
        };

        if (parseInt($('#edad-select').val(), 10) > 0) {
            data.edad = parseInt($('#edad-select').val(), 10);
        }

        if ($('#estado-select').val() !== '0') {
            data.estado = $('#estado-select').val();
        }

        if (parseInt($('#genero-select').val(), 10) > -1) {
            data.genero = parseInt($('#genero-select').val(), 10);
        }

        if (parseInt($('#educacion-select').val(), 10) > 0) {
            data.educacion = parseInt($('#educacion-select').val(), 10);
        }

        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: data,
            dataType: 'json',
            success: function (response) {
                document.getElementById('chart3').innerHTML = "";

                if (response.tipo === 1) {
                    // Tabla
                } else if (response.tipo === 4) {
                    barChart(getObjectProperties(response.opciones), response.votos, 3, "");
                } else if (response.opciones.length < 4) {
                    pieChart(getObjectProperties(response.opciones), response.votos, 3, "");
                } else {
                    columnChart(getObjectProperties(response.opciones), response.votos, response.porcentajes, 3, "");
                }

                return;
            },
            error: function (errorMsg) {
                return;
            }
        });
    });
});
