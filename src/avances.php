<!doctype html>

<html lang='en'>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
    <script src="js/jquery-1.12.3.js"></script>
    <script src='js/header.js' type='text/javascript'></script>
    <script src='js/avances.js' type='text/javascript'></script>
    <script src='js/encuestas-shared.js' type='text/javascript'></script>
    <script src='js/date-functions.js' type='text/javascript'></script>
    <title> Focus - Avances</title>
</head>

<body>
    <?php include_once('elements/header.php');?>
    </div>
    <section>
        <h1>Avances</h1>
        <select id='encuestas-select'>
            <option value='0'>Selecciona una encuesta</option>
        </select>
        <p id='avance-percentage'></p>
        <p id='avance-panelistas'></p>
        <table id='avances-table'>
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Género</th>
                    <th>Edad</th>
                    <th>Educación</th>
                    <th>Municipio</th>
                    <th>Estado</th>
                    <th>Fecha</th>
                    <th>Hora</th>
                </tr>
            </thead>
            <tbody id='avances-table-body'>
            </tbody>
        </table>
    </section>
</body>
</html>
