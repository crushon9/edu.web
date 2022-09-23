<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>적금 계산기_result</title>
</head>
<body>
<%
	int inputMoney = Integer.parseInt(request.getParameter("inputMoney"));
	int period = Integer.parseInt(request.getParameter("period"));
	double interest = Double.parseDouble(request.getParameter("interest"));

	int totalInputMoney = inputMoney * period;
	double totalInterest = totalInputMoney * interest / 100;
	double totalReceiveMoney = totalInterest + totalInputMoney;

	DecimalFormat df = new DecimalFormat("₩###,###,###");
	%>

	<h1>적금 계산기 결과</h1>
	<p>월 적금액 : <%=df.format(inputMoney) %></p>
	<p>적금기간 : <%=period %></p>
	<p>년 이자율 : <%=interest %></p>
	<hr>
	<p>총 납입 금액 : <%=df.format(totalInputMoney) %></p>
	<p>발생 이자 : <%=df.format(totalInterest) %></p>
	<p>총 수령 액 : <%=df.format(totalReceiveMoney) %></p>

</body>
</html>