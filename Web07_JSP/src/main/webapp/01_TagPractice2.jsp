<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tag 연습 2</title>
</head>
<body>
	<%
	ArrayList<String> list = new ArrayList<>();
	list.add("둘리1");
	list.add("둘리2");
	list.add("둘리3");
	list.add("둘리4");
	%>
	<ul>
		<li><%=list.get(0)%></li>
		<li><%=list.get(1)%></li>
		<li><%=list.get(2)%></li>
		<li><%=list.get(3)%></li>
	</ul>

	<%
	list.remove(0);
	%>

	<ul>
		<li><%=list.get(0)%></li>
		<li><%=list.get(1)%></li>
		<li><%=list.get(2)%></li>
   <!-- <li><%--list.get(3)--%></li> 삭제 했으니 list 길이가 줄어듬--> 
	</ul>

</body>
</html>