package edu.web.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/register.do") // URL 설정
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static MemberDAO dao;

	public RegisterServlet() {
		dao = MemberDAOImple.getInstance();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// URL 로 접근할 경우 경로 변경
		response.sendRedirect("/Web07_JSP/18_db_connection.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String emailAgree = request.getParameter("emailAgree");
		String[] interest = request.getParameterValues("interest");
		String phone = request.getParameter("phone");
		String introduce = request.getParameter("introduce");

		MemberVO vo = new MemberVO(userid, password, email, emailAgree, interest, phone, introduce);
		System.out.println(vo);

		int result = dao.insert(vo);
		System.out.println(result);

		if (result == 1) { // DB 저장에 성공하면 다른 페이지에 데이터 전송
			// 요청받은 request에 forwarding 하는 방법 (vo를 front에 전송)
			// RequestDispatcher : 사용자의 원래요청을 다른 서블릿이나 JSP에 전달한다
			RequestDispatcher dispatcher = request.getRequestDispatcher("18_db_result.jsp");
			request.setAttribute("vo", vo);
			dispatcher.forward(request, response);
			
			// 세션으로 클라이언트에 특정 데이터 전송
			HttpSession session = request.getSession();
			session.setAttribute("vo", vo);
			session.setMaxInactiveInterval(60);
			response.sendRedirect("18_db_result.jsp");
		}
	}
 
}
