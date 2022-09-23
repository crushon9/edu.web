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
		// session에서 전송받은 userid를 가져옴
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("userid");
		if (userid != null) {
			// member-result.jsp의 버튼에서 전송받은 userid를 이용하여 DB에 회원정보 삭제
			int result = dao.delete(userid);
			System.out.println("회원탈퇴 결과 : " + result);
			// 삭제 후에 세션제거 후 login.jsp 페이지 이동
			if (result == 1) { // 성공
				session.removeAttribute("userid");
				request.setAttribute("deleteResult", "success");
				RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
				dispatcher.forward(request, response);
			} else { // 실패
				request.setAttribute("deleteResult", "fail");
				RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
				dispatcher.forward(request, response);
			}
		} else { // 세션이 만료되어 접근했을때 예외처리
			request.setAttribute("sessionInvalid", "fail");
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}

	}
}
