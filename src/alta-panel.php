<!doctype html>

<html lang='en'>
<head>
  	<meta charset='utf-8'>
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
	<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js'></script>
    <script src='js/nuevo-panel.js' type='text/javascript'></script>
  	<title> Focus - Iniciar Sesión</title>
</head>

<body>
    <div id='header'>
    	<div id="container">
    		<img src='img/focus_logo.png'/>
    	</div>
    </div>
    <div id='loginForm'>
    	<?php include_once('elements/navigation-bar.php');?>

    	<form id='formLogin'>
    		<h1> Alta de Páneles </h1>
            <div id="panelInput">
                <p>1. Nombre del Panel:</p>
                <input id="panelName" type="text"/>
            </div>

            <div id="date_starts">
                <p>2. Fecha de Inicio (yyyy-mm-dd):</p>
                <input id="dateStarts" type="text"/>
            </div>

            <div id="date_ends">
                <p>3. Fecha Final (yyyy-mm-dd):</p>
                <input id="dateEnds" type="text"/>
            </div>

            <div id="clients">
                <p>4. Seleccionar Cliente: </p>
                <select id="clientesDropdown">
                </select>
            </div>

	  		<div>
            	<button type='submit' id='loginButtonNuevoPanel'>Crear Panel</button>
        	</div>
            <div id='feedback'></div>
		</form>
    </div>
	<?php include_once('elements/footer.php');?>
</body>
</html>
