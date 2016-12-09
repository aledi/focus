'use strict';

var educationObject = {
    1: 'Primaria',
    2: 'Secundaria',
    3: 'Preparatoria o Técnica',
    4: 'Profesional',
    5: 'Posgrado',
    6: 'Ninguno'
}

var currentNumeroPregunta = 0;

//http://www.w3schools.com/colors/colors_shades.asp
var colorArray = ['#202382', '#707070', '#6265A7', '#A6A6A6',
                  '#A6A7CD', '#BCBCBC', '#BCBDD9', '#C7C7C7',
                  '#505160', '#68829E', '#AEBD38', '#598234',
                  '#2E5600', '#486B00', '#A2C523', '#7D4427',
                  '#021C1E', '#004445', '#2C7873', '#6FB98F'];

google.charts.load('current', {'packages': ['corechart', 'bar']});

// -----------------------------------------------------------------------------------------------
// Charts
// -----------------------------------------------------------------------------------------------

function pieChart (opciones, votes, chartNumber, title) {
    google.charts.setOnLoadCallback(drawChart);

    function drawChart () {
        var data = new google.visualization.DataTable();
        data.addColumn('string', '');
        data.addColumn('number', 'Votos');

        for (var x = 0; x < opciones.length; x++) {
            data.addRows([[opciones[x], votes[x]]]);
        }

        var options = {
            width: 700,
            height: 350,
            colors: colorArray,
            sliceVisibilityThreshold: 0,
            tooltip: { text: 'percentage' }
        };

        options.title = title;

        var chart = document.getElementById('chart' + chartNumber);
        chart.className += ' pie-chart';
        var googleChart = new google.visualization.PieChart(chart);
        googleChart.draw(data, options);
    }
}

function barChart (opciones, votes, chartNumber, title) {
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', '');
        data.addColumn('number', 'Posición Promedio');

        for (var x = 0; x < opciones.length; x++) {
            data.addRows([[opciones[x], votes[x]]]);
        }

        var options = {
            width: 800,
            height: 500,
            colors: colorArray,
            bar: {
                groupWidth: '61.48%',
                width: '20%'
            },
            hAxis: {
                format: '#',
                ticks: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
                viewWindow : {
                    min: 0,
                    max: 10
                }
            }
        };

        options.title = title;

        var chart = document.getElementById('chart' + chartNumber);
        chart.className += ' bar-chart';
        var googleChart = new google.visualization.BarChart(chart);
        googleChart.draw(data, options);
    }
}

function barChartStacked (opciones, votesPercentage, subPreguntas, chartNumber) {
    google.charts.setOnLoadCallback(drawChartStacked);

    function drawChartStacked() {
        var arrayOpciones = [];
        var arraySubPreguntas = [];

        opciones.unshift('SubPregunta');
        arrayOpciones.push(opciones);

        for (var subPregunta = 0; subPregunta < subPreguntas.length; subPregunta++) {
            arraySubPreguntas.push(subPreguntas[subPregunta]);

            for (var votes = 0; votes < opciones.length - 1; votes++) {
                arraySubPreguntas.push(votesPercentage[subPregunta][votes]);
            }

            arrayOpciones.push(arraySubPreguntas);
            arraySubPreguntas = [];
        }

        var data = new google.visualization.arrayToDataTable(arrayOpciones);

        var options = {
            isStacked: 'percent',
            width: 800,
            height: 500,
            colors: colorArray,
            hAxis: {
                minValue: 0,
                ticks: [0, .25, .50, .75, 1]
            }
        };

        var chart = document.getElementById('chart' + chartNumber);
        chart.className += ' bar-chart';
        var googleChart = new google.visualization.BarChart(chart);
        googleChart.draw(data, options);
    }
}

function columnChart (opciones, percent, chartNumber, title) {
    google.charts.setOnLoadCallback(drawStuff);

    function drawStuff () {
        var data = new google.visualization.DataTable();
        data.addColumn('string', '');
        data.addColumn('number', '');
        data.addColumn({type: 'string', role: 'tooltip'});

        for (var x = 0; x < opciones.length; x++) {
            opciones[x] += '\n(' + String((percent[x] * 100).toFixed(2)) + '%)';

            data.addRows([[opciones[x], percent[x], opciones[x]]]);
        }

        var options = {
            width: 800,
            height: 400,
            colors: colorArray,
            bar: {
                width: opciones.length > 1 ? '80%' : '40%'
            },
            vAxis: {
                format: 'percent',
                viewWindow : {
                    min: 0,
                    max: 1
                }
            },
            legend: {position: 'none'}
        };

        options.title = title;

        var chart = document.getElementById('chart' + chartNumber);
        chart.className += ' column-chart';
        var googleChart = new google.visualization.ColumnChart(chart);
        googleChart.draw(data, options);
    }
}

