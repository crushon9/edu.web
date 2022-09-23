package edu.web.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/delete.do")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static MemberDAO dao;

	public DeleteServlet() {
		dao = MemberDAOImple.getInstance();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("userid") != null) {
			// member-result.jsp의 버튼에서 전송받은 userid를 이용하여 DB에 회원정보 삭제
			String userid = request.getParameter("userid");
			int result = dao.delete(userid);
			System.out.println("회원탈퇴 결과 : " + result);
			// 삭제 후에 login.jsp 페이지 이동
			if (result == 1) { // 성공
				HttpSession session = request.getSession();
				session.removeAttribute("userid");
				request.setAttribute("deleteResult", "success");
				RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
				dispatcher.forward(request, response);
			} else { // 실패
				request.setAttribute("deleteResult", "fail");
				RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
				dispatcher.forward(request, response);
			}
		} else { // URL로 바로 접근했을때 예외처리
			request.setAttribute("wrongApproach", "fail");
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}

	}
}
