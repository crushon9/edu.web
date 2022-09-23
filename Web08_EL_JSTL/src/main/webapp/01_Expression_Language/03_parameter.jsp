<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 보기</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>

<!-- param.(파라미터이름) == request.getParameter(파라미터이름)-->
	<h1>회원 정보</h1>
	<p>아이디 : ${param.userid}</p>
	<p>패스워드 : ${param.password}</p>
	<p>이메일 : ${param.email}</p>
	<p>이메일 수신여부 : ${param.emailAgree}</p>
	<p>관심사항 : ${paramValues.interest}</p>
	<br>${paramValues.interest[0]}
	<br>${paramValues.interest[1]}
	<br>${paramValues.interest[2]}
	<br>${paramValues.interest[3]}
	<p>핸드폰 : ${param.phone}</p>
	<p>자기소개 : ${param.introduce}</p>

</body>
</html>