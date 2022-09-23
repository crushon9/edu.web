package edu.web.servlet02;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LifeCycleServlet
 */
@WebServlet(urlPatterns = "/LifeCycleServlet", loadOnStartup = 1)
// loadOnStartup
// 서버가 실행될 때 서블릿 인스턴스를 메모리에 로드하는 우선순위를 설정
// 숫자가 작을수록 init() 함수가 실행되는 순서가 빠름

public class LifeCycleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// 이렇게 하는 이유는 문자열로 그냥하면 나중에 컨트롤쉬프트알로 바꿀때 인식이 안되잖아
	private static final String CLASSNAME = LifeCycleServlet.class.getName();

	public LifeCycleServlet() {
		System.out.println(CLASSNAME + " : LifeCycleServlet 생성자 호출");
		// 서버 시작할때 생성, 피자도우를 미리 준비하여 올려놓음
	}

	// init() : servlet이 시작될 때 호출되는 생명 주기 메소드
	@Override
	public void init() throws ServletException {
		System.out.println(CLASSNAME + " : LifeCycleServlet init() 호출");
		// 서버 시작할때 생성, 피자도우를 미리 준비하여 올려놓음
		// 실제 요청에 반응하는것은 doGet() + doPost()만 그때그때 반응
		// jsp도 이런 생명주기메소드가있지만 프론트사이드라서 숨겨져있는것뿐
	}

	// service() : 외부에서 servlet으로 특정 HTTP 요청이 발생하면 처리하는 생명 주기 메소드(GET/POST 처리)
	// doGet() + doPost()를 묶은게 service(), service() 주석처리하면 doGet() 실행됨
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(CLASSNAME + " : LifeCycleServlet service() 호출");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(CLASSNAME + " : LifeCycleServlet doGet() 호출");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(CLASSNAME + " : LifeCycleServlet doPost() 호출");
	}

	// destroy() : servlet이 종료될 때 호출되는 생명 주기 메소드
	@Override
	public void destroy() {
		System.out.println(CLASSNAME + " : LifeCycleServlet destroy() 호출");
	}

}
