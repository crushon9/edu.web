package edu.web.servlet05;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 아래는 서버의 내용을 클라이언트에게 보내주는 내용
@WebServlet("/Send")
public class SendToClientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SendToClientServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// * request.setAttribute / request.getAttribute
		// 데이터를 key-value 형식으로 전송하는 방식
		// 문자열 뿐만 아니라, 다양한 변수 및 객체를 전송할 수 있음

		// [ parameter 와 attribute 의 차이점 ]
		// ** parameter
		// parameter는 client의 html form 태그를 통해 sever로 데이터 전송
		// parameter는 String 형태로 값을 전송
		// ************************(form 외의 위치에서 데이터 추가 불가능)*개중요
		// parameter : client(form) -> sever (O)
		//				sever -> client (X : 하지만 예외로 forward 방식은 받은 request를 값변경없이 그대로 client로 보냄)
		// parameter는 set함수 없이 get함수만 있음
		// ** attribute
		// attribute는 client / sever에서 생성하여 전송 가능
		// attribute는 문자열 뿐만 아니라, 다양한 변수 타입 및 참조 타입 전송 가능
		// attribute는 sever -> client (O)
		// attribute는 get, set 함수 모두 있음

		// setAttribute(key:string, value:object) 고로 value:object 형변환을 신경써야함
		request.setAttribute("name", "고길동");
		request.setAttribute("lived", "서울 쌍문동");
		request.setAttribute("age", 40);
		// 근데 위처럼 따로 보내면 변수이름오타 확률이 있으니 그냥 object형태 묶어서 VO로 보내는게 나음
		InfoVO vo = new InfoVO("둘리", "서울 쌍문동", 1000);
		request.setAttribute("vo", vo);

		ServletContext context = getServletContext();
		RequestDispatcher dispatcher = context.getRequestDispatcher("/my_info.jsp");
		dispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}