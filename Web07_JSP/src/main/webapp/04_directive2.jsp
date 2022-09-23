<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="04_error.jsp" %>
<!-- 주소는 http://localhost:8080/Web07_JSP/04_directive2.jsp 이지만 에러 발생시 04_error.jsp 페이지로 넘겨버림 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 처리</title>
</head>
<body>
	<h1>Directive를 사용한 에러 페이지 처리</h1>
	<p>나눗셈 결과 :<%=123 / 0%></p>
	<%
	String[] str = new String[2];
	str[5] = "hello"; // 여기도 에러지만 위에서 이미 에러 발생했기땜에 여기까지 안옴
	%>
</body>
</html>