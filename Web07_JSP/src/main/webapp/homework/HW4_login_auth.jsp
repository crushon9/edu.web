<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Auth</title>
</head>
<body>

	<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	if (id.equals("test") && pw.equals("1234")) {
		session.setAttribute("idSession", id);
		session.setAttribute("pwSession", pw);
		session.setMaxInactiveInterval(100);
		out.print("<script>location.href='HW4_login_result.jsp'</script>");

	} else {
		out.print("<script>location.href='HW4.jsp'</script>");
	}
	%>

</body>
</html>