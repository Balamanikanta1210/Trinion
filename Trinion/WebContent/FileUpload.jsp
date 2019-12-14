<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/Fileupload.css" type="text/css">
<title>Guru File</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<script src="js/Trinion.js" type="text/javascript"></script>
</head>
<body>
<div class="upload-btn-wrapper">
<form method="post" id="uploadFormId" class="myform" enctype="multipart/form-data">
<input type="file" id="file" size="50" />
<br/><br/>	
<input type="submit" class="uploadbtn" value="Upload File" onclick = "return false"/>
</form>
</div>
<div id="message"></div>
</body>
</html>
