package edu.web.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
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

		if (requestURI.contains("add")) {
			System.out.println("replies/add 호출확인");
			replyAdd(request, response);
		} else if (requestURI.contains("all")) {
			System.out.println("replies/all 호출확인");
			replyList(request, response);
		} else if (requestURI.contains("update")) {
			System.out.println("replies/update 호출확인");
			replyUpdate(request, response);
		} else if (requestURI.contains("delete")) {
			System.out.println("replies/delete 호출확인");
			replyDelete(request, response);
		} else if (requestURI.contains("count")) {
			System.out.println("replies/count 호출확인");
			replyCount(request, response);
		}
	} // end controlURI

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
				response.getWriter().append("success");
				// 성공시 append("sucess") 내용을 detail.jsp 의
				// success : function(result)의 result로 보냄
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
	} // end replyAdd

	private void replyList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// get방식 파라미터로 받은 boardId
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		// DB에서 댓글 목록을 리스트에 담음
		List<ReplyVO> list = dao.select(boardId);
		// JSONObject 와 JSONArray는 JSON 문법에 맞춰 key value로 데이터를 변환해주는 라이브러리
		// JSONArray에 List<ReplyVO>를 풀어서 하나씩 담음
		JSONArray jsonArr = new JSONArray();
		for (int i = 0; i < list.size(); i++) {
			JSONObject jsonObj = new JSONObject();
			ReplyVO vo = list.get(i);
			jsonObj.put("replyId", vo.getReplyId());
			jsonObj.put("boardId", vo.getBoardId());
			jsonObj.put("memberId", vo.getMemberId());
			jsonObj.put("replyContent", vo.getReplyContent());
			jsonObj.put("replyDateCreated", vo.getReplyDateCreated().toString()); // Date 타입 인식불가하여 toString으로 변환
			jsonArr.add(jsonObj);
		}
		System.out.println(jsonArr);
		// response에 JSONArray을 담음
		response.getWriter().append(jsonArr.toString());
	} // end replyList

	private void replyUpdate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int replyId = Integer.parseInt(request.getParameter("replyId")); // POST방식도 getParameter로 받아지네
		String replyContent = request.getParameter("replyContent");
		ReplyVO vo = new ReplyVO(replyId, 0, "", replyContent, null);
		int result = dao.update(vo);
		if (result == 1) {
			response.getWriter().append("success");
		}
	} // end replyUpdate

	private void replyDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int replyId = Integer.parseInt(request.getParameter("replyId"));
		int result = dao.delete(replyId);
		if (result == 1) {
			response.getWriter().append("success");
		}
	} // end replyDelete

	private void replyCount(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		int count = dao.getTotalCounts(boardId);
		response.getWriter().append(Integer.valueOf(count).toString());
	} // end replyCount
}
