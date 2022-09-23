package edu.web.servlet05;

public class InfoVO {
	private String name;
	private String lived;
	private int age;

	public InfoVO() {
	}

	public InfoVO(String name, String lived, int age) {
		this.name = name;
		this.lived = lived;
		this.age = age;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLived() {
		return lived;
	}

	public void setLived(String lived) {
		this.lived = lived;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	@Override
	public String toString() {
		return "InfoVO [name=" + name + ", lived=" + lived + ", age=" + age + "]";
	}

}
