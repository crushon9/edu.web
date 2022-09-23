<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>적금 계산기</title>
</head>
<body>
	<h1>적금 계산기</h1>
	<!-- 
	JSP 파일 생성 (적금계산 결과 페이지)
	1. 월 적금액, 기간, 이자율을 전송하는 form 만들기(HW1.jsp)
	- <form action="HW1_result.jsp" method="get">
	2. 월 적금액, 기간, 이자율을 전송받아 계산하여 출력하는 jsp 파일 만들기(HW1_result.jsp)
	 -->
	<form action="HW1_result.jsp" method="get"> <!-- action뒤는 URL주소임 -->
		<input type="number" name="inputMoney" placeholder="월적금액"><br>
		<input type="number" name="period" placeholder="기간"><br>
		<input type="number" name="interest" step="0.01" placeholder="이자율"><br>
		<input type="submit" value="제출">
	</form>
	
	

</body>
</html>