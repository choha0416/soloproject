package pro.test;

public class User_m {
	private String user_id;
	private String name;
	private String user_id_field;
	private String email;
	private String password;
	private String role;
	
	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUser_id_field() {
		return user_id_field;
	}

	public void setUser_id_field(String user_id_field) {
		this.user_id_field = user_id_field;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public User_m(String user_id, String name, String user_id_field, String email, String password, String role) {
		super();
		this.user_id = user_id;
		this.name = name;
		this.user_id_field = user_id_field;
		this.email = email;
		this.password = password;
		this.role = role;
	}

	public User_m(String user_id_field, String role) {
		super();
		this.user_id_field = user_id_field;
		this.role = role;
	}

	public User_m(String user_id_field, String password, String role) {
		super();
		this.user_id_field = user_id_field;
		this.password = password;
		this.role = role;
	}
}
