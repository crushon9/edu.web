package edu.web.login.cotroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.go")
public class Logincontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Logincontroller() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		controlURI(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		controlURI(request, response);
	}

	private void controlURI(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String requestMethod = request.getMethod();
		System.out.println("호출경로 : " + requestURI + " 호출방식 : " + requestMethod);

		if (requestURI.contains("login")) {
			if (requestMethod.equals("GET")) {
				loginGET(request, response);
			} else if (requestMethod.equals("POST")) {
				loginPOST(request, response);
			}
		}
	}

	private void loginGET(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("loginGET 호출확인");
		// RequestDispatcher 없어도 되네???
		request.getRequestDispatcher("/WEB-INF/login/login.jsp").forward(request, response);
	}

	private void loginPOST(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("loginPOST 호출확인");

	}

}
