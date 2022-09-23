package edu.web.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/update.do")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static MemberDAO dao;

	public UpdateServlet() {
		dao = MemberDAOImple.getInstance();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// URL 로 접근할 경우 경로 변경
		request.setAttribute("wrongApproach", "fail");
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// member-update.jsp에서 전송받은 데이터로 DB 회원정보 수정
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String emailAgree = request.getParameter("emailAgree");
		String[] interest = request.getParameterValues("interest");
		String phone = request.getParameter("phone");
		String introduce = request.getParameter("introduce");
		MemberVO vo = new MemberVO(userid, password, email, emailAgree, interest, phone, introduce);
		int result = dao.update(vo);
		System.out.println("회원정보 수정 정보 : " + vo);
		System.out.println("회원정보 수정 결과 : " + result);

		// DB 정보 수정성공하면 member-result.jsp에 vo 데이터 전송하여 보여주기
		if (result == 1) { // 성공
			request.setAttribute("updateResult", "success");
			request.setAttribute("vo", vo);
			RequestDispatcher dispatcher = request.getRequestDispatcher("member-result.jsp");
			dispatcher.forward(request, response);
		} else { // 실패
			request.setAttribute("updateResult", "fail");
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
	}
}
