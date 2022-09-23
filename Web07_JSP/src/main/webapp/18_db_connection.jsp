<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	 <h1>회원 가입</h1>
	 <form action="register.do" method="post"> <!-- 보낼경로 -->
	 아이디 <input type="text" name="userid" required="required"><br><br>
	 패스워드 <input type="password" name="password" required="required"><br><br>
	 이메일 <input type="email" name="email" required="required"><br><br>
	 이메일 수신여부 <input type="radio" name="emailAgree" value="예" checked>예
	 <input type="radio" name="emailArgee" value="아니오">아니오<br><br>
	 관심사항 <input type="checkbox" name="interest" value="영화" >영화
	 <input type="checkbox" name="interest" value="음악" >음악
	 <input type="checkbox" name="interest" value="운동" >운동
	 <input type="checkbox" name="interest" value="독서" >독서<br><br>
	 핸드폰 <input type="text" name="phone" required="required"><br><br>
	 자기소개<br> <textarea name="introduce" required="required"></textarea><br><br>
	 <input type="submit" value="전송">
	</form>
</body>
</html>