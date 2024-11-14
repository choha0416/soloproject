package scmn;

public class User {
	private String userId;
	private String userName;
	private String userPassword;
	private int userAge;
	private int userGrade;
	
	public User(String userId,String userName,String userPassword,int userAge,int userGrade) {
		this.userId= userId;
		this.userName = userName;
		this.userPassword = userPassword;
		this.userAge = userAge;
		this.userGrade = userGrade;
	}
	
	public User(String userid2, String userpassword2) {
		this.userId= userId;
		this.userPassword = userPassword;
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public int getUserAge() {
		return userAge;
	}
	public void setUserAge(int userAge) {
		this.userAge = userAge;
	}
	public int getUserGrade() {
		return userGrade;
	}
	public void setUserGrade(int userGrade) {
		this.userGrade = userGrade;
	}
	
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", userPassword=" + userPassword + ", userAge="
				+ userAge + ", userGrade=" + userGrade + "]";
	}
	
	
}