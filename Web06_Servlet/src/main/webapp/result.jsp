<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>result</title>
</head>
<body>
	<!-- <% %> : html 내부에 자바를 쓸수있도록 해주는 태그 -->
	<%
	// request : forward()에서 넘겨받은 request 객체
	// request 안에는 파라미터가 포장되어 담겨있음
	String name = request.getParameter("name"); // html name=""와 동일
	int age = Integer.parseInt(request.getParameter("age")); // getParameter 메소드의 리턴타입은 String
	String email = request.getParameter("email");
	int money = Integer.parseInt(request.getParameter("money"));
	%>

	<h1>결과 페이지</h1>
	<p>제 이름은 : <%=name%></p> <!-- 단락이 다른곳에서 선언한 변수도 인식을하네? jsp파일단위로 인식하나봄 -->
	<p>제 나이는 : <%=age%></p>
	<p>제 이메일은 : <%=email%></p>
	<p>제 재산은 : <%=money%></p>
</body>
</html>
	<!-- 이 페이지는 두번 호출되는데, -->
	<!-- 1. ForwardTestServlet.java의 doGet()메소드에서
	dispatcher.forward(request, response); 이 페이지로 request 와 response를 넘겨줌
	즉 서버단에서 내부적으로 객체를 넘기며 이 페이지를 클라이언트에게 응답하는 것임 -->
	<!-- 2. RedirectServlet.java의 doGet()메소드에서
	response.sendRedirect(location); 즉 클라이언트에게 이 정보로 다시 요청하라 라고 응답하고
	 클라이언트는 다시 요청하여 서버가 이 페이지를 다시 응답하는 것임-->
	