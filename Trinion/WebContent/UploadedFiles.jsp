<%@page import="com.java.src.GetUploadFilesList"%>
<%@page import="com.java.beans.LogFileDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>  
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/w3.css" type="text/css">
<link rel="stylesheet" href="css/table.css" type="text/css">
<title>Insert title here</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<script src="js/Trinion.js" type="text/javascript"></script>
</head>
<body>
<%  
try{
	int pageid;
	String spageid=request.getParameter("page");
if(spageid==null)
{
	spageid="1";
	pageid=Integer.parseInt(spageid);
}
else
{
	pageid=Integer.parseInt(spageid);
} 
int totalrows=GetUploadFilesList.getRecordsCount();
System.out.print(totalrows);
int total=5;  
if(pageid==1){
	pageid=totalrows-5;
}  
else{  
    pageid=totalrows-(pageid*5);  
}  
List<LogFileDetails> list=GetUploadFilesList.getRecords(pageid,total);  
  
out.print("<h1>Uploaded Files</h1>");  
out.print("<table border='1' cellpadding='4' width='60%'>");  
out.print("<tr><th>Uploaded Date</th><th>Uploaded time</th><th>FilePath</th><th></th>");  
for(LogFileDetails e:list){  
    out.print("<tr><td>"+e.getUploadedDate()+"</td><td>"+e.getUploadedTime()+"</td><td class='file'>"+e.getFilePath()+"</td>");
    out.print("<td><input type='button' class='generate' value='Generate'></td></tr>");
}  
out.print("</table>");  
}
catch(Exception e)
{
	e.printStackTrace();
}
%>  
<a href="UploadedFiles.jsp?page=1" class="pages">1</a>  
<a href="UploadedFiles.jsp?page=2" class="pages">2</a>  
<a href="UploadedFiles.jsp?page=3" class="pages">3</a>  
<div id="message"></div>
</body>
</html>