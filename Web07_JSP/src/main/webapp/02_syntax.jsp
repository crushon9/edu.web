<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%!// 멤버 변수, 전역 변수
	int fontSize;
	int day = 3;%>

<html>
<head>
<meta charset="UTF-8">
<title>JSP 구문</title>
</head>
<body>
	<%
	// 이 공간은 javax.servlet.http.HttpServlet.service
	int test = 1; // 지역 변수
	%>

	<%
	if (day == 1 || day == 7) {
		// 이렇게 out.write로 잘 안씀
		out.write("<p>오늘은 주말입니다_out.write로 출력하기</p>");
	%>
	<!-- 자바사이에 HTML을 껴넣기 -->
	<p>오늘은 주말입니다_HTML로 출력하기</p>
	<%
	} else {
		out.write("<p>오늘은 평일입니다_out.write로 출력하기</p>");
	%>
	<p>오늘은 평일입니다_HTML로 출력하기</p>
	<%
	}
	%>

	<%-- 
		JSP 태그는 HTML 내 어느 위치에서든 사용 가능
	--%>
	<%
	for (fontSize = 1; fontSize <= 5; fontSize++) {
	%>
	<font color="green" size="<%=fontSize%>">JSP 구문 연습 중</font><br>
	<%
	}
	%>

</body>
</html>