<?php

function startSession ($username, $firstName, $lastName) {
    session_start();

    $_SESSION['username'] = $username;
    $_SESSION['firstName'] = $firstName;
    $_SESSION['lastName'] = $lastName;
}

function connect() {
    $servername = "localhost";
    $username = "root";
    $password = "root";
    $dbname = "focus";

    $connection = new mysqli($servername, $username, $password, $dbname);

    # Check connection
    if ($connection->connect_error) {
        return null;
    } else {
        return $connection;
    }
}

function validateCredentials ($username, $password) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT * FROM Usuario WHERE username = '$username' AND password = '$password'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();

            startSession($row['username'], $row['nombre'], $row['apPaterno'] + $row['apMaterno']);
            $conn->close();

            return array('status' => 'SUCCESS', 'message' => 'Login exitoso.');
        } else {
            $conn->close();

            return array('status' => 'ERROR', 'message' => 'Usuario o contraseña equivocada.');
        }
    }
}

function registerPanelist($fName, $lName, $email, $gender, $education, $age, $marriageStatus, $state, $county, $rooms, $bathrooms, $showers, $bulbs, $floorType, $cars, $bossEducation, $stove, $phoneNumber){

    $conn = connect();

    if($conn != null){
        $sql = "SELECT * FROM Usuario WHERE email = '$email'";
        $result = $conn->query($sql);

        if($result->num_rows != 0){
            echo "Starts Registry";
            return array('status' => 'ERROR', 'message' => 'Panelista ya registrado en la base de datos.');

        }
        else{

            $sql = "INSERT INTO panelista (email, nombre, apPaterno, genero, educacion, edad, edoCivil, estado, municipio, cuartos, banios, regadera, focos, piso, autos, estudiosProv, estufa, movil)
                VALUES ('$email', '$fName', '$lName', '$gender', '$education', '$age', '$marriageStatus', '$state', '$county', '$rooms', '$bathrooms', '$showers', '$bulbs', '$floorType', '$cars', '$bossEducation', '$stove', '$phoneNumber')";
            $result = $conn->query($sql);

            if($result == TRUE){
                $response = array("status" => "SUCCESS");
                return $response;
            }
            else{
                $conn->close();
                return array('status' => 'ERROR', 'message' => 'Erorr añadiendo el usuario.');
                echo "Starts Registry";
            }
        }
    }
    else {
        $conn->close();

        return array('status' => 'ERROR', 'message' => 'Usuario o contraseña equivocada.');
    }
}

 ?>
