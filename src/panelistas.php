<?php header('Content-type: text/html; charset=utf-8'); ?>
<!doctype html>

<html lang='en'>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
    <script src='js/jquery-1.12.3.js'></script>
    <script src='js/panelistas.js' type='text/javascript'></script>
    <title> Focus - Panelistas</title>
</head>

<body>
    <?php include_once('elements/header.php');?>
    <section>
        <div class='panelistas-wrapper'>
            <ul class='tabs'>
                <li class='tab-link current' data-tab='tab-agregarPanelista'>Agregar Panelista</li>
                <li class='tab-link' data-tab='tab-modificarPanelista'>Modificar Panelista</li>
            </ul>

            <div id='tab-agregarPanelista' class='tab-content current'>
                <h2 id='headerTitle'>Agregar Panelista</h2>

                <div class='input-wrapper'>
                    <label>Nombre(s)</label>
                    <input id='firstName' type='text' />
                </div>
                <div class='input-wrapper'>
                    <label>Apellido(s):</label>
                    <input id='lastName' type='text' />
                </div>
                <div class='input-wrapper'>
                    <label>Correo Electrónico:</label>
                    <input id='email' type='text' />
                </div>
                <div class='input-wrapper'>
                    <label>Usuario:</label>
                    <input id='username' type='text' />
                </div>
                <div id='panelista-password' class='input-wrapper'>
                    <label>Contraseña:</label>
                    <input id='password' type='password' placeholder='••••••••' />
                </div>
                <div class='input-wrapper'>
                    <label>Género:</label>
                    <input type='radio' value='0' name='gender' checked='true'>Masculino
                    <input type='radio' value='1' name='gender'>Femenino
                </div>
                <div class='input-wrapper'>
                    <label>Fecha de Nacimiento:</label>
                    <select id='dia'>
                        
                    </select>
                    <select id='mes'>
                        
                    </select>
                    <select id='anio'>
                        
                    </select>
                </div>
                <div class='input-wrapper'>
                    <label>Educación:</label>
                    <select class='form-control' id='educacion' name='educacion'>
                        <option value='0'>Selecciona un nivel de educación</option>
                        <option value='1'>Primaria</option>
                        <option value='2'>Secundaria</option>
                        <option value='3'>Preparatoria</option>
                        <option value='4'>Profesional</option>
                        <option value='5'>Posgrado</option>
                        <option value='6'>Ninguno</option>
                    </select>
                </div>
                <div class='input-wrapper'>
                    <label>Calle y Número:</label>
                    <input id='calleNumero' type='text' />
                </div>
                <div class='input-wrapper'>
                    <label>Colonia:</label>
                    <input id='colonia' type='text' />
                </div>
                <div class='input-wrapper'>
                    <label>Municipio:</label>
                    <input id='municipio' type='text' />
                </div>
                <div class='input-wrapper'>
                    <label>Estado:</label>
                    <select class='form-control' id='estado' name='estado'>
                        <option value='0'>Selecciona un estado...</option>
                        <option value='AGS'>Aguascalientes</option>
                        <option value='BC'>Baja California</option>
                        <option value='BCS'>Baja California Sur</option>
                        <option value='CAMP'>Campeche</option>
                        <option value='COAH'>Coahuila</option>
                        <option value='CHIH'>Colima</option>
                        <option value='CHIS'>Chiapas</option>
                        <option value='CDMX'>Ciudad de México</option>
                        <option value='DGO'>Durango</option>
                        <option value='GTO'>Guanajuato</option>
                        <option value='GRO'>Guerrero</option>
                        <option value='HGO'>Hidalgo</option>
                        <option value='JAL'>Jalisco</option>
                        <option value='EDOMEX'>Estado de México</option>
                        <option value='MICH'>Michoacán</option>
                        <option value='MOR'>Morelos</option>
                        <option value='NAY'>Nayarit</option>
                        <option value='NL'>Nuevo León</option>
                        <option value='OAX'>Oaxaca</option>
                        <option value='PUE'>Puebla</option>
                        <option value='QRO'>Querétaro</option>
                        <option value='QROO'>Quintana Roo</option>
                        <option value='SLP'>San Luis Potosí</option>
                        <option value='SIN'>Sinaloa</option>
                        <option value='SON'>Sonora</option>
                        <option value='TAB'>Tabasco</option>
                        <option value='TAM'>Tamaulipas</option>
                        <option value='TLAX'>Tlaxcala</option>
                        <option value='VER'>Veracruz</option>
                        <option value='YUC'>Yucatan</option>
                        <option value='ZAC'>Zacatecas</option>
                    </select>
                </div>
                <div class='input-wrapper'>
                    <label>Código Postal:</label>
                    <input id='cp' type='text' />
                </div>

                <button type='submit' id='savePanelista'>Enviar</button>
                <span id='feedback' class='feedback-text'></span>
            </div>

            <div id='tab-modificarPanelista' class='tab-content'>
                <h2>Panelistas Disponibles</h2>
                <table id='allPanelistas'></table>
                <div id='feedback'></div>
            </div>
        </div>
    </section>
</body>
</html>