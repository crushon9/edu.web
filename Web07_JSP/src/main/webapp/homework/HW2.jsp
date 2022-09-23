<%@page import="edu.web.homework.ContactVO"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}
</style>
<meta charset="UTF-8">
<title>HW2 과제</title>
<%!ArrayList<ContactVO> list;%>
<!-- 이 위치는 서버가 생성될때 한번 만들어지고, 계속 유지됨
	즉 ArrayList 를 여기서 new로 생성하면 기존 데이터가 초기화 되지 않고 누적됨-->
</head>
<body>
	<!-- 
	1. 이름, 연락처, 이메일을 변수로 갖는 ContactVO.java를 생성
	(위치 : src/edu.web.homework/ContactVO.java) 
	2. HW2.jsp 파일
	- ArrayList<ContactVO>를 선언하고 객체 생성
	- 임의로 3~5개의 데이터를 생성하여 ArrayList에 모두 저장
	- ArrayList에 저장된 데이터를 반복문과 <table> 태그를 이용하여 출력
	-->

	<!-- 같은 프로젝트 내에 있다면 java파일과 jsp파일은 서로 import하여 공유할 수 있다 -->
	<%
	list = new ArrayList<>();
	list.add(new ContactVO("랄라", "000-0000", "mail1@eee"));
	list.add(new ContactVO("룰루", "111-0000", "mail2@eee"));
	list.add(new ContactVO("하하", "000-2222", "mail3@eee"));
	%>

	<table>
		<thead>
			<tr>
				<th>이름</th>
				<th>전화번호</th>
				<th>이메일</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (int i = 0; i < list.size(); i++) {
			%>
			<tr>
				<td><%=list.get(i).getName()%></td>
				<td><%=list.get(i).getPhone()%></td>
				<td><%=list.get(i).getEmail()%></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>

</body>
</html>