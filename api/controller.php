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
}

function signinToDatabase ($tipo) {

    if ($tipo == 0 || $tipo == 1) {
        $signinResult = validateWebCredentials($_POST['username'], $_POST['password'], $tipo);
    } else if ($tipo == 2) {
        $signinResult = validatePanelistaCredentials($_POST['email'], $_POST['password']);
    }

    echo json_encode($signinResult);
}

?>
