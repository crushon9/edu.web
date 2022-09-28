package edu.web.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

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
		String obj = request.getParameter("obj"); // JSON데이터의 타입은 String
		System.out.println("파싱전 obj : " + obj);

		// * json 라이브러리 다운로드
		// https://code.google.com/archive/p/json-simple/downloads
		JSONParser parser = new JSONParser();
		try {
			JSONObject jsonObj = (JSONObject) parser.parse(obj);
			System.out.println("파싱후 jsonObj : " + jsonObj);

			String userid = (String) jsonObj.get("userid");
			String password = (String) jsonObj.get("password");
			System.out.println(userid);
			System.out.println(password);

			if (userid.equals("test") && password.equals("1234")) {
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				out.append("로그인성공"); // success : function의 result로 들어감
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

}
