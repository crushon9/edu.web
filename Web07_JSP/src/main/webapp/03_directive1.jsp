<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 이게 없어지면 그냥 HTML이 되는거야.. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directive</title>
</head>
<body>
	<%-- 
* Directive (지시자)
- 기본타입
	<%@ directive attribute="value" %>
- directive 이름
	<%@ page .. %>
	<%@ include .. %>
	<%@ taglib .. %>
- 속성(attribute) 종류
	contentType
	errorPage
	extents
	import
	등등
 --%>

	<h1>include directive(지시자)</h1>
	<%-- header.jspf 파일을 include --%>
	<%@ include file="03_header.jspf"%> <!-- 정적! -->
	<div>
		<p>본문입니다</p>
		<p><%=header%></p> <!-- 03_header.jspf 의 변수를 사용할 수 있음 -->
	</div>
	<%@ include file="03_footer.jspf"%>
	<%-- 
	* directive include 특징
	1. JSP 파일이 자바 파일로 바뀔 때 문서에 삽입되어 컴파일(정적)
	2. 다수의 JSP 페이지에서 공통으로 사용되는 코드를 작성하는 용도
	3. 중요) 포함되는 jsp 파일에서 선언한 변수들을, 포함하는 jsp 파일에서 사용할 수 있음
	
	 --%>
</body>
</html>