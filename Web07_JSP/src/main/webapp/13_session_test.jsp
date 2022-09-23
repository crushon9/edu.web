<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session test</title>
</head>
<body>
	<%
		String userid = (String) session.getAttribute("userid");
	%>
	
	<h2><%=userid %>님, 환영합니다.</h2>
	
	
</body>
</html>