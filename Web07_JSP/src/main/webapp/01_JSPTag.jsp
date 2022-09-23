<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Tag</title>
</head>
<body>
	<!-- 
	* JSP(Java Server Page)
	HTML 파일 안에 자바 코드를 포함하여 웹 서버에서 동적으로 웹 페이지를 생성하여 브라우저로 리턴해주는 언어
	런타임 시에 JSP파일(.jsp)이 자바파일(.java)로 변환됨 -> 서블릿 클래스를 의미
	HTML 표준을 지키기 때문에 디자인이 편함
	즉 서블릿(서버), JSP(클라이언트) 둘 다 런타임은 자바(서블릿 클래스)로 실행됨
 -->
 <!-- 그니깐 html파일안에 script태그-자바스크립트, style태그-css 를 담아서 프론트를 만들고
 서블릿으로 정보를 전달받고 넘겨주고
 그 결과페이지를 클라이언트에게 돌려줄때 jsp파일로 돌려주는거.. 맞음??  -->

	<%-- 
	* JSP 구성 요소
	1. <%@ %> : Directive(지시자)
		JSP 페이지 전체에 적용하는 속성들을 설정(import, page, charEncoding 등)
	2. <%! %> : Declaration(선언문)
		멤버변수, 메소드, 내부클래스를 선언하는 부분
	3. <% %> : Scriptlet(스크립틀릿)
		메소드(_jspService) 내부에서 실행되는 자바 코드를 작성하는 부분 (즉 서블릿의 doGet doPost처럼 데이터가 왔다갔다하는 공간)
	4. <%= %> : Expression(표현식)
		변수의 값, 메소드의 리턴값 등을 HTML에 출력
	5. <%-- : Comment(주석)
		JSP 주석은 서블릿 클래스로 변환될 때 코드로 변환되지 않음(읽지못함) --%>

	<%-- Declaration(선언문) 여기에 선언하면 클래스에 바로 멤버메소드를 만든것과 같은것인데,
	사실 jsp는 받아온 데이터를 출력하는 역할만 할뿐 여기서 데이터를 가공할 필요가 없음--%>
	<%!public int add(int x, int y) {
		return x + y;
	}%>

	<%-- Scriptlet(스크립틀릿) 데이터를 표현하는 위치--%>
	<%
	// 지역변수 선언
	int result = add(20, 30);
	// JSP에서 출력 방법
	// 1) console 로그
	System.out.println("result = " + result);

	// 2) JspWriter 객체를 사용하여 응답(response)으로 출력
	out.write("<p>result = " + result + "</p>\r\n");
	%>
	
	<%-- Expression(표현식) --%>
	<p>결과 = <%=result %></p>
	<% Date date = new Date(); %>
	<p><%=date %></p>

</body>
</html>