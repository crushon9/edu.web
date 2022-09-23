package edu.web.member;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register.do") // URL 설정하기
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static MemberDAO dao;

	public RegisterServlet() {
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
		// member-register.jsp에서 전송받은 데이터를 DB에 저장
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String emailAgree = request.getParameter("emailAgree");
		String[] interest = request.getParameterValues("interest"); // 여러개의 데이터를 배열로 넣는 메소드 getParameterValues
		String phone = request.getParameter("phone");
		String introduce = request.getParameter("introduce");
		MemberVO vo = new MemberVO(userid, password, email, emailAgree, interest, phone, introduce);
		int result = dao.insert(vo);
		System.out.println("회원가입 정보 : " + vo);
		System.out.println("회원가입 결과 : " + result);

		// DB 저장 후에 login.jsp로 이동 (심심하면 alert도 띄워보고)
		if (result == 1) { // 성공하면 로그인 페이지로이동하며 성공여부를 request에 실어보냄
			request.setAttribute("insertResult", "success");
			request.setAttribute("insertId", userid);
			request.setAttribute("insertPw", password);
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		} else { // 나머지 실패했을때
			request.setAttribute("insertResult", "fail");
			RequestDispatcher dispatcher = request.getRequestDispatcher("member-register.jsp");
			dispatcher.forward(request, response);
		}
	}

}
