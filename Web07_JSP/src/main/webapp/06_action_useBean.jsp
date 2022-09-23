<%@page import="edu.web.jsp01.TestBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP useBean</title>
</head>
<body>
	<%-- 
	* JSP:useBean
	- 특정 클래스 객체(object)를 쉽게 사용하기 위한 태그
	- 기본 타입
		<jsp:useBean id="name" class="package.classname.java" scope="미지정시 page"/>
		<jsp:setProperty>
		<jsp:getProperty>
	- 속성(attributes)
		id : 빈의 이름
		class : 빈으로 사용될 클래스 위치
		scope : 빈이 사용될 범위
		property : 빈의 각 속성 이름(생성된 클래스의 변수 이름과 일치해야 함)
		value : property에 들어갈 값(데이터)
	- 범위(scope)
		page : 생성된 페이지 내에서 사용 가능 (지정하지 않은 경우 default)
		request : 요청된 페이지 내에서 사용 가능
		session : 웹 브라우저(클라이언트)의 생명 주기 내에서 사용 가능
		application : 웹 어플리케이션의 생명 주기 내에서 사용 가능
	- scope의 포함 관계
		page < request < session < application
		____________________________
		| (Client) --> (Server) |  |
		|_______________________|__|
		Client 또는 Server 각각의 범위 page
		Client, Server 둘다를 아는 범위 request
		웹브라우저가 유지되는동안 session
		서버가 유지되는동안 application
		
	- useBean 규약
		패키지에 속해야한다. defualt package에 있는 클래스는 자바빈이 될 수 없다
		기본 생성자를 가지고 있어야 한다.
		멤버 변수는 private
		getter/setter가 존재하며 public
		
	** new 로 인스턴스를 생성하지 않고 useBean을 쓰는 이유는 scope 기능으로 공유할 수 있기 때문임
	아니면 인스턴스를 귀찮게 여기저기 전달해줘야함
 --%>

	<h1>JSP:useBean</h1>
	<jsp:useBean id="test" class="edu.web.jsp01.TestBean" />
	<!-- 생성자를 불러오면서 인스턴스를 생성하네...? 생성된 인스턴스는 id로 접근가능함-->
	<%-- TestBean test = new TestBean(); 인스턴스 이름이 'test'로 동일하기 때문에 생성불가--%> 
	
	<%-- useBean 사용 방법1 --%>
	<!-- name: id값과 일치, property: 클래스 변수명과 일치, value: 적용할 값 -->
	<p>초기 msg 값 출력 : <jsp:getProperty name="test" property="msg" /></p>
	<jsp:setProperty name="test" property="msg" value="jsp:setProperty로 msg값 변경!" />
	<p>변경된 msg 값 출력 : <jsp:getProperty name="test" property="msg" /></p>
	
	<%-- useBean 사용 방법2 : getter/setter 이용 --%>
	<%test.setMsg("getter/setter 변경~"); %> <!-- 세미콜론을 써야함 여러문장 가능-->
	<p>변경된 msg 값 출력 : <%=test.getMsg() %></p> <!-- 세미콜론을 쓰지않고 한문장만 가능 -->
	
	<%-- useBean 사용 방법3 : EL 표기법 사용 --%>
	${test.msg}
	<br>
	${test.msg = "EL 표기법 사용"}
	
	
</body>
</html>