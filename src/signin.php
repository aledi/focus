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
    <div class='header'>
        <div class='container'>
            <img src='img/focus_logo.png'/>
        </div>
    </div>
    <div class='login-form'>
        <form class='form-login'>
            <h1>Login</h1>
            <div class='input-wrapper'>
                <label>Usuario</label>
                <input type='text' name='Username' placeholder='Usuario' id='username' required />
            </div>
            <div class='input-wrapper'>
                <label>Contraseña</label>
                <input type='password' name='Password' placeholder='***************' id='password'>
            </div>
            <div>
                <button type='submit' id='loginButton' class='login-button'>Iniciar Sesión</button>
            </div>
            <div id='feedback'></div>
        </form>
    </div>
    <?php include_once('elements/footer.php');?>
</body>
</html>
