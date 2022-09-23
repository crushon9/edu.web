<%@page import="java.util.ArrayList"%>
<%@page import="edu.web.member.MemberVO"%>
<%@page import="edu.web.member.MemberDAOImple"%>
<%@page import="edu.web.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Register</title>
</head>
<body>
	
	 <h2>회원 가입하기</h2>
	 <!-- 회원가입 form action="register.do" -->
  <form action="register.do" method="post">
    <p>아이디</p>
    <input type="text" name="userid" id="userid" placeholder="아이디 입력" required="required" onblur="idCheck(this)">
    <div id='idCheckOutput' style="font-style : italic; display: block; height: 20px;"></div>
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
    <br><input type="submit" id="submit" value="전송" disabled="disabled">
  </form>

	<script>
		/* 아이디 중복 체크를 위해서 자바ArrayList로 아이디를 가져온 뒤 자바스크립트배열에 push하여 비교 */
		function idCheck(userid) {
			var idCheckOutput = document.getElementById('idCheckOutput');
			var userid = userid.value;
			console.log(userid);
			var jsArray = new Array();
			<% MemberDAO dao = MemberDAOImple.getInstance();
			ArrayList<String> list = dao.idCheck();
			for (int i = 0; i < list.size(); i++) {
			%>
				jsArray[<%=i%>] = '<%=list.get(i)%>';
			<%
			}
			%>
			var flag = 0;
			for(var i = 0; i < jsArray.length; i++) {
				if (jsArray[i] == userid) {
					idCheckOutput.style.color = 'red';
					idCheckOutput.innerHTML = '중복된 아이디입니다!';
					document.getElementById('submit').disabled = true;
					flag = 1;
					break;
				}
			}
			if (flag == 0 && userid != "") {
				idCheckOutput.style.color = 'blue';
				idCheckOutput.innerHTML = '사용가능한 아이디입니다!';
				document.getElementById('submit').disabled = false;
			} else if (userid == "") {
				idCheckOutput.style.color = 'red';
				idCheckOutput.innerHTML = '아이디를 입력해주세요';
				document.getElementById('submit').disabled = true;
			}
		}
	</script>
	
	<%
	// 회원가입 실패 alert
	String insertResult = (String) request.getAttribute("insertResult");
	if (insertResult == "fail") {
		out.print("<script>alert('회원가입 실패!');</script>");
	}
	%>

</body>
</html>