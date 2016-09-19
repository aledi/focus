<?php

function uploadFile() {
    $target_dir = '../resources/';
    $target_file = $target_dir . basename($_FILES['file']['name']);
    $uploadOk = 1;
    $fileType = pathinfo($target_file,PATHINFO_EXTENSION);

    // Check if image file is a actual image or fake image
    if(isset($_POST['submit'])) {
        $check = getimagesize($_FILES['file']['tmp_name']);
        if($check !== false) {
            $uploadOk = 1;
        } else {
            $uploadOk = 0;
            return array('status' => 'File is not an image');
        }
    }

    // Check if file already exists
    if (file_exists($target_file)) {
        $uploadOk = 0;
        return array('status' => 'Sorry, file already exists.');
    }

    // Check file size
    if ($_FILES['file']['size'] > 500000) {
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
        echo 'Sorry, your file was not uploaded.';
    // if everything is ok, try to upload file
    } else {
        if (move_uploaded_file($_FILES['file']['tmp_name'], $target_file)) {
            return array('status' => 'The file has been uploaded.');
        } else {
            return array('status' => 'Sorry, there was an error uploading your file.');
        }
    }
}

?>
