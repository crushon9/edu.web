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
	// 세션만료 예외처리
	String userid = (String) session.getAttribute("userid");
	if (userid == null) {
		out.print("<script>alert('세션이 유효하지 않습니다');</script>");
		out.print("<script>location.href='login.jsp'</script>");
		return;
	}
	// 회원정보 불러오기 실패 alert
	String selectByIdResult = (String) request.getAttribute("selectByIdResult");
	if (selectByIdResult == "Fail") {
		out.print("<script>alert('회원정보 불러오기 실패');</script>");
		return;
	}
	%>
	
	<h2><%=userid %> 님, 환영합니다.</h2>
	
	<!-- GET 방식으로 userid 전송 -->
	<button onclick="location.href='select.do?userid=<%=userid%>'">회원정보</button>
	<button onclick="location.href='logout.do?userid=<%=userid%>'">로그아웃</button>

</body>
</html>