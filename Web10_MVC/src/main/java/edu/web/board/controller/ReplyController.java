package edu.web.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import edu.web.board.domain.ReplyVO;
import edu.web.board.persistence.BoardDAO;
import edu.web.board.persistence.BoardDAOImple;
import edu.web.board.persistence.ReplyDAO;
import edu.web.board.persistence.ReplyDAOImple;

@WebServlet("/replies/*")
public class ReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ReplyDAO dao;

	public ReplyController() {
		dao = ReplyDAOImple.getInstance();
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

		// replies/add
		if (requestURI.contains("add")) {
			System.out.println("replyAdd 호출확인");
			replyAdd(request, response);
			// replies/all
		} else if (requestURI.contains("all")) {
			System.out.println("replyAll 호출확인");
			replyAll(request, response);
			// replies/update
		} else if (requestURI.contains("update")) {
			System.out.println("replyUpdate 호출확인");
			replyUpdate(request, response);
			// replies/delete
		} else if (requestURI.contains("delete")) {
			System.out.println("replyDelete 호출확인");
			replyDelete(request, response);
		}
	} // end controlURI

	private void replyDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	private void replyUpdate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	private void replyAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	private void replyAdd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String obj = request.getParameter("obj");
		JSONParser parser = new JSONParser();
		JSONObject jsonObj;
		try {
			// JSON 파라미터를 JSONObject로 parse
			jsonObj = (JSONObject) parser.parse(obj);
			// jsonObj 에서 요소를 하나씩 꺼내어 vo에 저장
			int boardId = Integer.parseInt((String) jsonObj.get("boardId"));
			String memberId = (String) jsonObj.get("memberId");
			String replyContent = (String) jsonObj.get("replyContent");
			ReplyVO vo = new ReplyVO(0, boardId, memberId, replyContent, null);
			System.out.println(vo);
			// DB에 insert
			int result = dao.insert(vo);
			System.out.println("replyAdd 결과 : " + result);
			if (result == 1) {
				response.getWriter().append("sucess");
				// 성공시 append("sucess") 내용을 detail.jsp 의
				// success : function(result)의 result로 보냄
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
}
