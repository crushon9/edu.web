<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>result</title>
</head>
<body>
	<%
	int flag = 0;
	Enumeration<String> attrNames = session.getAttributeNames();
	while (attrNames.hasMoreElements()) {
		String name = attrNames.nextElement();
		if (name.equals("idSession")) {
			flag = 1;
			break;
		}
	}

	if (flag == 1) {
		String idAuth = (String) session.getAttribute("idSession");
		out.println("<h2>" + idAuth + "님, 환영합니다.</h2>");
	} else {
		out.print("<script>alert('로그인 해주세요!!');</script>");
		out.print("<script>location.href='HW4.jsp'</script>");
	}
	%>

</body>
</html>