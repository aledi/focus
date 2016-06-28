<?php

header('Content-type: application/json');
require_once '../model/model.php';

$action = $_POST['action'];

switch($action) {
    case 'LOG_IN':
        signinToDatabase();
        break;
}

function signinToDatabase () {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $signinResult = validateCredentials($username, $password);

    echo json_encode($signinResult);
}

 ?>
