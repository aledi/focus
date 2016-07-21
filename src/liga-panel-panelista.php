<!doctype html>

<html lang='en'>
<head>
  	<meta charset='utf-8'>
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
	<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js'></script>
    <script src='js/liga-panel.js' type='text/javascript'></script>
  	<title> Focus - Ligar Panelista</title>
</head>

<body>
    <div id='header'>
    	<div id="container">
    		<img src='img/focus_logo.png'/>
    	</div>
        <?php include_once('elements/navigation-bar.php');?>
    </div>
    <div id='loginForm'>
    	<form id='formLogin'>
    		<h1> Ligar Panelistas a un Panel</h1>
            <div id="paneles">
                <p>1. Seleccionar Panel: </p>
                <select id="panelesDropdown">
                </select>
            </div>

            <div id="panelista">
                <p>2. Seleccionar Panelistas: (Mantener presionado Cntrl para varios)</p>
                <select id="panelistasDropdown" multiple>
                </select>
            </div>

	  		<div>
            	<button type='submit' id='loginButtonLigarPanel'>Ligar Panelistas</button>
        	</div>
            <div id='feedback'></div>
		</form>
    </div>
	<?php include_once('elements/footer.php');?>
</body>
</html>
