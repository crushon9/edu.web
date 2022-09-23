<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 결과 페이지</title>
	<%
	request.setCharacterEncoding("UTF-8");

	// 아이디저장 value가 null이(미체크시 null) 아니라면 쿠키생성하여 getParameter값을 넣어 저장함
	// equal("agreed")을 쓰면 아이디저장 미체크시 NullPointerException 발생
	if (request.getParameter("isSaveAgreed") != null) {
		Cookie idCookie = new Cookie("id", request.getParameter("id"));
		Cookie pwCookie = new Cookie("pw", request.getParameter("pw"));

		idCookie.setMaxAge(60 * 10);
		pwCookie.setMaxAge(60 * 10);

		response.addCookie(idCookie);
		response.addCookie(pwCookie);
	}
	%>
</head>
<body>
	<h1>로그인 결과 화면</h1>
	<p><%=request.getParameter("id")%>님, 환영합니다.</p>
</body>
</html>