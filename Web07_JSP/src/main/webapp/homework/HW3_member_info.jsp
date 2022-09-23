<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HW3 Member</title>
</head>
<body>

	<% request.setCharacterEncoding("UTF-8"); // 한글 인코딩 %>

	<!-- form 데이터를 보냈더니 자동으로 useBean의 MemberVO에 박혔네??????? -->
	<jsp:useBean id="member" class="edu.web.homework.MemberVO"></jsp:useBean> <!-- member라는 객체생성 -->
	<jsp:setProperty property="*" name="member" /> <!-- request.getParameter값을 member객체의 멤버변수에 하나씩 매칭하여 저장 -->
	
	<h1>회원 가입 결과</h1>
	<p>아이디 : <%=member.getUserid() %></p>
	<p>패스워드 : <%=member.getPassword() %></p>
	<p>이메일 : <%=member.getEmail() %></p>
	<p>이메일 수신여부 : <%=member.getEmailArgee() %></p>
	<p>관심사항 : 
	<%if (member.getInterest() != null) {
		for(int i = 0; i < member.getInterest().length; i++) {
			if (i == member.getInterest().length - 1){
			%>	<%=member.getInterest()[i]%>
			<%} else {%>
			<%=member.getInterest()[i]%> ,
			<%}
		}%>
	<!-- 메소드하나로 가능이네... 어이없다... -->
	<%=String.join(" ,", member.getInterest()) %>
	<%} else {
	%>
	없음
	<%
	}
	%></p>
	<p>핸드폰 : <%=member.getPhone() %></p>
	<p>자기소개 : <%=member.getIntroduce() %></p>
	
	<%System.out.println(request.getRemoteAddr());%>
	
</body>
</html>