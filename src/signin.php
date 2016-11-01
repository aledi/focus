<!doctype html>

<html lang='en'>
<head>
    <link rel='icon' href='img/focusicon.ico' type='image/x-icon'>
  	<meta http-equiv='content-type' content='text/html; charset=UTF-8' />
	<link href='css/signin.css' type='text/css' rel='stylesheet' />
	<script src='js/jquery-1.12.3.js'></script>
    <script src='js/signin.js' type='text/javascript'></script>
    <title> Focus - Iniciar Sesión</title>
</head>

<body>
    <header>
        <img src='img/focus_logo.png'/>
    </header>
    <section>
        <div class='form-wrapper'>
            <form>
                <div class='input-wrapper'>
                    <label>Usuario</label>
                    <input type='text' name='Username' placeholder='Usuario' id='username' required />
                </div>
                <div class='input-wrapper'>
                    <label>Contraseña</label>
                    <input type='password' name='Password' placeholder='••••••••' id='password'>
                </div>
                <div>
                    <button type='submit' id='loginButton'>Iniciar Sesión</button>
                </div>
                <div id='feedback'></div>
            </form>
        </div>
    </section>
    <?php include_once('elements/footer.php');?>
</body>
</html>
