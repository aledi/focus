<!doctype html>

<html lang='en'>
<head>
  	<meta charset='utf-8'>
	<link href='css/signin.css' type='text/css' rel='stylesheet'/>
	<script src="js/jquery-1.12.3.js"></script>
    <script src='js/signin.js' type='text/javascript'></script>
  	<title> Focus - Iniciar Sesión</title>
</head>

<body>
    <div id='header'>
    	<div id="container">
    		<img src='img/focus_logo.png'/>
    	</div>
    </div>
    <div id='loginForm'>

    	<form id='formLogin'>
    		<h1> Login </h1>
            <div class='input-wrapper'>
                <label> Username: </label><br/>
		 		<input type='text' name='Username' placeholder='Username' id='username' required />
	 		</div>
	 		<br/>
            <div class='input-wrapper'>
	 		    <label> Password: </label><br/>
		  		<input type='password' name='Password' placeholder='***************' id='password'>
	  		</div>
	  		<div>
            	<button type='submit' id='loginButton'>Iniciar Sesión</button>
        	</div>
            <div id='feedback'></div>
		</form>
    </div>
	<?php include_once('elements/footer.php');?>
</body>
</html>
