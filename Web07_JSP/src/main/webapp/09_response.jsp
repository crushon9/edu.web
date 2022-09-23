<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Response</title>
</head>
<body>
	<!-- 
	Response : HttpServletResponse 클래스 객체와 대응
	- HTTP 요청에 대응하는(보내는) 정보를 저장하는 객체
	
	**정보자체가 저장되는거야? 아니면 정보는 어딘가에 있고 그 참조값을 저장하는거야?
 -->

	<h2>헤더 새로고침 예제</h2>

	<%
	// 페이지 새로고침 방법
	// header에 Refresh를 set
	response.setIntHeader("Refresh", 2); // 2초 간격으로 새로고침

	Calendar calendar = new GregorianCalendar();

	String am_pm;
	int hour = calendar.get(Calendar.HOUR);
	int minute = calendar.get(Calendar.MINUTE);
	int second = calendar.get(Calendar.SECOND);

	if (calendar.get(Calendar.AM_PM) == 0) {
		am_pm = "AM";
	} else {
		am_pm = "PM";
	}

	String currentTime = hour + ":" + minute + ":" + second + " " + am_pm;
	out.println("현재시간 : " + currentTime + "<br>");
	%>
</body>
</html>