function averageChart(min, max, value, chartNumber) {
    google.charts.setOnLoadCallback(drawStuff);

    function drawStuff () {
        var data = new google.visualization.DataTable();
        data.addColumn('string', '');
        data.addColumn('number', '');
        data.addColumn({type: 'string', role: 'tooltip'});

        var label = 'Promedio' + '\n(' + String(value.toFixed(2)) + ')';
        data.addRows([[label, value, label]]);

        var options = {
            width: 800,
            height: 400,
            colors: colorArray,
            bar: {
                width: '40%'
            },
            vAxis: {
                viewWindow : {
                    min: min,
                    max: max
                }
            },
            legend: {position: 'none'}
        };

        var chart = document.getElementById('chart' + chartNumber);
        chart.className += ' column-chart';
        var googleChart = new google.visualization.ColumnChart(chart);
        googleChart.draw(data, options);
    }
}

// -----------------------------------------------------------------------------------------------
// Helper Functions
// -----------------------------------------------------------------------------------------------

function getNumberofArrays (response) {
    var obj;
    var arrayCounter = 0;

    for (obj in response) {
        arrayCounter += typeof response[obj] == 'object' ? 1 : 0;
    }

    return arrayCounter
}

function convertGenderArray (genero) {
    for (var x = 0; x < genero.length; x++) {
        genero[x] = genero[x] == 'H' ? 'Hombres' : 'Mujeres';
    }

    return genero;
}

function convertAgeRange (edad) {
    for (var x = 0; x < edad.length; x++) {
        switch (edad[x]) {
            case '25':
                edad[x] = '18 - 25';
                break;
            case '35':
                edad[x] = '26 - 35';
                break;
            case '45':
                edad[x] = '36 - 45';
                break;
            case '55':
                edad[x] = '46 - 55';
                break;
            case '100':
                edad[x] = '56+';
                break;
            default:
                break;
        }
    }

    return edad;
}

function convertState (estado) {
    for (var x = 0; x < estado.length; x++) {
        estado[x] = stateName[estado[x]];
    }

    return estado;
}

function convertEducation (education) {
    for (var x = 0; x < education.length; x++) {
        education[x] = educationObject[parseInt(education[x])];
    }

    return education;
}

function getObjectProperties (object) {
    var properties = [];

    for (var key in object) {
        properties.push(object[key]);
    }

    return properties;
}

function ajaxReportCall(data, numPregunta){
    $.ajax({
        url: '../api/controller.php',
        type: 'POST',
        data: data,
        dataType: 'json',
        success: function (response) {
            if (response.status === 'NO_DATA') {
                $('#reportes-feedback').html('No hay información para la encuesta y pregunta seleccionadas');
                return;
            }

            $('#abiertas-table').empty();
            $('#chart1').empty();
            $('#chart2').empty();
            $('#chart3').empty();
            $('#chart4').empty();

            if (response.tipo !== 1) {
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

                $('#abiertas-table').hide();
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
                        1, 'Género');
                pieChart(convertAgeRange(Object.keys(response.edad)),
                        getObjectProperties(response.edad),
                        2, 'Edad');
                pieChart(convertEducation(Object.keys(response.educacion)),
                        getObjectProperties(response.educacion),
                        3, 'Educación');
                columnChart(convertState(Object.keys(response.estado)),
                        getObjectProperties(response.estadoPercentage),
                        4, 'Estado');

            } else {
                if (response.tipo === 1) {
                    var html = '';
                    $('#abiertas-table').show();
                    for (var i = 0; i < response.votos.length; i++) {
                        var even = i % 2 === 0;
                        html += (even ? '<tr>' : '') + '<td>' + response.votos[i] + '</td>' + (even ? '' : '</tr>');
                    }

                    $('#abiertas-table').append(html);
                } else if (response.tipo === 4) {
                    barChart(response.opciones, response.porcentajes, 1, '');
                } else if (response.tipo === 6) {
                    averageChart(parseInt(response.opciones[0], 10), parseInt(response.opciones[1], 10), response.porcentajes[0], 1);
                } else if (response.tipo === 5) {
                    barChartStacked(response.opciones, response.votos, response.subPreguntas, 1);
                } else if (response.opciones.length < 4) {
                    pieChart(response.opciones, response.votos, 1, '');
                } else {
                    columnChart(response.opciones, response.porcentajes, 1, '');
                }
            }
        },
        error: function (errorMsg) {
            $('#reportes-feedback').html('Ha ocurrido un error. Favor de intentar de nuevo.');
        }
    });
}



