package pro.test;

public class User {
	private String id;
	private String name;
	private String pw;
	private String age;
	
	public User(String id, String name, String pw, String age) {
		super();
		this.id = id;
		this.name = name;
		this.pw = pw;
		this.age = age;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}
	
}
