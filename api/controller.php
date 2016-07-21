<?php

header('Content-type: application/json');
require_once 'model.php';

$action = $_POST['action'];

switch($action) {
    case 'WEB_LOG_IN':
        signinToDatabase(0);
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
    case 'GET_ADMINS':
        getUsers(0);
        break;
    case 'GET_CLIENTES':
        getUsers(1);
        break;
    case 'GET_PANELES':
        getPanel();
        break;
    case 'GET_PANELISTAS':
        getPanelistas();
        break;
    case 'SET_PANELISTA_PANEL':
        setPanelistaPanel();
        break;
    case 'DELETE_ADMIN':
        deleteUser(0);
        break;
    case 'DELETE_CLIENTE':
        deleteUser(1);
        break;
    case 'DELETE_PANELISTA':
        deleteUser(2);
        break;
    case 'DELETE_PANEL':
        deletePanel();
        break;
    case 'VERIFY_SESSION':
        verifyActiveSession();
        break;
    case 'LOG_OUT':
        logOut();
        break;
}

function startSession ($id, $tipo, $username, $email, $nombre) {
    session_start();

    $_SESSION['id'] = $id;
    $_SESSION['tipo'] = $tipo;
    $_SESSION['username'] = $username;
    $_SESSION['email'] = $email;
    $_SESSION['nombre'] = $nombre;
}

function hasActiveSession () {
    session_start();

    if (isset($_SESSION['id'])) {
        return array('status' => 'SUCCESS', 'id' => $_SESSION['id'], 'tipo' => $_SESSION['tipo'], 'username' => $_SESSION['username'], 'email' => $_SESSION['email'], 'nombre' => $_SESSION['nombre']);
    }

    return array('status' => 'ERROR');
}

function destroySession () {
    session_start();

    if (isset($_SESSION['id'])) {
        $_SESSION = array();

        session_destroy();
    }
}

function signinToDatabase ($tipo) {
    if ($tipo === 0) {
        $signinResult = validateWebCredentials($_POST['username'], $_POST['password']);

        if($signinResult['status'] === "SUCCESS"){
            startSession($signinResult['id'], $signinResult['tipo'], $signinResult['username'], $signinResult['email'], $signinResult['nombre']);
        }

    } else if ($tipo === 2) {
        $signinResult = validatePanelistaCredentials($_POST['email'], $_POST['password']);
    }

    echo json_encode($signinResult);
}

function newPanelista () {
    if (isset($_POST['id'])) {
        $registrationResult = updatePanelista($_POST['id'], $_POST['email'], $_POST['nombre'], $_POST['apPaterno'], $_POST['apMaterno'], $_POST['genero'], $_POST['educacion'], $_POST['edad'], $_POST['edoCivil'], $_POST['estado'], $_POST['municipio'], $_POST['cuartos'], $_POST['banios'], $_POST['regadera'], $_POST['focos'], $_POST['piso'], $_POST['autos'], $_POST['estudiosProv'], $_POST['estufa'], $_POST['movil'], $_POST['fotoINE']);
    } else {
        $registrationResult = registerPanelista($_POST['email'], $_POST['nombre'], $_POST['apPaterno'], $_POST['apMaterno'], $_POST['genero'], $_POST['educacion'], $_POST['edad'], $_POST['edoCivil'], $_POST['estado'], $_POST['municipio'], $_POST['cuartos'], $_POST['banios'], $_POST['regadera'], $_POST['focos'], $_POST['piso'], $_POST['autos'], $_POST['estudiosProv'], $_POST['estufa'], $_POST['movil'], $_POST['fotoINE']);
    }

    echo json_encode($registrationResult);
}

function newUser ($tipo) {
    if (isset($_POST['id'])) {
        $registrationResult = updateUser($_POST['id'], $_POST['username'], $_POST['password'], $_POST['nombre'], $_POST['apPaterno'], $_POST['apMaterno'], $_POST['email']);
    } else {
        $registrationResult = registerUser($tipo, $_POST['username'], $_POST['password'], $_POST['nombre'], $_POST['apPaterno'], $_POST['apMaterno'], $_POST['email']);
    }

    echo json_encode($registrationResult);
}

function newPanel () {
    if (isset($_POST['id'])) {
        $registrationResult = updatePanel($_POST['id'], $_POST['nombre'], $_POST['fechaInicio'], $_POST['fechaFin'], $_POST['cliente']);
    } else {
        session_start();
        $registrationResult = registerPanel($_POST['nombre'], $_POST['fechaInicio'], $_POST['fechaFin'], $_POST['cliente'], $_SESSION['id']);
    }

    echo json_encode($registrationResult);
}

function getUsers ($tipo) {
    $usersResult = fetchUsers($tipo);

    echo json_encode($usersResult);
}

function getPanelistas () {
    $clientesResult = fetchPanelistas();

    echo json_encode($clientesResult);
}

function getPanel() {
    $clientesResult = fetchPanel();

    echo json_encode($clientesResult);
}

function setPanelistaPanel () {
    $clientesResult = savePanelistaPanel($_POST['panel'], $_POST['panelistas']);

    echo json_encode($clientesResult);
}

function deleteUser ($tipo) {
    $deleteResult = removeUser($_POST['id'], $tipo);

    echo json_encode($deleteResult);
}

function deletePanel () {
    $deleteResult = removePanel($_POST['id']);

    echo json_encode($deleteResult);
}

function verifyActiveSession () {
    $validationResult = hasActiveSession();

    echo json_encode($validationResult);
}

function logOut ()  {
    destroySession();

    echo json_encode(array('status' => 'SUCCESS'));
}

?>
