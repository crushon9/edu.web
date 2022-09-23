package edu.web.jsp01;

public class TestBean {
	private String msg = "JSP useBean 테스트";

	public TestBean() {
		System.out.println("TestBean 생성자");
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

}
