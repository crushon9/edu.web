<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Update</title>
</head>
<body>
	<%/* 세션만료 예외처리 */
	String userid = (String) session.getAttribute("userid");
	if (userid == null) {
		out.print("<script>alert('세션이 유효하지 않습니다');</script>");
		out.print("<script>location.href='login.jsp'</script>");
		return;
	}
	%>
	
	<h2>회원 정보 수정</h2>
  <form action="update.do" method="post">
	<!-- 아이디를 변경하지 못하도록 input 태그 readonly 설정 action="update.do" -->
    <p>아이디</p>
    <input type="text" name="userid" value="<%=userid %>" readonly style="border: solid 2px red;">
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