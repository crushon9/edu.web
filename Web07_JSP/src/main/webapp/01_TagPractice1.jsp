<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tag 연습</title>
</head>
<body>

	<%
	int inputMoney = 1000000;
	int period = 24;
	double interest = Double.parseDouble("2.4");

	int totalInputMoney = inputMoney * period;
	double totalInterest = totalInputMoney * interest / 100;
	double totalReceiveMoney = totalInterest + totalInputMoney;

	DecimalFormat df = new DecimalFormat("₩###,###,###");
	%>
	
	<h1>적금 계산</h1>
	<h2>입력받은 정보</h2>
	<p>월금액 : <%=df.format(inputMoney) %></p>
	<p>적금기간 : <%=period %></p>
	<p>년이자 : <%=interest %></p>
	<hr>
	<p>총납입금액 : <%=df.format(totalInputMoney) %></p>
	<p>발생이자 : <%=df.format(totalInterest) %></p>
	<p>총수령액 : <%=df.format(totalReceiveMoney) %></p>
	
</body>
</html>