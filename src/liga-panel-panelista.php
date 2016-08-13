<!--<?php //echo $_GET['id']?> -->
<!doctype html>

<html lang='en'>
<head>
  	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
    <script src="js/jquery-1.12.3.js"></script>
    <script src='elements/tableSorting/jquery.tablesorter.min.js'></script>
    <script src='js/liga-panel.js' type='text/javascript'></script>
    <script src='js/header.js' type='text/javascript'></script>
  	<title> Focus - Ligar Panelista</title>
</head>

<body>
    <div id='header'>
    	<div id="container">
    		<?php include_once('elements/navigation-bar.php');?>
    	</div>    
    </div>
    <div id='loginForm'>
    	<form id='formLogin'>
    		<h1> Ligar Panelistas</h1>
            <div id="panelista">
                <input type="text" id="filteringText"/>
                <p>Seleccionar Panelistas:</p>
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
