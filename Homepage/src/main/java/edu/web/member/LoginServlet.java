package edu.web.member;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
* 입력받은 아이디,패스워드를 DB의 데이터와 비교해서
* 데이터가 일치하면 - 로그인성공(login-result.jsp)로 이동 및 로그인 세션 생성
* 즉 아이디값에 대한 세션 생성 만료시간 60초 session.setAttribute("userid", 값 ) 비밀번호는 저장ㄴ
* 데이터가 일치하지 않으면 login.jsp이동 (심심하면 alert (아디비번확인)띄우기)
*/
@WebServlet("/login_auth.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static MemberDAO dao;

	public LoginServlet() {
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
		// login.jsp에서 전송받은 데이터를 가져옴
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");

		// DB에서 userid에 해당하는 데이터를 가져옴
		MemberVO vo = dao.selectById(userid);
		System.out.println("로그인정보 : " + vo);
		
		// userid 해당하는 회원정보가 없음
		if (vo == null) {
			request.setAttribute("loginResult", "idFail");
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
			return;
		}

		// 비밀번호 일치여부 검사
		String DBpassword = vo.getPassword();
		if (password.equals(DBpassword)) { // 비밀번호 일치
			// 로그인 세션 생성
			HttpSession session = request.getSession();
			session.setAttribute("userid", userid);
			session.setMaxInactiveInterval(20);
			// login-result.jsp 이동
			RequestDispatcher dispatcher = request.getRequestDispatcher("login-result.jsp");
			dispatcher.forward(request, response);
		} else { // 비밀번호 불일치
			request.setAttribute("loginResult", "pwFail");
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
	}
}
