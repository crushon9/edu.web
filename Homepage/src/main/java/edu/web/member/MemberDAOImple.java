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
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

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
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	@Override
	public MemberVO selectById(String userid) {
		MemberVO vo = null; // userid에 해당 정보가 없을경우 null 반환
		try {
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = conn.prepareStatement(SQL_SELECT_BY_ID);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String password = rs.getString(2);
				String email = rs.getString(3);
				String emailArgee = rs.getString(4);
				String[] interest = { rs.getString(5) }; // interest[0]에 통째로 집어넣기
				String phone = rs.getString(6);
				String introduce = rs.getString(7);
				vo = new MemberVO(userid, password, email, emailArgee, interest, phone, introduce);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return vo;
	}

	@Override
	public int update(MemberVO vo) {
		int result = 0;
		try {
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = conn.prepareStatement(SQL_UPDATE);
			pstmt.setString(1, vo.getPassword());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getEmailAgree());
			pstmt.setString(4, vo.getInterestJoin());
			pstmt.setString(5, vo.getPhone());
			pstmt.setString(6, vo.getIntroduce());
			pstmt.setString(7, vo.getUserid());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	@Override
	public int delete(String userid) {
		int result = 0;
		try {
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = conn.prepareStatement(SQL_DELETE);
			pstmt.setString(1, userid);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	@Override
	public ArrayList<String> idCheck() {
		ArrayList<String> list = new ArrayList<>();
		try {
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = conn.prepareStatement(SQL_IDCHECK);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String userid = rs.getString(1);
				list.add(userid);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

}
