<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session</title>
<%
	// session 객체 : seeeion 범위에 존재하는 객체
	
	// 세션 생성 시간 - 브라우저를 껐다키면 세션이 새로생성됨
	Date createTime = new Date(session.getCreationTime());
	
	// 이 웹페이지의 마지막 접속 시간 - 새로고침을하면 생성세션은 그대로이고, 마지막접속시간만 변화
	Date lastAccessTime = new Date(session.getLastAccessedTime());
	
	// 세션 유지 시간 설정 방법1
	// ** 모든 세션에 다 적용됨 ****** 앞에 접근자가 세션 개별의 객체가 아니라 session인 걸보면 개별 적용이 안된다고 알수있지
	session.setMaxInactiveInterval(10); // 10초 (만료전 새로고침하면 다시 10초로 늘어남)
	// 은행사이트 생각해보면, 사용안하고 가만히 두면 만료되고 계속 사용하면 로그인 유지시간 늘어나자나
	
	// 세션 유지 시간 설정 방법2
	// - web.xml 설정
	/* 
	<session-config>
	<session-timeout>10</session-timeout> // 분단위
	</session-config>
	*/
	
	// 세션에 key-value 저장하기 : setAttribute(String name, Object value)
	session.setAttribute("userid", "운영자");

%>
</head>
<body>
	<!-- 
	* HTTP 특성
	- connectionless : 클라이언트가 요청을 한 후 응답을 받으면 연결을 끊는 특성
	- stateless : 통신이 끝나면 상태를 유지하지 않는 특성
	- 쿠키와 세션은 HTTP 특성이 아닌 연결 상태를 유지하기 위해 사용
	
	* 세션(session)
	- 쿠키를 기반으로 사용
	- 서버 측에서 데이터를 관리
	- 세션 ID를 부여하여 브라우저를 종료할 때까지 데이터를 유지
	- 세션 객체 : 사용자를 식별할 수 있는 방법을 제공
	 1) 특정 페이지의 요청
	 2) 웹 사이트 방문 카운트
	 3) 사용자에 대한 정보 저장
	- 주의사항 : 세션은 현재 프로젝트(클라이언트)에 실행되는 모든 웹페이지에 적용됨
	 	따라서, 하나의 클라이언트에 세션을 많이 사용하면 충돌이 발생할 수 있음
	- session 객체는 session의 메소드를 사용하면 생성됨 (예:session.setAttribute())
 -->
	<h2>세션 아이디 : <%= session.getId() %></h2>
	<h2>세션 생성시간 : <%= createTime %></h2>
	<h2>마지막 접속 시간 : <%= lastAccessTime %></h2>
	<a href="13_session_test.jsp">13_session_test.jsp 페이지 이동</a>
	
</body>
</html>