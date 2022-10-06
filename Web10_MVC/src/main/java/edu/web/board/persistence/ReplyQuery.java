package edu.web.board.persistence;

public interface ReplyQuery {

	public static final String TABLE_NAME = "MVC_REPLY";
	public static final String COL_REPLY_ID = "REPLY_ID";
	public static final String COL_BOARD_ID = "BOARD_ID";
	public static final String COL_MEMBER_ID = "MEMBER_ID";
	public static final String COL_REPLY_CONTENT = "REPLY_CONTENT";
	public static final String COL_REPLY_DATE_CREATED = "REPLY_DATE_CREATED";

	// 새 댓글 작성
	public static final String SQL_INSERT = "INSERT INTO " + TABLE_NAME
			+ " VALUES (SEQ_REPLY.nextval, ?, ?, ?, SYSDATE)";

	// 특정 게시글 전체 댓글 선택
	public static final String SQL_SELECT = "SELECT * FROM " + TABLE_NAME + " WHERE " + COL_BOARD_ID + " = ? ORDER BY "
			+ COL_REPLY_ID + " DESC";

	// 특정 댓글 수정
	public static final String SQL_UPDATE = "UPDATE " + TABLE_NAME + " SET " + COL_REPLY_CONTENT + " = ?, "
			+ COL_REPLY_DATE_CREATED + " = SYSDATE WHERE " + COL_REPLY_ID + " = ?";

	// 특정 댓글 삭제
	public static final String SQL_DELETE = "DELETE FROM " + TABLE_NAME + " WHERE " + COL_REPLY_ID + " = ?";
}
