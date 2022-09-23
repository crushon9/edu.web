<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>image output</title>
</head>
<body>
<%
String fileName = (String) session.getAttribute("fileName");

%>
<img alt="닥스" src="images/<%= fileName%>">

</body>
</html>