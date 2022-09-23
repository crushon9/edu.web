package edu.web.member;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/select.do")
public class SelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static MemberDAO dao;

	public SelectServlet() {
		dao = MemberDAOImple.getInstance();
	}

	// doGet() 메소드에서 처리
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// session에서 전송받은 userid를 가져옴
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("userid");
		if (userid != null) {
			// DB에서 userid에 해당하는 데이터를 select
			MemberVO vo = dao.selectById(userid);
			System.out.println("회원정보조회 결과 : " + vo);

			if (vo != null) { // DB에서 제대로 가져왔다면
				// select 데이터를 member-result.jsp에 전송
				request.setAttribute("vo", vo);
				RequestDispatcher dispatcher = request.getRequestDispatcher("member-result.jsp");
				dispatcher.forward(request, response);
			} else { // DB에서 제대로 못가져왔다면
				request.setAttribute("selectByIdResult", "Fail");
				RequestDispatcher dispatcher = request.getRequestDispatcher("login-result.jsp");
				dispatcher.forward(request, response);
			}
		} else { // 세션이 만료되어 접근했을때 예외처리
			request.setAttribute("sessionInvalid", "fail");
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
	}

}
