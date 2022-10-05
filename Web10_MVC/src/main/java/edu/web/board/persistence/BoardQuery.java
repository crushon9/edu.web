package edu.web.board.persistence;

public interface BoardQuery {

	public static final String TABLE_NAME = "BOARD";
	public static final String COL_BOARD_ID = "BOARD_ID";
	public static final String COL_BOARD_TITLE = "BOARD_TITLE";
	public static final String COL_BOARD_CONTENT = "BOARD_CONTENT";
	public static final String COL_MEMBER_ID = "MEMBER_ID";
	public static final String COL_BOARD_DATE_CREATED = "BOARD_DATE_CREATED";

	// 새 글 작성
	public static final String SQL_INSERT = "INSERT INTO " + TABLE_NAME + " (" + COL_BOARD_ID + ", " + COL_BOARD_TITLE
			+ ", " + COL_BOARD_CONTENT + ", " + COL_MEMBER_ID + ") VALUES (SEQ_BOARD.nextval, ?, ?, ?)";

	// 전체 게시글 선택
	public static final String SQL_SELECT_ALL = "SELECT * FROM " + TABLE_NAME + " ORDER BY " + COL_BOARD_ID + " DESC";

	// 특정 게시글 선택
	public static final String SQL_SELECT_BY_BOARD_ID = "SELECT * FROM " + TABLE_NAME + " WHERE " + COL_BOARD_ID
			+ " = ?";

	// 특정 게시글 수정
	public static final String SQL_UPDATE = "UPDATE " + TABLE_NAME + " SET " + COL_BOARD_TITLE + " = ?, "
			+ COL_BOARD_CONTENT + " = ?, " + COL_BOARD_DATE_CREATED + " = SYSDATE WHERE " + COL_BOARD_ID + " = ?";

	// 특정 게시글 삭제
	public static final String SQL_DELETE = "DELETE FROM " + TABLE_NAME + " WHERE " + COL_BOARD_ID + " = ?";

	// 게시글 페이징 처리 선택
	/*
	 * SELECT B.BOARD_ID, B.BOARD_TITLE, B.BOARD_CONTENT, B.MEMBER_ID,
	 * B.BOARD_DATE_CREATED FROM ( SELECT ROWNUM RN, A.* FROM ( SELECT * FROM board
	 * * ORDER BY board_id DESC )A )B WHERE RN BETWEEN ? AND ?
	 */
	public static final String SQL_SELECT_PAGESCOPE = "SELECT B." + COL_BOARD_ID + ", B." + COL_BOARD_TITLE + ", B."
			+ COL_BOARD_CONTENT + ", B." + COL_MEMBER_ID + ", B." + COL_BOARD_DATE_CREATED
			+ " FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM " + TABLE_NAME + " ORDER BY " + COL_BOARD_ID
			+ " DESC)A )B WHERE RN BETWEEN ? AND ?";

	// 전체 게시글 수 선택
}
