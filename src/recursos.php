<!doctype html>

<html lang='en'>
<head>
    <meta http-equiv='content-type' content='text/html; charset=UTF-8' />
    <script src='js/jquery-1.12.3.js'></script>
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
    <!--<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js'></script>-->
    <script src='js/recursos.js'></script>
    <title> Focus - Recursos</title>
</head>

<body>
	<?php include_once('elements/header.php');?>
	<section class='recursos-section'>
		<div class='recursos-wrapper'>
			<h2>Recursos</h2>
			<form action='../api/controller.php' method='POST' enctype='multipart/form-data'>
                <input type='hidden' name='action' value='ALTA_RECURSO'>
                Selecciona un archivo:
                <input type='file' name='file' id='file'><br>
                Nombre:
                <input type='text' name='file-name' id='file-name'><br>
                Tipo:
                <input type='radio' name='tipo' value='1'>Imagen</input>
                <input type='radio' name='tipo' value='2'>Video</input><br>
	            <input type='submit' value='Upload' name='submit' id='uploadData'>
            </form>
            <div id='#resources'>
            	<table id='allResources'></table>
            </div>
		</div>
	</section>
</body>

</html>
