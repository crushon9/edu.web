package edu.web.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import edu.web.board.util.PageCriteria;

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
		System.out.println("호출경로 : " + requestURI + " 호출방식 : " + requestMethod);

		// list.do
		if (requestURI.contains(LIST + SERVER_EXTENSION)) {
			System.out.println("list 호출확인");
			listGET(request, response);

			// register.do
		} else if (requestURI.contains(REGISTER + SERVER_EXTENSION)) {
			if (requestMethod.equals("GET")) { // GET방식 (페이지불러오기)
				System.out.println("registerGET 호출확인");
				registerGET(request, response);
			} else if (requestMethod.equals("POST")) { // POST방식 (DB에저장)
				System.out.println("registerPOST 호출확인");
				registerPOST(request, response);
			}
			// detail.do
		} else if (requestURI.contains(DETAIL + SERVER_EXTENSION)) {
			System.out.println("detail 호출확인");
			detailGET(request, response);
			// update.do
		} else if (requestURI.contains(UPDATE + SERVER_EXTENSION)) {
			if (requestMethod.equals("GET")) { // GET방식 (페이지불러오기)
				System.out.println("updateGET 호출확인");
				updateGET(request, response);
			} else if (requestMethod.equals("POST")) { // POST방식 (DB에저장)
				System.out.println("updatePOST 호출확인");
				updatePOST(request, response);
			}
			// delete.do
		} else if (requestURI.contains(DELETE + SERVER_EXTENSION)) {
			System.out.println("delete 호출확인");
			deletePOST(request, response);
		}
	} // end controlURI

	// 전체 게시판 내용을 DB에서 가져오고, 그 데이터를 list.jsp 페이지에 보내기
	private void listGET(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int page = Integer.parseInt(request.getParameter("page"));
		PageCriteria criteria = new PageCriteria();
		criteria.setPage(page);
		List<BoardVO> list = dao.select(criteria);
		
		request.setAttribute("list", list);
		String path = BOARD_URL + LIST + EXTENSION; // WEB-INF/board/list.jsp
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	} // end list

	// register.jsp를 forward 호출
	private void registerGET(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = BOARD_URL + REGISTER + EXTENSION; // WEB-INF/board/register.jsp
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	} // end registerGET

	// register.jsp에서 등록된 정보를 DB로 insert하고 alert후 index.jsp
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
			PrintWriter out = response.getWriter();
			out.print("<head><meta charset='UTF-8'></head>");
			out.print("<script>alert('게시글 등록 성공')</script>");
			out.print("<script>location.href='" + MAIN + EXTENSION + "';</script>");
		}
	} // end registerPOST

	// detail.jsp에서 boardId를 보내고 DB에서 해당게시글을 detail.jsp에 전송
	private void detailGET(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		BoardVO vo = dao.select(boardId);
		System.out.println(vo);
		if (vo != null) {
			request.setAttribute("vo", vo);
			String path = BOARD_URL + DETAIL + EXTENSION; // WEB-INF/board/detail.jsp
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
		} else {
			PrintWriter out = response.getWriter();
			out.print("<head><meta charset='UTF-8'></head>");
			out.print("<script>alert('존재하지않는 게시글 입니다')</script>");
			out.print("<script>location.href='" + MAIN + EXTENSION + "';</script>");
		}
	} // end detail

	// detail.jsp에서 boardId를 보내고 DB에서 해당게시글을 update.jsp로 forward 호출
	private void updateGET(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		BoardVO vo = dao.select(boardId);
		System.out.println(vo);
		if (vo != null) {
			// TODO : session 검사해서 있을때 여기로 보내야할것같은디
			request.setAttribute("vo", vo);
			String path = BOARD_URL + UPDATE + EXTENSION; // WEB-INF/board/update.jsp
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
		} else {
			PrintWriter out = response.getWriter();
			out.print("<head><meta charset='UTF-8'></head>");
			out.print("<script>alert('존재하지않는 게시글 입니다')</script>");
			out.print("<script>location.href='" + MAIN + EXTENSION + "';</script>");
		}
	} // end updateGET

	// update.jsp에서 POST 방식으로 DB 내용 update하고 alert후 detail.jsp
	private void updatePOST(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		BoardVO vo = new BoardVO(boardId, boardTitle, boardContent, null, null);
		int result = dao.update(vo);
		System.out.println("update 결과 : " + result);
		if (result == 1) {
			PrintWriter out = response.getWriter();
			out.print("<head><meta charset='UTF-8'></head>");
			out.print("<script>alert('게시글 수정 성공')</script>");
			// detail.do?boardId=게시글번호
			out.print("<script>location.href='" + DETAIL + SERVER_EXTENSION + "?boardId=" + boardId + "';</script>");
		}
	} // end updatePOST

	// detail.jsp에서 boardId를 보내고 DB에서 해당게시글을 delete하고 alert후 index.jsp
	private void deletePOST(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		int result = dao.delete(boardId);
		System.out.println("delete 결과 : " + result);
		if (result == 1) {
			PrintWriter out = response.getWriter();
			out.print("<head><meta charset='UTF-8'></head>");
			out.print("<script>alert('게시글 삭제 성공')</script>");
			out.print("<script>location.href='" + MAIN + EXTENSION + "';</script>");
		}
	} // end delete
}