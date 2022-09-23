<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클라이언트의 요청 속에 있는 (이전에 심어둔) 쿠키 가져오기</title>
</head>
<body>
	<%
	// 클라이언트가 요청함
	// 서버는 응답하면서 응답에 쿠키를 포함시켜 클라이언트에게 전송 response.addCookie(cookie);
	// 다음에 클라이언트가 요청할때(서버의 사이트를 불러올때) 그속의 쿠키를 가져와서 확인 request.getCookies(); - 리턴값 Cookie[] 배열
	// 쿠키들의 배열에서 이름/값의 쌍으로 이루어진 정보 추출 Cookie.getName(), Cookie.getValue()

	// 이 도메인(어플리케이션)과 관련있는 쿠키의 값들(배열) 가져오기
	Cookie[] cookies = request.getCookies(); // arrayList가 아니라 배열이네?

	if (cookies != null) {
		out.println("<h2>모든 쿠키의 이름과 값 찾기</h2>");
		Cookie cookie = null;
		for (int i = 0; i < cookies.length; i++) {
			cookie = cookies[i];
			out.print("name : " + cookie.getName() + " , value : " + cookie.getValue() + "<br>");
		}
	} else {
		out.println("<h2>쿠키를 찾지 못했습니다</h2>");
	}
	%>
</body>
</html>