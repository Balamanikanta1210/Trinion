<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*,java.text.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.apache.commons.io.output.*"%>
<%@ page import="com.java.src.MysqlConnection"%>
<%@ page import="java.sql.Connection,java.sql.Statement,com.java.src.*" %>
<%
	File file;
	int maxFileSize = 5000 * 1024;
	int maxMemSize = 5000 * 1024;
	String filePath = "E:/data/";
	String contentType = request.getContentType();
	String pattern = "yyyyMMddHHmmss";
	String timePattern="HH:mm:ss";
	String datePattern="dd/MM/yyyy";
	SimpleDateFormat fileFormat = new SimpleDateFormat(pattern);
	SimpleDateFormat timeFormat = new SimpleDateFormat(timePattern);
	SimpleDateFormat dateFormat = new SimpleDateFormat(datePattern);
	String newFileName = "Auth"+fileFormat.format(new Date());
	String timeOfUpload=timeFormat.format(new Date());
	String dateOfUpload=dateFormat.format(new Date());
	if ((contentType.indexOf("multipart/form-data") >= 0)) {

		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(maxMemSize);
		factory.setRepository(new File("c:\\temp"));
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax(maxFileSize);
		try {
			List fileItems = upload.parseRequest(request);
			Iterator i = fileItems.iterator();
			while (i.hasNext()) {
				FileItem fi = (FileItem) i.next();
				if (!fi.isFormField()) {
					String fieldName = fi.getFieldName();
					String fileName = fi.getName();
					boolean isInMemory = fi.isInMemory();
					long sizeInBytes = fi.getSize();
					file = new File(filePath+newFileName);
					fi.write(file);
					out.println("Uploaded File '" + fileName + "' succesfully:");
					session.setAttribute("fileName", newFileName);
					session.setAttribute("timeOfUpload", timeOfUpload);
					session.setAttribute("dateOfUpload", dateOfUpload);
					Statement st=MysqlConnection.getConnection().createStatement();
					st.executeUpdate("insert into UploadedTransactionlogs(uploadeddate,uploadedtime,filepath)values('"+dateOfUpload+"','"+timeOfUpload+"','"+filePath+""+newFileName+"')");
				}
			}

		} catch (Exception ex) {
			System.out.println(ex);
		}
	} else {

		out.println("<p>No file uploaded</p>");
	}
%>