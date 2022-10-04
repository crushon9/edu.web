package edu.web.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.web.board.domain.BoardVO;
import edu.web.board.persistence.BoardDAO;
import edu.web.board.persistence.BoardDAOImple;

@WebServlet("*.do") // *.do로 선언된 HTTP 호출에 대해 모두 반응
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String BOARD_URL = "WEB-INF/board/";
	private static final String MAIN = "index";
	private static final String LIST = "list";
	private static final String REGISTER = "register";
	private static final String DETAIL = "detail";
	private static final String UPDATE = "update";
	private static final String DELETE = "delete";
	private static final String EXTENSION = ".jsp";
	private static final String SERVER_EXTENSION = ".do";
	private static BoardDAO dao;

	public BoardController() {
		dao = BoardDAOImple.getInstance();
	}

	// WEB-INF 하위에 jsp 파일을 두면, 컨트롤러를 통해서만 접근가능하며 직접주소로는 404에러 발생
	// webapp 하위경로에 뒀을때는 직접 접근 가능
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		controlURI(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		controlURI(request, response);
	}

	// request의 경로를 if문으로 확인하여 메소드 호출
	private void controlURI(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String requestMethod = request.getMethod();
		System.out.println("호출경로 : " + requestURI);
		System.out.println("호출방식 : " + requestMethod);

		if (requestURI.contains(LIST + SERVER_EXTENSION)) {
			System.out.println("list 호출확인");
			list(request, response);
		} else if (requestURI.contains(REGISTER + SERVER_EXTENSION)) {
			System.out.println("register 호출확인");
			if (requestMethod.equals("GET")) { // GET방식 (페이지불러오기)
				registerGET(request, response);
			} else if (requestMethod.equals("POST")) { // POST방식 (DB에저장)
				registerPOST(request, response);
			}
		} else if (requestURI.contains(DETAIL + SERVER_EXTENSION)) {
			System.out.println("detail 호출확인");
			detail(request, response);
		} else if (requestURI.contains(UPDATE + SERVER_EXTENSION)) {
			System.out.println("update 호출확인");
			if (requestMethod.equals("GET")) { // GET방식 (페이지불러오기)
				updateGET(request, response);
			} else if (requestMethod.equals("POST")) { // POST방식 (DB에저장)
				updatePOST(request, response);
			}
		} else if (requestURI.contains(DELETE + SERVER_EXTENSION)) {
			System.out.println("detail 호출확인");
			delete(request, response);
		}
	} // end controlURI

	// 전체 게시판 내용을 DB에서 가져오고, 그 데이터를 list.jsp 페이지에 보내기
	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<BoardVO> list = dao.select();
		request.setAttribute("list", list);
		String path = BOARD_URL + LIST + EXTENSION;
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	} // end list

	// register.jsp를 forward 호출
	private void registerGET(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = BOARD_URL + REGISTER + EXTENSION;
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	} // end registerGET

	private void registerPOST(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String boardTitle = request.getParameter("boardTitle");
		String memberId = request.getParameter("memberId");
		String boardContent = request.getParameter("boardContent");
		BoardVO vo = new BoardVO(0, boardTitle, memberId, boardContent, null);
		System.out.println(vo);
		int result = dao.insert(vo);
		System.out.println("insert 결과 : " + result);
		if (result == 1) {
			list(request, response);
		}
	} // end registerPOST

	private void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	} // end detail

	private void updateGET(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	} // end updateGET

	private void updatePOST(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	} // end updatePOST

	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	} // end delete
}