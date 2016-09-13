'use strict';

function pieChart(opciones, votes, i) {
    google.charts.load('current', {'packages':['corechart']});

      google.charts.setOnLoadCallback(drawChart);

    function drawChart() {

        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Opinion');
        data.addColumn('number', 'Votos');

        for (var x = 0; x < opciones.length; x++) {
            data.addRows([[opciones[x], votes[x]]]);
        }

        var options = {'width':600,
                        'height':400,
                        'sliceVisibilityThreshold': 0};

        var chart = new google.visualization.PieChart(document.getElementById('chart' + i));
        chart.draw(data, options);
    }
}

function barChart() {
    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
        var data = google.visualization.arrayToDataTable([
            ["Element", "Density", { role: "style" } ],
            ["Copper", 8.94, "#b87333"],
            ["Silver", 10.49, "silver"],
            ["Gold", 19.30, "gold"],
            ["Platinum", 21.45, "color: #e5e4e2"]
        ]);

        var view = new google.visualization.DataView(data);
        view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);

        var options = {
            title: "Density of Precious Metals, in g/cm^3",
            width: 600,
            height: 400,
            bar: {groupWidth: "95%"},
            legend: { position: "none" },
        };
        var chart = new google.visualization.BarChart(document.getElementById("barchart_values"));
        chart.draw(view, options);
    }
}

function columnChart(){
    //google.load('visualization', '1.0', {'packages':['corechart'], 'callback': drawStuff});

}


function getNumberofArrays(response) {
    var obj;
    var arrayCounter = 0;

    for (obj in response) {
        typeof response[obj] == 'object' ? arrayCounter += 1 : arrayCounter += 0;
    }

    return arrayCounter
}

$(document).on('ready', function () {
    $('#reportes-header-option').addClass('selected');

    setTimeout(function (event) {
        getEncuestas('reportes');
        barChart();
        columnChart();
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
                console.log(response);
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
        console.log(numPregunta);
        $('#edad-select').hide();
        $('#genero-select').hide();
        $('#estado-select').hide();
        $('#educacion-select').hide();
        $('#filtros-button').hide();

        if (numPregunta != 0) {
            console.log("General");
            $('#edad-select').show();
            $('#edad-select').val('0');

            $('#genero-select').show();
            $('#genero-select').val('-1');

            $('#estado-select').show();
            $('#estado-select').val('0');

            $('#educacion-select').show();
            $('#educacion-select').val('0');

            $('#filtros-button').show();
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
                console.log(response);
                if (response.status === "NO_DATA") {
                    document.getElementById('chart1').innerHTML = "";
                    return;
                }

                if (numPregunta === 0) {
                    // General
                }

                if (response.tipo === 1) {
                    // Tabla
                } else if (response.tipo === 4) {
                    // Barras
                } else if (Object.keys(response).length < 4) {
                    pieChart(response.opciones, response.votos, 1);
                } else {
                    // Columnas
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
            action : 'REPORT_DATA',
            encuesta : parseInt($('#reportes-encuestas-select').val(), 10),
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
                if (response.status === "NO_DATA") {
                    document.getElementById('chart3').innerHTML = "";
                    return;
                }

                if (response.tipo === 4) {
                    // Barras
                } else if (getNumberofArrays(response) < 4) {
                    pieChart(response.opciones, response.votos, 3);
                } else {
                    // Columnas
                }

                return;
            },
            error: function (errorMsg) {
                return;
            }
        });
    });
});
