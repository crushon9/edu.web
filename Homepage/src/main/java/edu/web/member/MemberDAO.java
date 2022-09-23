package edu.web.member;

import java.util.ArrayList;

public interface MemberDAO {
	
	public abstract int insert(MemberVO vo);
	public abstract MemberVO selectById(String userid);
	public abstract int update(MemberVO vo);
	public abstract int delete(String userid);
	public abstract ArrayList<String> idCheck();
}
