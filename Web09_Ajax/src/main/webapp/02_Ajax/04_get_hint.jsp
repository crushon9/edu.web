<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String input = request.getParameter("input");
String apple = "apple";
String banana = "banana";
String coconut = "coconut";
String result = "";

if (apple.contains(input) && input.charAt(0) == 'a') {
	result = apple;
} else if (banana.contains(input) && input.charAt(0) == 'b') {
	result = banana;
} else if (coconut.contains(input) && input.charAt(0) == 'c') {
	result = coconut;
} else {
	result = "not fruits";
}
%>

<%=result%>