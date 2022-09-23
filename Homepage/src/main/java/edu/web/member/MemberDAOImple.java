package edu.web.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import oracle.jdbc.OracleDriver;

public class MemberDAOImple implements MemberDAO, DBConnectionQuery {
	private static MemberDAOImple instance = null;

	private MemberDAOImple() {
		try {
			DriverManager.registerDriver(new OracleDriver());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static MemberDAOImple getInstance() {
		if (instance == null) {
			instance = new MemberDAOImple();
		}
		return instance;
	}

	@Override
	public int insert(MemberVO vo) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = conn.prepareStatement(SQL_INSERT);
			pstmt.setString(1, vo.getUserid());
			pstmt.setString(2, vo.getPassword());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getEmailAgree());
			pstmt.setString(5, vo.getInterestJoin());
			pstmt.setString(6, vo.getPhone());
			pstmt.setString(7, vo.getIntroduce());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeResource(conn, pstmt); // 반복되는 closeResource는 메소드로 정리
		}
		return result;
	}

	@Override
	public MemberVO selectById(String userid) {
		MemberVO vo = null; // userid에 해당 정보가 없을경우 null 반환
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = conn.prepareStatement(SQL_SELECT_BY_ID);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String password = rs.getString(COL_PASSWORD);
				String email = rs.getString(COL_EMAIL);
				String emailArgee = rs.getString(COL_EMAIL_AGREE);
				String[] interest = null;
				if (!rs.getString(COL_INTEREST).equals("없음")) {
					interest = rs.getString(COL_INTEREST).split(","); // join으로 묶은 문자열을 split으로 다시 나누어서 배열에 넣음
				}
				String phone = rs.getString(COL_PHONE);
				String introduce = rs.getString(COL_INTRODUCE);
				vo = new MemberVO(userid, password, email, emailArgee, interest, phone, introduce);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeResource(conn, pstmt, rs);
		}
		return vo;
	}
	
	/* 로그인 메소드를 따로 만들었을 때
	 public String selectById(String userid, String password) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = conn.prepareStatement(쿼리 : SELECT COL_USERID WHERE COL_USERID = ? AND COL_PASSWORD = ?);
			pstmt.setString(1, userid);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if (!rs.next()) { // 일치하는 정보를 가지고 오지 못했을때
				userid = null; // 반환값에 null을 담음
							   // 만약 "미일치"라는 값을 담았을때 어떤유저가 자기아이디를 "미일치"로 만들면 문제발생하니
							   // 실패반환값으로 설정한 값은 무조건 유저아이디로 생성하지 못하도록 막아야함
							   // 즉 지금 경우에는 유저아이디값으로 null 생성하지 못하도록 막아야는것임
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeResource(conn, pstmt, rs);
		}
		return userid;
	}
	  */

	@Override
	public int update(MemberVO vo) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = conn.prepareStatement(SQL_UPDATE);
			pstmt.setString(1, vo.getPassword());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getEmailAgree());
			pstmt.setString(4, vo.getInterestJoin());
			pstmt.setString(5, vo.getPhone());
			pstmt.setString(6, vo.getIntroduce());
			pstmt.setString(7, vo.getUserid()); // 순서 주의
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeResource(conn, pstmt);
		}
		return result;
	}

	@Override
	public int delete(String userid) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = conn.prepareStatement(SQL_DELETE);
			pstmt.setString(1, userid);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeResource(conn, pstmt);
		}
		return result;
	}

	@Override
	public ArrayList<String> idCheck() {
		ArrayList<String> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = conn.prepareStatement(SQL_IDCHECK);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String userid = rs.getString(COL_USERID);
				list.add(userid);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeResource(conn, pstmt, rs);
		}
		return list;
	}

	private void closeResource(Connection conn, PreparedStatement pstmt) {
		try {
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void closeResource(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
