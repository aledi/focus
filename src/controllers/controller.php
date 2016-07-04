<?php

header('Content-type: application/json');
require_once '../model/model.php';

$action = $_POST['action'];

switch($action) {
    case 'LOG_IN':
        signinToDatabase();
        break;
    case 'ALTA_PANELISTAS':
    	registerPanels();
    	break;

}

function signinToDatabase () {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $signinResult = validateCredentials($username, $password);


    if($signinResult['status'] == 'SUCCESS')
    	echo json_encode($signinResult);
    else{
    	header('HTTP/1.1 406 Usuario o contraseña incorrectos.');
		die("Usuario o contraseña incorrectos.");
    }
}

function registerPanels(){
	$fName = $_POST['fName'];
	$lName = $_POST['lName'];
	$email = $_POST['email'];
	$gender = $_POST['gender'];
	$education = $_POST['education'];
	$age = $_POST['age'];
	$marriageStatus = $_POST['marriageStatus'];
	$state = $_POST['state'];
	$county = $_POST['county'];
	$rooms = $_POST['rooms'];
	$bathrooms = $_POST['bathrooms'];
	$showers = $_POST['showers'];
	$bulbs = $_POST['bulbs'];
	$floorType = $_POST['floorType'];
	$cars = $_POST['cars'];
	$bossEducation = $_POST['bossEducation'];
	$stove = $_POST['stove'];
	$phoneNumber = $_POST['phoneNumber'];

	$registerResult = registerPanelist($fName, $lName, $email, $gender, $education, $age, $marriageStatus, $state, $county, $rooms, $bathrooms, $showers, $bulbs, $floorType, $cars, $bossEducation, $stove, $phoneNumber);

	if($registerResult['status'] == 'SUCCESS'){
		echo json_encode($registerResult);
	}
	else{
		header('HTTP/1.1 406 User cannot be added.');
		die("Usuario no añadido, ha ocurrido un error.");
	}
}

 ?>
