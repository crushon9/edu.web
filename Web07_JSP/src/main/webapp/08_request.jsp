<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP request</title>
</head>
<body>
	<%--
	* Request
	- 요청한 HTTP의 정보(ip주소, 파라미터 등)를 갖고 있는 객체 (servlet의 HttpServletRequest와 동일)
 	- 요청한 페이지에 대한 정보만 가지고 있음 (다른 페이지에서는 request 정보가 사라짐)
 	
 	** Request 를 주고 받을때는 동일한 객체를 주고 받는것임
 	객체는 재활용되고 안에 담기는 데이터만 달라짐
 	
 	
 	** HTTP (Hyper Text Transfer Protocol) 통신 프로토콜의 특징
 	클라이언트의 요청이 있을 때 서버가 응답하는 단방향 통신
 	1. 비연결(non-connection) 프로토콜
 		- 클라이언트(웹 브라우저)의 요청(request)에 대한 응답(response)을 하고 나면 해당 클라이언트와 연결을 지속하지 않고 끊어버림
		- (만약 끊어버리지 않는다면 Request 객체는 재활용되기 때문에 정보가 섞일 위험이 있음)
 	2. 무상태(stateless) 프로토콜
		- 서버는 클라이언트의 상태를 저장하지 않고 이전에 클라이언트가 무슨 요청을 했던지에 따라 응답이 달라지지 않음
 --%>

	<%
	out.println("당신의 IP 주소 : " + request.getRemoteAddr() + "<br>");
	out.println("당신의 host Name : " + request.getHeader("host") + "<br>");
	out.println("당신의 쿠키 : " + request.getHeader("cookie") + "<br>");
	// 처음에 들어가니 쿠키는 null이네, 두번째 방문부터 생김
	out.println("당신의 servlet 경로 : " + request.getServletPath() + "<br>");
	
	String firstName = request.getParameter("firstName");
	String lastName = request.getParameter("lastName");
	System.out.println(request.getRemoteAddr());
	%>
	
	<h1>결과 페이지</h1>
	<p>제 이름은 <%=firstName + lastName %></p>
	
	
</body>
</html>