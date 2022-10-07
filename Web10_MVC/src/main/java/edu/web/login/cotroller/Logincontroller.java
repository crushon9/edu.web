package edu.web.login.cotroller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("*.go")
public class Logincontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Logincontroller() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		controlURI(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		controlURI(request, response);
	}

	private void controlURI(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String requestMethod = request.getMethod();
		System.out.println("호출경로 : " + requestURI + " 호출방식 : " + requestMethod);

		if (requestURI.contains("login")) {
			if (requestMethod.equals("GET")) {
				loginGET(request, response);
			} else if (requestMethod.equals("POST")) {
				loginPOST(request, response);
			}
		} else if (requestURI.contains("logout")) {
			logoutGET(request, response);
		}
	} // end controlURI

	private void loginGET(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("loginGET 호출확인");
		String targetURL = request.getParameter("targetURL");
		if (targetURL != null) {
			HttpSession session = request.getSession();
			session.setAttribute("targetURL", targetURL);
		}
		// RequestDispatcher 없어도 되네???
		request.getRequestDispatcher("/WEB-INF/login/login.jsp").forward(request, response);
	} // end loginGET

	private void loginPOST(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 로그인 버튼을 클릭했을 때 POST
		System.out.println("loginPOST 호출확인");
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");

		// TODO : DB에서 검사하기

		// 로그인 성공시
		if (memberId.equals("1") && memberPw.equals("1")) {
			// memberId 세션생성
			HttpSession session = request.getSession();
			session.setAttribute("memberId", memberId);
			session.setMaxInactiveInterval(600);
			
			// targetURL 세션을 검사
			String targetURLSession = (String) session.getAttribute("targetURL");
			if (targetURLSession != null) { // targetURL 세션이 있다면 글작성페이지로
				// 세션은 사용 후 제거해야함
				session.removeAttribute("targetURL");
				response.sendRedirect(targetURLSession);
			} else { // targetURL 세션이 없다면 메인페이지로
				response.sendRedirect("index.jsp");
			}
		} else { // 로그인 실패시
			PrintWriter out = response.getWriter();
			out.print("<head><meta charset='UTF-8'></head>");
			out.print("<script>alert('로그인 실패')</script>");
			out.print("<script>location.href='login.go';</script>");
		}
	} // end loginPOST

	private void logoutGET(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("logoutGET 호출확인");
		// session은 생성될때 브라우저를 구분하기위해 키값을 클라이언트와 서버에 각각 저장하고
		// 키값이 매칭되면 그뒤에 attribute 이름을 매칭함
		HttpSession session = request.getSession();
		session.removeAttribute("memberId");
		response.sendRedirect("index.jsp");
	} // end logoutGET
}
