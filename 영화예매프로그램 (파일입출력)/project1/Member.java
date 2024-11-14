package project1;

public class Member {
	    public String memberId; 
	    public String password;

	  
	    Member(String memberId, String password) {
	        this.memberId = memberId;
	        this.password = password;
	    }

	    public String getMemberId() {
	        return memberId;
	    }

	    public void setMemberId(String memberId) {
	        this.memberId = memberId;
	    }

	    @Override
	    public String toString() {
	        return "아이디: " + memberId+ " 비밀번호: " + password; 
	    }
	}