<%@page import="edu.web.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 결과</title>
</head>
<body>

	<%
	request.setCharacterEncoding("UTF-8"); // 한글 인코딩 
	MemberVO vo = (MemberVO) request.getAttribute("vo");
	// useBean 이랑 저거랑 무슨 차이지?
	// useBean은 getParameter 과정이 생략됨, 즉 request의 name이 같은 vo의 멤버변수에 자동으로 담김
	%>
	
	<h1>회원 가입 결과</h1>
	<p>아이디 : <%=vo.getUserid() %></p>
	<p>패스워드 : <%=vo.getPassword() %></p>
	<p>이메일 : <%=vo.getEmail() %></p>
	<p>이메일 수신여부 : <%=vo.getEmailAgree() %></p>
	<p>관심사항 : <%=vo.getInterestJoin() %></p>
	<p>핸드폰 : <%=vo.getPhone() %></p>
	<p>자기소개 : <%=vo.getIntroduce() %></p>
	
</body>
</html>