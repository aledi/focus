<?php header('Content-type: text/html; charset=utf-8'); ?>
<!doctype html>

<html lang='en'>
<head>
    <link rel='icon' href='img/focusicon.ico' type='image/x-icon'>
    <meta http-equiv='content-type' content='text/html; charset=UTF-8' />
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
    <script src='js/jquery-1.12.3.js'></script>
    <script src='js/date-functions.js' type='text/javascript'></script>
    <script src='js/states.js' type='text/javascript'></script>
    <script src='js/panelistas.js' type='text/javascript'></script>
    <title> Focus - Panelistas</title>
</head>

<body>
    <?php include_once('elements/header.php');?>
    <section>
        <div class='panelistas-wrapper'>
            <ul class='tabs'>
                <li class='tab-link current' data-tab='tab-agregar-panelista'>Agregar Panelista</li>
                <li class='tab-link' data-tab='tab-view-panelistas'>Ver Panelistas</li>
            </ul>

            <div id='tab-agregar-panelista' class='tab-content current'>
                <h2 id='header-title'>Agregar Panelista</h2>

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
                <div id='panelista-password' class='input-wrapper'>
                    <label>Contraseña<span class='required-input'>*</span></label>
                    <input id='password' type='password' placeholder='••••••••' />
                </div>
                <div class='input-wrapper'>
                    <label>Género<span class='required-input'>*</span></label>
                    <input type='radio' value='0' name='gender' checked='true'>Masculino
                    <input type='radio' value='1' name='gender'>Femenino
                </div>
                <div class='input-wrapper'>
                    <label>Fecha de Nacimiento<span class='required-input'>*</span></label>
                    <select id='dia'></select>
                    <select id='mes'></select>
                    <select id='anio'></select>
                </div>
                <div class='input-wrapper'>
                    <label>Educación<span class='required-input'>*</span></label>
                    <select class='form-control' id='educacion' name='educacion'>
                        <option value='0'>Selecciona un nivel de educación</option>
                        <option value='1'>Primaria</option>
                        <option value='2'>Secundaria</option>
                        <option value='3'>Preparatoria o Técnica</option>
                        <option value='4'>Profesional</option>
                        <option value='5'>Posgrado</option>
                        <option value='6'>Ninguno</option>
                    </select>
                </div>
                <div class='input-wrapper'>
                    <label>Calle y Número<span class='required-input'>*</span></label>
                    <input id='calleNumero' type='text' />
                </div>
                <div class='input-wrapper'>
                    <label>Colonia<span class='required-input'>*</span></label>
                    <input id='colonia' type='text' />
                </div>
                <div class='input-wrapper'>
                    <label>Estado<span class='required-input'>*</span></label>
                    <select class='form-control' id='estado' name='estado'>

                    </select>
                </div>
                <div class='input-wrapper'>
                    <label>Municipio<span class='required-input'>*</span></label>
                    <select class='form-control' id='municipio' name='municipio'>
                        <option value='0'>Selecciona un municipio</option>
                    </select>
                </div>
                <div class='input-wrapper'>
                    <label>Código Postal<span class='required-input'>*</span></label>
                    <input type='number' id='cp' type='text' />
                </div>

                <button type='button' id='cancel-edit' class='no-background'>Cancelar</button>
                <button type='submit' id='save-panelista'>Agregar</button>
                <span id='feedback' class='feedback-text'></span>
            </div>

            <div id='tab-view-panelistas' class='tab-content'>
                <h2>Panelistas Disponibles</h2>
                <label>Buscar: <input id='filteringText' type='text' /></label>
                <p class='alert'>*Los panelistas marcados en rojo no cuentan con información suficiente para responder encuestas</p>
                <table id='all-panelistas'></table>
                <div id='feedback'></div>
            </div>
        </div>
    </section>
</body>
</html>
