<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Cookie 생성 및 전송</title>
</head>
<body>
	<%
	// * 쿠키(Cookies)
	// - 웹 브라우저가 저장하는 데이터
	// - 필요한 정보를 클라이언트(웹 브라우저)에서 저장
	// - 다양한 정보 추적을 목적으로 데이터가 유지됨
	// - 쿠키 사용자 식별 3단계
	//	 1) 서버 스크립트는 식별 숫자 등 정보를 쿠키에 설정하여 브라우저에 보냄
	//   2) 브라우저는 이 정보를 개인 PC에 저장
	//   3) 다음 접속 때 브라우저에서 웹 서버에 특정 요청을 할 경우, 이 정보를 서버에 전송하고 서버는 정보를 사용자 식별 등의 용도로 사용
	// - 주로 브라우저에서 사용자가 선택한 내용들을 저장 (예. 특정 메시지를 다시 띄우지 않기 등)
	// - 생성된 쿠키 확인 방법 개발자모드에서 Application -> Cookies에서 확인가능
	// *쿠키 또는 세션을 너무 남발해서 생성하면 어디에서 필요한 정보인지 엉킬 위험이 있다 (request로 주고받는게 안전)
	// 주로 세션은 로그인상태정보 유지 등에 쓰임

	request.setCharacterEncoding("UTF-8");
	String firstName = request.getParameter("firstName");
	String lastName = request.getParameter("lastName");
	String expiryTest = request.getParameter("expiryTest");

	// 파라미터 값으로 쿠키 생성 new Cookie(“name”, “value”)
	// 만약 프로젝트가 다른데 서버를 같이 사용하고 있을때 쿠키이름을 실수로 같게 지정해버리면 섞이는 위험 발생
	// 즉, 쿠키는 서버 단위에서 존재하는 애라는 것!
	Cookie firstNameCookie = new Cookie("first_name", firstName);
	Cookie lastNameCookie = new Cookie("last_name", lastName);
	Cookie expiryTestCookie = new Cookie("expiry_Test", expiryTest);
	
	// 만료(expiry) 시간 설정(초단위) : 24시간(60초 * 60분 * 24시간)
	firstNameCookie.setMaxAge(60 * 60 * 24);
	lastNameCookie.setMaxAge(60 * 60 * 24);
	expiryTestCookie.setMaxAge(1); // 오 만료되니깐 아예 목록에서 안보이네?? 삭제되는건가? ㅇㅇ 삭제할려고 0으로 설정하기도한대

	// response.header에 쿠키 추가 (응답에 쿠키를 포함시켜서 클라이언트에게 전송)
	response.addCookie(firstNameCookie);
	response.addCookie(lastNameCookie);
	response.addCookie(expiryTestCookie);
	
	// ContextRoot(Web07_JSP)에서 생성된 쿠키는 기본적으로 이 ContextRoot에서만 사용
	
	%>
</body>
</html>