<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<%
	// 쿠키배열에 모든 쿠키를 담음
	Cookie[] cookies = request.getCookies();
	// 일치하는 쿠키가 없을 때 기본 세팅값 "" 
	String id = "";
	String pw = "";
	
	if (cookies != null) {
		for (Cookie ck : cookies) {
			// 반복문 중 현재 ck에 담긴 쿠키의 이름을 원하는 문자열과 비교하여
			if (ck.getName().equals("id")) {
				// 맞으면 String그릇에 쿠키의 value를 담음
				id = ck.getValue();
			} else if (ck.getName().equals("pw")) {
				pw = ck.getValue();
			}
		}
	}
%>
</head>
<body>
	<h1>로그인</h1>	
	<form action="12_cookie_practice_result.jsp" method="post">
	    아이디 <br><input type="text" name="id" placeholder="아이디 입력" value="<%=id%>"><br>
	    비밀번호 <br><input type="password" name="pw" placeholder="비밀번호 입력" value="<%=pw%>"><br>
	    <input type="checkbox" name="isSaveAgreed" value="agreed"> 아이디저장<br><br>
	    <input type="submit" value="로그인">
	</form>

</body>
</html>