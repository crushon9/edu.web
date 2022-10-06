package edu.web.servlet04;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 사용자에게 데이터를 입력받아오는 내용
// info.html (form으로 데이터를 입력받아서 보냄)-> /forward (여기서 html 문서를 작성하기 귀찮으니깐 데이터만 보냄)-> result.jsp
@WebServlet("/forward")
public class ForwardTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String CLASSNAME = ForwardTestServlet.class.getName();

	public ForwardTestServlet() {
	}

	// forward : URL 주소 유지. request/response 객체 유지 (그럼 그냥 페이지 이동하면 객체는 초기화 된단거네?)
	// 근데 forward방식은 왜 URL이 바뀌지 않고 유지되는 걸까? 왜냐면 서버내부의 동작으로 응답을 하기때문에 클라이언트는 알지못함
	// 포워딩은 외부에 직접 정보가 공개되지 않아야 하는 경우 유용하다
	// 반면 리다이렉트는 re-direct 서버가 클라이언트에서 다른 페이지에 다시 요청하라고 지시를 내리고(300번응답), 클라이언트는 다른페이지에 요청을 하여 응답(200번응답)받으며 URL이 변경됨
	// 리다이렉트는 DB에 변경이 일어날때 클라이언트가 하나하나 요청하게 함으로서 중복을 막는 케이스에 유용하다
	// 같은 웹 서버 내에 있는 파일들로만 이동이 가능
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 아래 방식은 ForwardTestServlet에서 request 받아서 확인용으로 포장을 풀어봄
		System.out.println(CLASSNAME + "doGet() 호출");
		String name = request.getParameter("name"); // getParameter("name") html name=""와 동일하게 할것
		int age = Integer.parseInt(request.getParameter("age")); // getParameter 메소드의 리턴타입은 String이니 parseInt
		String email = request.getParameter("email");
		int money = Integer.parseInt(request.getParameter("money"));

		System.out.println("이름 : " + name + ", 나이 : " + age + ", 이메일 : " + email + ", 재산 : " + money);
		// ----------------------------------------------------
		// 여기서는 request를 보내기주기만 함 (info.html -> ForwardTestServlet.java(/forward) -> result.jsp)
		// html은 데이터를 읽어오는 동적 기능이 없기 때문에 jsp로 데이터를 받아와야 함

		// forward 방식에서 페이지를 이동할 때는
		// RequestDispatcher 인터페이스의 forward(request, response) 메소드를 사용. URL이 변경되지 않고 이동함
		// http://localhost:8080/Web06_Servlet/forward?name=1&age=1&email=1%40w&money=1
		// 즉 forward 방식은 URL에 result.jsp가 아니라 /forward 로 유지
		ServletContext context = this.getServletContext();
		// getServletContext()메소드는 어느 인스턴스소속일까? this 소속임. this는 뭐지? ServletContext의 인스턴스인가?
		RequestDispatcher dispatcher = context.getRequestDispatcher("/result.jsp");
		// context는 scope개념에서 어플리케이션을 주고받는애(=광역택배), request(=지역택배)
		// request 객체를 jsp로 전달
		dispatcher.forward(request, response);
		// result.jsp에 request 객체를 전달하고
		// 전달받은 request에서 parameter를 꺼내는 방식
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(CLASSNAME + "doPost() 호출");
	}

}
