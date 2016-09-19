<!doctype html>

<html lang='en'>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="js/jquery-1.12.3.js"></script>
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
    <!--<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js'></script>-->
    <title> Focus - Encuestas</title>
</head>

<body>
	<?php include_once('elements/header.php');?>
	<section class='recursos-section'>
		<div class='recursos-wrapper'>
			<h2>Recursos</h2>
			<form action="../api/upload.php" method="post" enctype="multipart/form-data">
            Select image to upload:
	            <input type="file" name="fileToUpload" id="fileToUpload">
	            <br/>
	            <input type="submit" value="Upload Image" name="submit">
        </form>
		</div>
	</section>
</body>

</html>