$(document).on('ready', function () {
    $('#reportes-header-option').addClass('selected');
    fillClientesSelect();

    setTimeout(function (event) {
        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: {'action': 'GET_MUNICIPIOS'},
            dataType: 'json',
            success: function (response) {
                arrEstadosMunicipios = response.estados;
                var currentHTML = '<option value="0">Selecciona un estado</option>';

                for (var estado in arrEstadosMunicipios) {
                    currentHTML += '<option value="' + stateShortName(estado) + '">' + estado + '</option>';
                }

                $('#estado-select').append(currentHTML);
            },
            error: function (error) {
                $('#selects-feedback').html('Error cargando los municipios');
            }
        });

    }, 500);

    $('#download-reportes').hide();
    $('#refresh').hide();
    $('#edad-select').hide();
    $('#genero-select').hide();
    $('#estado-select').hide();
    $('#educacion-select').hide();
    $('#filtros-button').hide();
    $('#clientes-filter-select').hide();
    $('#paneles-filter-select').hide();
    $('#encuestas-filter-select').hide();
    $('#preguntas-filter-select').hide();

    $('#clientes-filter-select').on('change', function() {
        var value = parseInt($('#clientes-filter-select').val(), 10);
        $('#paneles-filter-select').hide();
        $('#encuestas-filter-select').hide();
        $('#preguntas-filter-select').hide();
        $('#download-reportes').hide();
        $('#refresh').hide();
        $('#preguntas-filter-select').hide();
        $('#edad-select').hide();
        $('#genero-select').hide();
        $('#estado-select').hide();
        $('#educacion-select').hide();
        $('#filtros-button').hide();
        $('#chart1').empty();
        $('#chart2').empty();
        $('#chart3').empty();
        $('#chart4').empty();
        $('#selects-feedback').html('');
        $('#reportes-feedback').html('')
        $('#reportes-filtros-feedback').html('')

        if (value > 0) {
            fillPanelesSelect(value);
        }
    });

    $('#paneles-filter-select').on('change', function() {
        var value = parseInt($('#paneles-filter-select').val(), 10);
        $('#encuestas-filter-select').hide();
        $('#preguntas-filter-select').hide();
        $('#download-reportes').hide();
        $('#refresh').hide();
        $('#preguntas-filter-select').hide();
        $('#edad-select').hide();
        $('#genero-select').hide();
        $('#estado-select').hide();
        $('#educacion-select').hide();
        $('#filtros-button').hide();
        $('#chart1').empty();
        $('#chart2').empty();
        $('#chart3').empty();
        $('#chart4').empty();
        $('#selects-feedback').html('');
        $('#reportes-feedback').html('')
        $('#reportes-filtros-feedback').html('')

        if (value > 0) {
            fillEncuestasSelect(value);
        }
    });

    $('#encuestas-filter-select').on('change', function () {
        var idEncuesta = parseInt($(this).val(), 10);
        $('#preguntas-filter-select').empty();
        $('#download-reportes').hide();
        $('#refresh').hide();
        $('#preguntas-filter-select').hide();
        $('#edad-select').hide();
        $('#genero-select').hide();
        $('#estado-select').hide();
        $('#educacion-select').hide();
        $('#filtros-button').hide();
        $('#chart1').empty();
        $('#chart2').empty();
        $('#chart3').empty();
        $('#chart4').empty();
        $('#selects-feedback').html('');
        $('#reportes-feedback').html('')
        $('#reportes-filtros-feedback').html('')

        if (idEncuesta < 1) {
            return;
        }

        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                action: 'GET_PREGUNTAS',
                encuesta: idEncuesta
            },
            dataType: 'json',
            success: function (response) {
                if ($('#panelistas-header-option').is(':visible') && $('#usuarios-header-option').is(':visible')) {
                    $('#download-reportes').show();
                    $('#refresh').show();
                }

                var currentHTML = '<option value="-1">Selecciona una pregunta</option>';

                for (var i = 0; i < response.results.length; i++) {
                    var result = response.results[i];
                    currentHTML += '<option value="' + result.numPregunta + '">' + result.pregunta + '</option>';
                }

                currentHTML += '<option value="0">General</option>';
                $('#preguntas-filter-select').append(currentHTML);
                $('#preguntas-filter-select').show();
            },
            error: function (errorMsg) {
                $('#reportes-feedback').html('Ha ocurrido un error. Favor de intentar de nuevo.');
            }
        });
    });

    $('#refresh').on('click', function (){
        var data = {
            action: 'REPORT_DATA',
            encuesta: parseInt($('#encuestas-filter-select').val(), 10),
            numPregunta: currentNumeroPregunta
        };

        ajaxReportCall(data, currentNumeroPregunta);
    });


    $('#preguntas-filter-select').on('change', function () {
        var numPregunta = parseInt($(this).val(), 10);
        currentNumeroPregunta = numPregunta;
        $('#edad-select').hide();
        $('#genero-select').hide();
        $('#estado-select').hide();
        $('#educacion-select').hide();
        $('#filtros-button').hide();

        if ($('#reportes-feedback').html()) {
            $('#reportes-feedback').empty();
        }

        if ($('#reportes-filtros-feedback').html()) {
            $('#reportes-filtros-feedback').empty();
        }

        if (numPregunta < 0) {
            $('#abiertas-table').empty();
            $('#chart1').empty();
            $('#chart2').empty();
            $('#chart3').empty();
            $('#chart4').empty();
            return;
        }

        var data = {
            action: 'REPORT_DATA',
            encuesta: parseInt($('#encuestas-filter-select').val(), 10),
            numPregunta: numPregunta
        };

        ajaxReportCall(data, numPregunta);
    });

    $('#filtros-button').on('click', function () {
        var edad = parseInt($('#edad-select').val(), 10);
        var estado = $('#estado-select').val();
        var genero = parseInt($('#genero-select').val(), 10);
        var educacion = parseInt($('#educacion-select').val(), 10);

        if (edad === 0 && estado === '0' && genero === -1 && educacion === 0) {
            $('#chart2').empty();
            $('#reportes-filtros-feedback').html('Seleccione al menos un filtro a aplicar');
            return;
        }

        var data = {
            action: 'REPORT_DATA',
            encuesta: parseInt($('#encuestas-filter-select').val(), 10),
            numPregunta: parseInt($('#preguntas-filter-select').val(), 10)
        };

        if (edad > 0) {
            data.edad = edad;
        }

        if (estado !== '0') {
            data.estado = estado;
        }

        if (genero > -1) {
            data.genero = genero;
        }

        if (educacion > 0) {
            data.educacion = educacion;
        }

        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: data,
            dataType: 'json',
            success: function (response) {
                $('#chart2').empty();

                if (response.status === 'NO_DATA') {
                    $('#reportes-filtros-feedback').html('No hay información para los filtros seleccionados');
                    return;
                }

                if (response.tipo === 4) {
                    barChart(response.opciones, response.porcentajes, 2, '');
                } else if (response.tipo === 6) {
                    averageChart(parseInt(response.opciones[0], 10), parseInt(response.opciones[1], 10), response.porcentajes[0], 2);
                } else if (response.tipo === 5) {
                    barChartStacked(response.opciones, response.votos, response.subPreguntas, 2);
                } else if (response.opciones.length < 4) {
                    pieChart(response.opciones, response.votos, 2, '');
                } else {
                    columnChart(response.opciones, response.porcentajes, 2, '');
                }

                return;
            },
            error: function (errorMsg) {
                $('#reportes-feedback').html('Ha ocurrido un error. Favor de intentar de nuevo.');
            }
        });
    });

    $('#edad-select').on('change', function () {
        if ($('#reportes-filtros-feedback').html()) {
            $('#reportes-filtros-feedback').empty();
        }
    });

    $('#genero-select').on('change', function () {
        if ($('#reportes-filtros-feedback').html()) {
            $('#reportes-filtros-feedback').empty();
        }
    });

    $('#estado-select').on('change', function () {
        if ($('#reportes-filtros-feedback').html()) {
            $('#reportes-filtros-feedback').empty();
        }
    });

    $('#educacion-select').on('change', function () {
        if ($('#reportes-filtros-feedback').html()) {
            $('#reportes-filtros-feedback').empty();
        }
    });

    $('#refresh').on('click', function () {

    });


    $('#download-reportes').on('click', function () {
        var encuestaId = parseInt($('#encuestas-filter-select').val(), 10);

        if (encuestaId === -1) {
            return;
        }

        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                action: 'DOWNLOAD_DATA',
                encuesta: encuestaId
            },
            dataType: 'json',
            success: function (response) {
                if (response.status === 'ERROR') {
                    $('#reportes-feedback').html(response.message);
                    return;
                }

                var currentHTML = '<thead>';
                currentHTML += '<tr>';
                for (var i = 0; i < response.columnas.length; i++) {
                    var columna = response.columnas[i];
                    currentHTML += '<th>' + columna + '</th>';
                }

                currentHTML += '</tr></thead><tbody>';

                for (var j = 0; j < response.filas.length; j++) {
                    var fila = response.filas[j];
                    currentHTML += '<tr>'
                    currentHTML += '<td>' + fila.nombre + '</td>';
                    currentHTML += '<td>' + convertGenero(fila.genero) + '</td>';
                    currentHTML += '<td>' + fila.edad + '</td>';
                    currentHTML += '<td>' + convertEducacion(fila.educacion) + '</td>';
                    currentHTML += '<td>' + fila.municipio + '</td>';
                    currentHTML += '<td>' + fila.estado + '</td>';
                    currentHTML += '<td>' + readableDate(fila.fechaIni) + '</td>';
                    currentHTML += '<td>' + validateHour(fila.horaIni) + '</td>';
                    currentHTML += '<td>' + readableDate(fila.fechaFin) + '</td>';
                    currentHTML += '<td>' + validateHour(fila.horaFin) + '</td>';

                    for (var k = 0; k < fila.respuestas.length; k++) {
                        currentHTML += '<td>' + fila.respuestas[k] + '</td>';
                    }

                    currentHTML += '</tr>';
                }

                currentHTML += '</tbody>';
                $('#reportes-table').append(currentHTML);
                exportTable();
            },
            error: function (errorMsg) {
                $('#reportes-feedback').html('Ha ocurrido un error. Favor de intentar de nuevo.');
            }
        });
    });
});

