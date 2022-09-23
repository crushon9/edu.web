<%@page import="edu.web.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Result</title>
</head>
<body>
	<%
	// DB에서 가져온 vo (SelectServlet에서 !null일때만 여기로 보냄)
	MemberVO vo = (MemberVO) request.getAttribute("vo");
	
	// 수정성공 alert
	String updateResult = (String) request.getAttribute("updateResult");
	if (updateResult == "success") {
		out.print("<script>alert('수정 성공');</script>");
	}
	%>
	<!-- 회원정보 출력 -->
	<h1>회원 정보</h1>
	<p>아이디 : <%=vo.getUserid() %></p>
	<p>패스워드 : <%=vo.getPassword() %></p>
	<p>이메일 : <%=vo.getEmail() %></p>
	<p>이메일 수신여부 : <%=vo.getEmailAgree() %></p>
	<p>관심사항 : <%=vo.getInterestJoin() %></p>
	<p>핸드폰 : <%=vo.getPhone() %></p>
	<p>자기소개 : <%=vo.getIntroduce() %></p>
	<!-- 회원 수정 버튼 -->
	<a href="member-update.jsp"><input type="button" value="정보수정"></a>
	<!-- 회원 탈퇴 버튼 생성 db에서 내용삭제 (탈퇴성공 알림창) -->
	<a href="delete.do"><input type="button" value="회원탈퇴"></a>
	
</body>
</html>