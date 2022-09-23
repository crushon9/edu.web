package edu.web.homework;

import java.util.Arrays;

public class MemberVO {
	// *주의 : useBean을 위한 VO를 생성할 경우, parameter name과 변수명이 같아야 함
	private String userid;
	private String password;
	private String email;
	private String emailArgee;
	private String[] interest;
	private String phone;
	private String introduce;

	// useBean을 사용할 때는 기본생성자를 반드시 생성 
	// 왜??
	// 자바빈즈의 객체 생성은 <jsp:useBean> 액션 태그로 생성하는데 기본 생성자를 이용하여 객체를 생성하기 때문에 반드시 기본 생성자가 있어야 한다.
	public MemberVO() {
	}

	public MemberVO(String userid, String password, String email, String emailArgee, String[] interest, String phone,
			String introduce) {
		this.userid = userid;
		this.password = password;
		this.email = email;
		this.emailArgee = emailArgee;
		this.interest = interest;
		this.phone = phone;
		this.introduce = introduce;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmailArgee() {
		return emailArgee;
	}

	public void setEmailArgee(String emailArgee) {
		this.emailArgee = emailArgee;
	}

	public String[] getInterest() {
		return interest;
	}

	public void setInterest(String[] interest) {
		this.interest = interest;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	@Override
	public String toString() {
		return "MemberVO [userid=" + userid + ", password=" + password + ", email=" + email + ", emailArgee="
				+ emailArgee + ", interest=" + Arrays.toString(interest) + ", phone=" + phone + ", introduce="
				+ introduce + "]";
	}

}
