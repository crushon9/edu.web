<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Result</title>
</head>
<body>
	<%
	// 환영합니다 출력하기위해 담음
	String userid = (String) session.getAttribute("userid");
	// 회원정보 불러오기 실패 alert
	String selectByIdResult = (String) request.getAttribute("selectByIdResult");
	if (selectByIdResult == "Fail") {
		out.print("<script>alert('회원정보 불러오기 실패');</script>");
		return;
	}
	%>
	
	<h2><%=userid %> 님, 환영합니다.</h2>
	
	<!-- GET 방식으로 전송, userid는 session에 담김 -->
	<button onclick="location.href='select.do'">회원정보</button>
	<button onclick="location.href='logout.do'">로그아웃</button>

</body>
</html>