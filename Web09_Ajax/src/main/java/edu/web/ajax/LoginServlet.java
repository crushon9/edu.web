package edu.web.ajax;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//	 [클라이언트JSP] ================> [서버Servlet]
//	JavaScript 데이터					JSON 데이터(String)
//	  ↓ parse ↓					      ↓ parse ↓
//	JSON 데이터(String)				Java 데이터(다른언어가능)
//	
//	 [서버Servlet] =================> [클라이언트JSP]
//	Java 데이터(다른언어가능)			JSON 데이터(String)
//	  ↓ parse ↓						  ↓ parse ↓
//	JSON 데이터(String)				JavaScript 데이터

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// * json 라이브러리 다운로드
		// https://code.google.com/archive/p/json-simple/downloads
		
		String obj = request.getParameter("obj"); // JSON데이터의 타입은 String
		System.out.println(obj);
		
	}

}
