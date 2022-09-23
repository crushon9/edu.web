<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Hit Count</title>
</head>
<body>
	<%
	// application 객체는 서버가 재시작할 때 초기화
	// 브라우저를 껐다켜도 초기화 되지 않음
	Integer hitsCount = (Integer) application.getAttribute("hitCounter"); // 리턴타입 object, 없는 Attribute를 get하면 null을 리턴함
	if (hitsCount == null) { // 아직 생성되지 않은상태
		out.println("첫방문을 환영합니다");
		hitsCount = 1;
	} else {
		out.println("재방문을 환영합니다");
		hitsCount += 1;
	}
	application.setAttribute("hitCounter", hitsCount); // 생성
	%>
	<p>전체방문횟수 : <%=hitsCount %></p>
</body>
</html>