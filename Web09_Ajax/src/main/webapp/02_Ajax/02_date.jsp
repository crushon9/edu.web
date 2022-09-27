<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! Date date = new Date(); %> <!-- 버튼 누른순간 객체생성하여 output으로 보내짐 -->
<p>오늘 날짜 : <%=date.toString() %></p>
<p>${param.method }</p> <!-- post로 보내도 파라미터는 있네? -->
<p>${param.content }</p>