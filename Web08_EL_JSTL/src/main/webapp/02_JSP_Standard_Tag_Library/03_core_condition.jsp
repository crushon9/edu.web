<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL if</title>
</head>
<body>
	<%-- 
		* <c:if> 태그
		- 자바의 if문과 유사한 기능
		- <c:if test="조건">실행문</c:if>
 	--%>

	<c:if test="true">
		<h2>항상실행</h2>
	</c:if>
	<c:if test="false">
		<h2>실행안됨</h2>
	</c:if>
	<c:if test="${param.name == 'test' }">
		<p>결과 값이 true</p>
		<p>파라미터 name의 값은 'test'</p>
	</c:if>
	
	
</body>
</html>