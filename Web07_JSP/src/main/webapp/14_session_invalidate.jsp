<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Invalidate</title>
</head>
<body>
	<h1>세션 속성(attribute)값 제거 / invalidate(무효화)</h1>

	<%
	// 세션 attribute에 데이터 저장
	session.setAttribute("password", 123);
	session.setAttribute("a", 123);

	// 모든 세션 attribute 출력
	// 다른 페이지를 열면 그 페이지에서 생성된 세션도 출력이 됨.
	// 하지만 만료시간이 되면 소멸되는데, 현재 페이지를 새로고침하면 현재 페이지의 세션이 다시 생성되므로 그것만 남음
	out.println("<h2>처음 세션 목록</h2>");
	Enumeration<String> attrNames = session.getAttributeNames();
	while (attrNames.hasMoreElements()) { // 오홍,, key값의 영어 오름차순으로 정렬되서 출력되네??
		String name = attrNames.nextElement();
		out.println(name + "<br>");
	}

	// 특정 세션 제거 removeAttribute (세션을 아예 없애는거)
	out.println("<h2>userid 속성 제거 후 목록</h2>");
	session.removeAttribute("userid");
	attrNames = session.getAttributeNames();
	while (attrNames.hasMoreElements()) {
		String name = attrNames.nextElement();
		out.println(name + "<br>");
	}

	// 모든 세션 무효화 : 모든 세션 속성을 제거 (세션안의 key-value 값을 없애는것, 즉 null로 만드는거??)
	// ** 위험하니 엥간하면 내가 만든것만 따로 지울것
	out.println("<h2>모든 세션 무효화</h2>");
	session.invalidate();
	// 유효하지 않은 세션 : 세션 속성이 아무것도 없거나 세션이 invalidate된 경우
	// java.lang.IllegalStateException: getAttributeNames: 세션이 이미 무효화되었습니다.
	// 제거하면 오류가 안나는데 무효화하면 오류가 나네
	// 현재 세션이 유효(valid)한 지 체크
	if (request.isRequestedSessionIdValid()) {
		out.println("유효한 세션<br>");
	} else {
		out.println("유효하지 않은 세션<br>");
	}
	%>
</body>
</html>