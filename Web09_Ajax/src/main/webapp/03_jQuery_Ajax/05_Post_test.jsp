<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 이 공간은 doService() 공간이라서 get/post 둘다 처리가능
String name = request.getParameter("name");
String city = request.getParameter("city");

out.write("[name : " + name + ", city : " + city + "]");
%>
