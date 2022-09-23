<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
	<%--
	1. HW3.jsp 파일
	- 회원 가입 form 만들기
	- post 방식
	- action="HW3_member_info.jsp"
	- 아이디(text) : name="userid"
	- 패스워드(password) : name="password"
	- 이메일(email) : name="email"
	- 이메일 수신여부(radio 버튼) : name="emailArgee"
	- 관심사항(checkbox, 4개이상) : name="interest"
	- 핸드폰(text) : name="phone"
	- 자기소개(<textarea>) : name="introduce"
	- 전송버튼(submit)
	
	2. MemberVO.java 파일
	- jsp:useBean 사용
	- src.edu.web.homework 패키지에 MemberVO.java 클래스 생성
	(변수는 위의 아이디, 패스워드 등과 개수 및 변수명 매칭)
	- * MemberVO 기본 생성자 및 매개변수 생성자, getter/setter 무조건 생성
	- * String[] interest; (관심사항은 배열로 변수 선언)
	
	3. HW3_member_info.jsp 파일
	- HW3에서 전송받은 데이터를 출력
	- request.getParameter or request.getParamaterValues를 사용하지 않고 구현
	- 아래 코드를 추가하면 해결됨
	 <jsp:useBean id="member" class="edu.web.homework.MemberVO.java"></jsp:useBean>
	 <jsp:setProperty property="*" name="member" />
	- property="*" 의 의미 : HW3.jsp에서 넘어온 모든 parameter 값을 member에 저장
	 --%>
	 
	 <h1>회원 가입</h1>
	 <form action="HW3_member_info.jsp" method="get">
	 아이디 <input type="text" name="userid" required="required"><br><br> <!-- name뒤의 이름은 나중에 getParameter()로 꺼낼때 인식되는 이름임-->
	 패스워드 <input type="password" name="password" required="required"><br><br>
	 이메일 <input type="email" name="email" required="required"><br><br>
	 이메일 수신여부 <input type="radio" name="emailArgee" value="예" checked>예
	 <input type="radio" name="emailArgee" value="아니오">아니오<br><br>
	 관심사항 <input type="checkbox" name="interest" value="영화" >영화
	 <input type="checkbox" name="interest" value="음악" >음악
	 <input type="checkbox" name="interest" value="운동" >운동
	 <input type="checkbox" name="interest" value="독서" >독서<br><br>
	 핸드폰 <input type="text" name="phone" required="required"><br><br>
	 자기소개<br> <textarea name="introduce" required="required"></textarea><br><br>
	 <input type="submit" value="전송">
	</form>

</body>
</html>