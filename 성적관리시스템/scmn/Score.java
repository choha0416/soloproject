package scmn;

public class Score {
    private String userId;
    private int userGrade;
    private double subject1;
    private double subject2;
    private double subject3;
    private double subject4;
    private double averageScore;
    private int rank;

    public Score(String userId, int userGrade , double subject1, double subject2, double subject3, double subject4, double averageScore) {
        this.userId = userId;
        this.userGrade = userGrade;
        this.subject1 = subject1;
        this.subject2 = subject2;
        this.subject3 = subject3;
        this.subject4 = subject4;
        this.averageScore = averageScore;
    }
    
    
    public Score(String userId, int userGrade , double subject1, double subject2, double subject3, double subject4, double averageScore, int rank) {
        this.userId = userId;
        this.userGrade = userGrade;
        this.subject1 = subject1;
        this.subject2 = subject2;
        this.subject3 = subject3;
        this.subject4 = subject4;
        this.averageScore = averageScore;
    }
    

    public int getRank() {
		return rank;
	}


	public void setRank(int rank) {
		this.rank = rank;
	}


	public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
    
    public int getUserGrade() {
		return userGrade;
	}

	public void setUserGrade(int userGrade) {
		this.userGrade = userGrade;
	}

	

    public double getSubject1() {
        return subject1;
    }

    public void setSubject1(double subject1) {
        this.subject1 = subject1;
    }

    public double getSubject2() {
        return subject2;
    }

    public void setSubject2(double subject2) {
        this.subject2 = subject2;
    }

    public double getSubject3() {
        return subject3;
    }

    public void setSubject3(double subject3) {
        this.subject3 = subject3;
    }

    public double getSubject4() {
        return subject4;
    }

    public void setSubject4(double subject4) {
        this.subject4 = subject4;
    }

    public double getAverageScore() {
        return averageScore;
    }

    public void setAverageScore(double averageScore) {
        this.averageScore = averageScore;
    }

    @Override
	public String toString() {
		return "[아이디: "+userId+"  학년: " + userGrade + "  과목1: " + subject1 + "  과목2: "
				+ subject2 + "  과목3: " + subject3 + "  과목4: " + subject4 + "  총점평균: " + averageScore+"  등수: "+rank+"]"
				;
	}
    
	public String toString1() {
		return "[학년: " + userGrade + "  과목1: " + subject1 + "  과목2: "
				+ subject2 + "  과목3: " + subject3 + "  과목4: " + subject4 + "  총점평균: " + averageScore+"  등수: "+rank+"]"
				;
	}

}