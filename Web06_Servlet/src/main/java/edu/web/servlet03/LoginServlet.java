package edu.web.servlet03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 클라이언트 -> request -> 요청에 대한 처리 -> response
@WebServlet("/loginTest")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String CLASSNAME = LoginServlet.class.getName();

	public LoginServlet() {
	}

	// get, post 방식 모두 스트링형태로 파라미터 전달됨
	// doGet() : form method = "GET" 방식으로 전송할 경우 doGet()으로 수신
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 요청 파라미터(request parameter)의 값을 읽는 방식
		// GET 방식에서 요청 파라미터는 URL 주소의 query string에 포함되어 있음
		// 브라우저 -> F12 -> Network -> 생성된 주소로 확인 가능, payload에서도 확인 가능
		// Request URL:
		// http://localhost:8080/Web06_Servlet/loginTest?userid=1&password=1
		// URL해석 :
		// http(참고사항https는보안), localhost(=서버주소,도메인), 8080(=포트번호)/
		// Web06_Servlet(=context root 서버에서 파일을 찾아갈 최초 경로)
		// loginTest(=서블렛경로, url pattern)
		// ?userid=1&password=1(=쿼리스트링 ?로 시작하고 파라미터를 &로 연결함)
		System.out.println(CLASSNAME + "doGet() 호출");
		login(request, response);
	}

	// doPost() : form method = "POST" 방식으로 전송할 경우 doPost()으로 수신
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(CLASSNAME + "doPost() 호출");
		login(request, response);
	}

	// throws 는 메소드를 호출한곳에 예외처리를 떠넘김
	// HttpServletRequest : 요청한 HTTP 의 객체(ip주소, 파라미터 등)을 저장하는 클래스
	// HttpServletResponse : HTTP 요청에 대응하는(보내는) 정보를 저장하는 클래스 (DB에 result같은거구나)
	// * 중요 : request 와 response의 객체를 생성하고 호출하는 역할은 서버에서 컨트롤
	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 브라우저에서 받은 데이터를 꺼내는 방식
		String ip = request.getRemoteAddr(); // 요청한 HTTP의 IP주소를 얻어옴
		System.out.println(ip);
		// 요청 파라미터(request parameter)의 값을 읽어옴
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		System.out.println("아이디 : " + userid);
		System.out.println("비밀번호 : " + password);

		// 요청에 대응하는 response 데이터 인코딩 UTF-8 설정 (한글깨짐 방지)
		response.setCharacterEncoding("UTF-8");
		// 새로운 페이지를 생성하는 방식
		// printWriter 클래스
		// HTML 페이지를 생성해주는 클래스
		PrintWriter out = response.getWriter();
		out.append("<!DOCTYPE html>").append("<head><meta charset='UTF-8'></head>").append("<body>")
				.append("<h1>로그인 결과 페이지</h1>").append("아이디 : " + userid + "<br>").append("비밀번호 : " + password + "<br>")
				.append("</body>").append("</html>");
	}

}
