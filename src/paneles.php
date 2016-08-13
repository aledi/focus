<!doctype html>

<html lang='en'>
<head>
  	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
	<script src='js/jquery-1.12.3.js'></script>
	<script src='js/nuevo-panel.js' type='text/javascript'></script>
    <script src='js/modify-delete.js' type='text/javascript'></script>
  	<title> Focus - Paneles</title>
</head>

<body>
    <div id='header'>
    	<div id='container'>
    		<?php include_once('elements/navigation-bar.php');?>
    	</div>
    </div>
    <div id='contentContainer'>

        <ul class='tabs'>
            <li class='tab-link current' data-tab='tab-agregarPanel'>Agregar Panel</li>
            <li class='tab-link' data-tab='tab-modificarPanel'>Modificar Panel</li>
        </ul>

		<div id='tab-agregarPanel' class='tab-content current'>
			<div class='formHeader'>
				<h2 id='headerTitle'>Agregar Panel</h2>
			</div>
			<div id='panelInput'>
                <p>Nombre del Panel:</p>
                <input id='panelName' type='text'/>
            </div>
            <div id='descripcionInput'>
                <p>Descripción:</p>
                <textarea id='descripcion' type='text'/></textarea>
            </div>
            <div id='date_starts'>
                <p>Fecha de Inicio (yyyy-mm-dd):</p>
                <input id='dateStarts' type='text'/>
            </div>
            <div id='date_ends'>
                <p>Fecha Final (yyyy-mm-dd):</p>
                <input id='dateEnds' type='text'/>
            </div>
            <div id='clients'>
                <p>Seleccionar Cliente: </p>
                <table id='tableClientes'>

                </table>
            </div>
	  		<div>
            	<button type='submit' id='loginButtonNuevoPanel'>Confirmar</button>
        	</div>
            <div id='feedback'></div>
		</div>

		<div id='tab-modificarPanel' class='tab-content'>
            <div class='formHeader'>
                <h2>Paneles Disponibles</h2>
            </div>
			<table id='allPanels'>

			</table>
		</div>
    </div>
	<?php include_once('elements/footer.php');?>
</body>
</html>
