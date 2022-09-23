<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	
	<!-- 로그인 form 생성. action="login_auth.do" method="post" -->
	<h1>로그인</h1>
	<form action="login_auth.do" method="post">
		<input type="text" name="userid" id="userid" placeholder="아이디" required autofocus><br>
		<input type="password" name="password" id="password" placeholder="비밀번호" required><br>
		<input type="submit" value="로그인">
	</form>
	<!-- <a>태그를 이용하여 member-register.jsp 이동 링크 생성 -->
	<a href="member-register.jsp"><input type="button" value="회원가입"></a>

	<%
	// 다른페이지들의 성공여부를 request에서 가져와 alert
		String insertResult = (String) request.getAttribute("insertResult");
		String insertId = (String) request.getAttribute("insertId");
		String insertPw = (String) request.getAttribute("insertPw");
		if (insertResult == "success") {
			out.print("<script>alert('회원가입 성공~!');</script>");
			out.print("<script>document.getElementById('userid').value = " + insertId + ";</script>");
			out.print("<script>document.getElementById('password').value = " + insertPw + ";</script>");
		}
		String loginResult = (String) request.getAttribute("loginResult");
		if (loginResult == "idFail") {
			out.print("<script>alert('존재하지 않는 아이디 입니다!');</script>");
		} else if (loginResult == "pwFail") {
			out.print("<script>alert('비밀번호를 확인 하세요!');</script>");
		}
		String updateResult = (String) request.getAttribute("updateResult");
		if (updateResult == "fail") {
			out.print("<script>alert('수정 실패');</script>");
		}
		String deleteResult = (String) request.getAttribute("deleteResult");
		if (deleteResult == "success") {
			out.print("<script>alert('삭제 성공!');</script>");
		} else if (deleteResult == "fail") {
			out.print("<script>alert('삭제 실패');</script>");
		}
		String wrongApproach = (String) request.getAttribute("wrongApproach");
		if (wrongApproach == "fail") {
			out.print("<script>alert('잘못된 접근입니다');</script>");
		}
	%>
</body>
</html>