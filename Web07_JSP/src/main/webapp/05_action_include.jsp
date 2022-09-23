<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag</title>
</head>
<body>
	<%-- 
- JSP 내에서 특정 동작을 하도록 지시하는 태그
- 기본타입
	<jsp:action_name attribute="value" />
- [action_name]의 종류
	include. useBean, setProperty, getProperty, forward, ...
- 공통 attribute
	id, scope
--%>

	<h2>include 액션 태그 예제</h2>
	<jsp:include page="02_syntax.jsp"></jsp:include>

	<!-- 
	* jsp:include
	- 포함된 jsp 파일을 요청할 때마다 페이지를 수행(동적)
	- 별도의 파일에 대한 요청을 처리할 때 사용(예시 - 로그인 했을 때 특정 레이아웃만 변경하도록)
	- 레이아웃의 일부분을 모듈화 할때 사용(화면을 나누는 점에서 directive:include와 용도가 같음)
	- 중요** 포함된jsp 파일의 변수를 사용할 수 없음
	 -->


</body>
</html>