function exportTable () {
    var uri = 'data:application/vnd.ms-excel;base64,';
    var template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>';
    var table = document.getElementById('reportes-table');
    var ctx = {
        worksheet: 'reportes',
        table: table.innerHTML
    };

    while (ctx.table.indexOf('á') !== -1) {
        ctx.table = ctx.table.replace('á', '&aacute;');
    }

    while (ctx.table.indexOf('é') !== -1) {
        ctx.table = ctx.table.replace('é', '&eacute;');
    }

    while (ctx.table.indexOf('í') !== -1) {
        ctx.table = ctx.table.replace('í', '&iacute;');
    }

    while (ctx.table.indexOf('ó') !== -1) {
        ctx.table = ctx.table.replace('ó', '&oacute;');
    }

    while (ctx.table.indexOf('ú') !== -1) {
        ctx.table = ctx.table.replace('ú', '&uacute;');
    }

    while (ctx.table.indexOf('ü') !== -1) {
        ctx.table = ctx.table.replace('ü', '&uuml;');
    }

    while (ctx.table.indexOf('ñ') !== -1) {
        ctx.table = ctx.table.replace('ñ', '&ntilde;');
    }

    while (ctx.table.indexOf('¿') !== -1) {
        ctx.table = ctx.table.replace('¿', '&iquest;');
    }

    document.getElementById('dlink').href = uri + base64(format(template, ctx));
    document.getElementById('dlink').download = 'reporte.xls';
    document.getElementById('dlink').click();
}

function base64 (s) {
    return window.btoa(unescape(encodeURIComponent(s)));
}

function format (s, c) {
    return s.replace(/{(\w+)}/g, function (m, p) {
        return c[p];
    });
}
