<?php

header('Content-type: application/json');
require_once 'model.php';

$action = $_POST['action'];

switch($action) {
    case 'ADMIN_LOG_IN':
        signinToDatabase(0);
        break;
    case 'CLIENTE_LOG_IN':
        signinToDatabase(1);
        break;
    case 'PANELISTA_LOG_IN':
        signinToDatabase(2);
        break;
    case 'ALTA_ADMIN':
        newUser(0);
        break;
    case 'ALTA_CLIENTE':
        newUser(1);
        break;
    case 'ALTA_PANELISTA':
        newPanelista();
        break;
    case 'ALTA_PANEL':
        newPanel();
        break;
    case 'GET_CLIENTES':
        getClientes();
        break;
    case 'GET_PANELISTAS':
        getPanelistas();
        break;
}

function startSession ($id, $username, $email, $nombre) {
    session_start();

    $_SESSION['id'] = $id;
    $_SESSION['username'] = $username;
    $_SESSION['email'] = $email;
    $_SESSION['nombre'] = $nombre;
}

function signinToDatabase ($tipo) {
    if ($tipo === 0 || $tipo === 1) {
        $signinResult = validateWebCredentials($_POST['username'], $_POST['password'], $tipo);

        if($signinResult['status'] === "SUCCESS"){
            startSession($signinResult['id'], $signinResult['username'], $signinResult['email'], $signinResult['nombre']);
        }

    } else if ($tipo === 2) {
        $signinResult = validatePanelistaCredentials($_POST['email'], $_POST['password']);
    }

    echo json_encode($signinResult);
}

function newPanelista () {
    $registrationResult = registerPanelista($_POST['email'], $_POST['nombre'], $_POST['apPaterno'], $_POST['apMaterno'], $_POST['genero'], $_POST['educacion'], $_POST['edad'], $_POST['edoCivil'], $_POST['estado'], $_POST['municipio'], $_POST['cuartos'], $_POST['banios'], $_POST['regadera'], $_POST['focos'], $_POST['piso'], $_POST['autos'], $_POST['estudiosProv'], $_POST['estufa'], $_POST['movil'], $_POST['fotoINE']);

    echo json_encode($registrationResult);
}

function newUser ($tipo) {
    $registrationResult = registerUser($tipo, $_POST['username'], $_POST['password'], $_POST['nombre'], $_POST['apPaterno'], $_POST['apMaterno'], $_POST['email']);

    echo json_encode($registrationResult);
}

function newPanel () {
    $registrationResult = registerPanel($_POST['nombre'], $_POST['fechaInicio'], $_POST['fechaFin'], $_POST['cliente'], $_POST['creador']);

    echo json_encode($registrationResult);
}

function getClientes () {
    $clientesResult = fetchClientes();

    echo json_encode($clientesResult);
}

function getPanelistas () {
    $clientesResult = fetchPanelistas();

    echo json_encode($clientesResult);
}

?>
