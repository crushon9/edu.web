<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
 	<h2>회원 가입하기</h2>
  <form action="03_parameter.jsp" method="post"> <!-- form은 자동으로 parameter방식 (parameter는 get만존재, set없음) -->
    <p>아이디</p>
    <input type="text" name="userid" placeholder="아이디 입력" required="required">
    <p>패스워드</p>
    <input type="password" name="password" placeholder="비밀번호 입력" required="required">
    <p>이메일</p>
    <input type="email" name="email" placeholder="이메일 입력" required="required">
    <p>이메일 수신여부</p>
    <input type="radio" name="emailAgree" value="yes">예
    <input type="radio" name="emailAgree" value="no" checked="checked">아니오
    <p>관심사항</p>
    <input type="checkbox" name="interest" value="운동">운동
    <input type="checkbox" name="interest" value="영화">영화
    <input type="checkbox" name="interest" value="음악">음악
    <input type="checkbox" name="interest" value="독서">독서
	<p>핸드폰</p>
	<input type="text" name="phone" required="required">
    <p>자기소개</p>
    <textarea rows="4" cols="30" name="introduce" placeholder="자기소개 입력" required="required"></textarea>
    <br><input type="submit" value="전송">
  </form>
</body>
</html>