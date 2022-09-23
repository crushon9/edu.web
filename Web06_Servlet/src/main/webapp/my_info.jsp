<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="edu.web.servlet05.InfoVO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send</title>
</head>
<body>
<!-- SendToClientServlet에서 전달한 데이터가 이 페이지의 결과로 출력됨 -->
<!-- request에 데이터를 담고 dispatcher에 URL : /my_info.jsp정보를 담아서 
dispatcher.forward(request, response); 이 페이지를 내부적 응답으로 클라이언트에게 보여줌 -->
	<%
	// getAttribute()의 리턴타입은 object 이므로 형변환을 해야함 (getParameter는 String 타입)
	String name = (String) request.getAttribute("name");
	String lived = (String) request.getAttribute("lived");
	int age = (Integer) request.getAttribute("age");
	InfoVO vo = (InfoVO) request.getAttribute("vo");
	%>
	
	<h1>결과 페이지</h1>
	<p>이름 : <%=name%></p>
	<p>나이 : <%=age%></p>
	<p>사는곳 : <%=lived%></p>

</body>
</html>