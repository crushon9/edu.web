<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<!-- 
	1. 로그인 정보 전송 페이지 (HW4.jsp)
	- <form> 태그 생성
	- id, pw 전송 (action="HW4_login_auth.jsp")
	
	2. 로그인 인증 jsp 생성 (HW4_login_auth.jsp)
	- 전송받은 id, pw를 확인하여 id=="test", pw=="1234"일 경우
	  id, pw 세션을 생성 (만료 시간은 편하게 설정)
	  세션을 생성한 이후에 HW4_login_result.jsp 페이지로 이동
	  페이지 이동 코드
	  -> out.print("<script>location.href='HW4_login_result.jsp'</script>");
	- 전송받은 id, pw가 일치하지 않을 경우, HW4.jsp 페이지로 이동
	
	3. 로그인 결과 jsp 생성 (HW4_login_result.jsp)
	- 세션에서 id값을 꺼내서 출력
	- 만약 url로 직접 접속할 경우 '로그인 해주세요!!'라고 alert를 띄우고
	  HW4.jsp 페이지로 이동시키기
	  alert 띄우는 코드
	  -> out.print("<script>alert('로그인 해주세요!!');</script>");
 -->
 	<h1>로그인</h1>
	<form action="HW4_login_auth.jsp">
	id : <input type="text" name="id"><br>
	pw : <input type="text" name="pw"><br>
	<br><input type="submit" value="전송">
	</form>
	
</body>
</html>