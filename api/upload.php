<?php

function uploadFile($name, $tipo) {
    $target_dir = '../resources/'.($tipo == 1 ? 'images/' : 'videos/');
    $target_file = $target_dir.$name;
    $uploadOk = 1;
    $fileType = pathinfo($target_file, PATHINFO_EXTENSION);

    // Check if file already exists
    if (file_exists($target_file)) {
        $uploadOk = 0;
        return array('status' => 'Sorry, file already exists.');
    }

    // Check file size to 25MB
    if ($_FILES['file']['size'] > 26214400) {
        $uploadOk = 0;
        return array('status' => 'Sorry, your file is too large.');
    }

    // Allow certain file formats
    if($fileType != 'jpg' && $fileType != 'png' && $fileType != 'mp4' ) {
        $uploadOk = 0;
        return array('status' => 'Sorry, only JPG, PNG & MP4 files are allowed.');
    }

    // Check if $uploadOk is set to 0 by an error
    if ($uploadOk == 0) {
    // if everything is ok, try to upload file
    } else {
        if (move_uploaded_file($_FILES['file']['tmp_name'], $target_file)) {
            return array('status' => 'SUCCESS');
        } else {
            return array('status' => 'Sorry, there was an error uploading your file.');
        }
    }
}

?>
