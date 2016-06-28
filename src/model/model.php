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

            return array('status' => 'SUCCESS');
        } else {
            $conn->close();

            return array('status' => 'ERROR');
        }
    }
}

 ?>
