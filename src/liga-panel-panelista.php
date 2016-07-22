<!--<?php //echo $_GET['id']?> -->
<!doctype html>

<html lang='en'>
<head>
  	<meta charset='utf-8'>
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
	<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js'></script>
    <script src='js/liga-panel.js' type='text/javascript'></script>
    <script src='js/header.js' type='text/javascript'></script>
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
            <div id="panelista">
                <p>1. Seleccionar Panelistas:</p>
                <table id="tablaPanelistas">

                </table>
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
