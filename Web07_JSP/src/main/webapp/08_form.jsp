<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP form</title>
</head>
<body>

	<h2>GET 방식</h2>
	<form action="08_request.jsp" method="get"> <!-- action은 URL 같은 위치이므로 앞경로 생략하고 파일이름만 적은것임.. -->
	성<br><input type="text" name="firstName"><br>
	이름<br><input type="text" name="lastName"><br>
	<br><input type="submit" value="전송">
	</form>
	
	<h2>POST 방식</h2>
	<form action="08_request.jsp" method="post">
	성<br><input type="text" name="firstName"><br>
	이름<br><input type="text" name="lastName"><br>
	<br><input type="submit" value="전송">
	</form>
	
	</body>
</html>