<!doctype html>

<html lang='en'>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href='css/template.css' type='text/css' rel='stylesheet' />
    <script src='js/jquery-1.12.3.js'></script>
    <script src='js/administradores.js' type='text/javascript'></script>
    <title> Focus - Administradores</title>
</head>

<body>
    <?php include_once('elements/header.php');?>
    <section>
        <div class='admins-wrapper'>
            <ul class='tabs'>
                <li class='tab-link current' data-tab='tab-agregar-administrador'>Agregar Administrador</li>
                <li class='tab-link' data-tab='tab-view-administradores'>Ver Administradores</li>
            </ul>

            <div id='tab-agregar-administrador' class='tab-content current'>
                <h2 id='header-title'>Agregar Administrador</h2>

                <div class='input-wrapper'>
                    <label>Nombre(s)<span class='required-input'>*</span></label>
                    <input id='firstName' type='text' />
                </div>

                <div class='input-wrapper'>
                    <label>Apellido(s)<span class='required-input'>*</span></label>
                    <input id='lastName' type='text' />
                </div>

                <div class='input-wrapper'>
                    <label>Correo Electrónico<span class='required-input'>*</span></label>
                    <input id='email' type='text' />
                </div>

                <div class='input-wrapper'>
                    <label>Usuario<span class='required-input'>*</span></label>
                    <input id='username' type='text' />
                </div>

                <div id='admin-password' class='input-wrapper'>
                    <label>Contraseña<span class='required-input'>*</span></label>
                    <input id='password' type='password' name='Password' placeholder='••••••••'>
                </div>

                <div id='admin-password-confirm' class='input-wrapper'>
                    <label>Confirmar Contraseña<span class='required-input'>*</span></label>
                    <input id='passwordConfirm' type='password' name='Password' placeholder='••••••••'>
                </div>

                <button type='button' id='cancel-edit' class='no-background'>Cancelar</button>
                <button type='submit' id='save-admin'>Agregar</button>
                <span id='feedback' class='feedback-text'></span>
            </div>

            <div id='tab-view-administradores' class='tab-content'>
                <h2>Administradores Disponibles</h2>

                <table id="allAdmins"></table>
            </div>
        </div>
    </section>
</body>
</html>
