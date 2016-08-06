<?php

header('Content-type: application/json');
require_once 'model.php';

$action = $_POST['action'];

switch ($action) {
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
    case 'ALTA_ENCUESTA':
        newEnuesta();
        break;
    case 'GET_ADMINS':
        getRecords('ADMINS');
        break;
    case 'GET_CLIENTES':
        getRecords('CLIENTES');
        break;
    case 'GET_PANELES':
        getRecords('PANELES');
        break;
    case 'GET_PANELISTAS':
        getRecords('PANELISTAS');
        break;
    case 'GET_ENCUESTAS':
        getRecords('ENCUESTAS');
        break;
    case 'GET_PREGUNTAS':
        getRecords('PREGUNTAS');
        break;
    case 'GET_MOBILE_DATA':
    getRecords('MOBILE');
        break;
    case 'SET_PANELISTAS_PANEL':
        setPanelistasPanel();
        break;
    case 'SET_PREGUNTAS_ENCUESTA':
        setPreguntasEncuesta();
        break;
    case 'DELETE_ADMIN':
        deleteRecord('Usuario');
        break;
    case 'DELETE_CLIENTE':
        deleteRecord('Usuario');
        break;
    case 'DELETE_PANELISTA':
        deleteRecord('Panelista');
        break;
    case 'DELETE_PANEL':
        deleteRecord('Panel');
        break;
    case 'DELETE_ENCUESTA':
        deleteRecord('Encuesta');
        break;
    case 'VERIFY_SESSION':
        verifyActiveSession();
        break;
    case 'LOG_OUT':
        logOut();
        break;
    default:
        echo json_encode(array('status' => 'INVALID_ACTION', 'action' => $action));
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
        $registrationResult = updatePanelista($_POST['id'], $_POST['username'], $_POST['password'], $_POST['nombre'], $_POST['apPaterno'], $_POST['apMaterno'], $_POST['email'] $_POST['genero'], $_POST['fechaNacimiento'], $_POST['educacion'], $_POST['calleNumero'], $_POST['colonia'], $_POST['municipio'], $_POST['estado'], $_POST['banios'], $_POST['cp']);
    } else {
        $registrationResult = registerPanelista($_POST['username'], $_POST['password'], $_POST['nombre'], $_POST['apPaterno'], $_POST['apMaterno'], $_POST['email'], $_POST['genero'], $_POST['fechaNacimiento'], $_POST['educacion'], $_POST['calleNumero'], $_POST['colonia'], $_POST['municipio'], $_POST['estado'], $_POST['cp']);
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

function newEnuesta () {
    if (isset($_POST['id'])) {
        $registrationResult = updateEncuesta($_POST['id'], $_POST['nombre'], $_POST['fechaInicio'], $_POST['fechaFin'], $_POST['panel']);
    } else {
        $registrationResult = registerEncuesta($_POST['nombre'], $_POST['fechaInicio'], $_POST['fechaFin'], $_POST['panel']);
    }

    echo json_encode($registrationResult);
}

function getRecords ($type) {
    switch ($type) {
        case 'ADMINS':
            echo json_encode(fetchUsers(0));
            break;
        case 'CLIENTES':
            echo json_encode(fetchUsers(1));
            break;
        case 'PANELISTAS':
            if (isset($_POST['panel'])) {
                echo json_encode(fetchPanelistasPanel($_POST['panel']));
                return;
            }

            echo json_encode(fetchPanelistas());
            break;
        case 'PANELES':
            echo json_encode(fetchPaneles());
            break;
        case 'ENCUESTAS':
            echo json_encode(fetchEncuestas());
            break;
        case 'PREGUNTAS':
            if (isset($_POST['encuesta'])) {
                echo json_encode(fetchPreguntasEncuesta($_POST['encuesta']));
                return;
            }

            // echo json_encode(fetchPreguntas());
            break;
        case 'MOBILE':
            echo json_encode(fetchMobileData($_POST['panelista']));
            break;
    }
}

function setPanelistasPanel () {
    $saveResult = savePanelistasPanel($_POST['panel'], $_POST['panelistas']);

    echo json_encode($saveResult);
}

function setPreguntasEncuesta () {
    $saveResult = savePreguntasEncuesta($_POST['encuesta'], $_POST['preguntas']);

    echo json_encode($saveResult);
}

function deleteRecord ($table) {
    $deleteResult = removeRecord($_POST['id'], $table);

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
