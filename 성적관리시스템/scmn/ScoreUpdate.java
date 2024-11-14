package scmn;

import java.sql.*;
import java.util.Scanner;

public class ScoreUpdate {
	  Scanner scanner = new Scanner(System.in);
	    UserLogInOut ulio = new UserLogInOut();
	    User us;
		private String userId;
		private double subject1;
		private double subject2;
		private double subject3;
		private double subject4;
		private double averageScore;
		private int userGrade;
	    Score score = new Score(userId, userGrade ,subject1, subject2, subject3, subject4, averageScore);
	public void updateS() {
	       Connection conn = null;

	        try {
	            // 데이터베이스 연결
	            conn = DriverManager.getConnection(
	                    "jdbc:oracle:thin:@localhost:1521/xe",
	                    "system",
	                    "oracle"
	            );


	            	System.out.println("성적을 변경합니다");
	            	
	            	System.out.print("성적을 변경할 학생의 아이디를 입력해주세요");
	            	String userId = scanner.nextLine();
	            	score.setUserId(userId);
	            	     	
	            	//System.out.println(score.getUserId());
	            	
	            	System.out.println("학년을 입력해 주세요:");
	                String usgdInput = scanner.nextLine();
	                int usgd;

	                // 학년 조건 체크
	                if ("12345".equals(usgdInput)) {
	                    // 5자리 숫자 12345일 경우
	                    usgd = Integer.parseInt(usgdInput);
	                } else {
	                    // 1~4일 경우
	                    usgd = Integer.parseInt(usgdInput);
	                    while (usgd < 1 || usgd > 4) {
	                        System.out.println("유효하지 않은 학년입니다. 1에서 4 사이의 숫자를 입력해 주세요:");
	                        usgd = Integer.parseInt(scanner.nextLine());
	                    }
	                }

	                score.setUserGrade(usgd);
	                //System.out.println(score.getUserGrade());
	            	
	            	System.out.print("과목1 성적을 입력해 주세요");
	            	double subject1 = Double.parseDouble(scanner.nextLine());
	            	double sub1;
	            	sub1 = subject1;
	            	while(sub1 < 0 || sub1 > 4.5) {
	            		System.out.println("no");
	            		sub1 = Double.parseDouble(scanner.nextLine());
	            	}
	            	score.setSubject1(sub1);
	            	
	            	//System.out.println(score.getSubject1());
	            	
	            	System.out.print("과목2 성적을 입력해 주세요");
	            	double subject2 = Double.parseDouble(scanner.nextLine());
	            	double sub2;
	            	sub2 = subject2;
	            	while(sub2 < 0 || sub2 > 4.5) {
	            		System.out.println("no");
	            		sub2 = Double.parseDouble(scanner.nextLine());
	            	}
	            	score.setSubject2(sub2);
	            	
	            	System.out.print("과목3 성적을 입력해 주세요");
	            	double subject3 = Double.parseDouble(scanner.nextLine());
	            	double sub3;
	            	sub3 = subject3;
	            	while(sub3 < 0 || sub3 > 4.5) {
	            		System.out.println("no");
	            		sub3 = Double.parseDouble(scanner.nextLine());
	            	}
	            	score.setSubject3(sub3);
	            	
	            	System.out.print("과목4 성적을 입력해 주세요");
	            	double subject4 = Double.parseDouble(scanner.nextLine());
	            	double sub4;
	            	sub4 = subject4;
	            	while(sub4 < 0 || sub4 > 4.5) {
	            		System.out.println("no");
	            		sub4 = Double.parseDouble(scanner.nextLine());
	            	}
	            	score.setSubject4(sub4);
	           
	            	
	            	
	            	double averageScore = (sub1+sub2+sub3+sub4)/4;
	            	score.setAverageScore(averageScore);
	            	
	            	//System.out.println(score.getAverageScore());
	            	/*
	            	String sql = "INSERT INTO scores (user_id, user_grade, subject1_grade, subject2_grade, subject3_grade, subject4_grade, average_score) "
	            			+ "VALUES (?,?,?,?,?,?,?)";
	            	PreparedStatement pstmt = conn.prepareStatement(sql);
	            	pstmt.setString(1, score.getUserId());
	            	pstmt.setInt(2, score.getUserGrade());
	            	pstmt.setDouble(3, score.getSubject1());
	            	pstmt.setDouble(4, score.getSubject2());
	            	pstmt.setDouble(5, score.getSubject3());
	            	pstmt.setDouble(6, score.getSubject4());
	            	pstmt.setDouble(7, score.getAverageScore());
	            	
	            	pstmt.executeUpdate();
	            	pstmt.close();
	            	*/
	            	
	            	String sql = new StringBuilder()
	            			.append("UPDATE scores SET ")
	            			.append("user_grade=?, ")
	            			.append("subject1_grade=?, ")
	            			.append("subject2_grade=?, ")
	            			.append("subject3_grade=?, ")
	            			.append("subject4_grade=?, ")
	            			.append("average_score=? ")
	            			.append("WHERE user_id=?")
	            			.toString();
	            	PreparedStatement pstmt = conn.prepareStatement(sql);
	            	pstmt.setInt(1, score.getUserGrade());
	            	pstmt.setDouble(2, score.getSubject1());
	            	pstmt.setDouble(3, score.getSubject2());
	            	pstmt.setDouble(4, score.getSubject3());
	            	pstmt.setDouble(5, score.getSubject4());
	            	pstmt.setDouble(6, score.getAverageScore());
	            	pstmt.setString(7, score.getUserId());
	            	
	            	pstmt.executeUpdate();
	            	System.out.println("수정 완료하였습니다");
	            	System.out.println("변경된 학년: "+score.getUserGrade());
	            	System.out.println("변경된 과목1성적: "+score.getSubject1());
	            	System.out.println("변경된 과목2성적: "+score.getSubject2());
	            	System.out.println("변경된 과목3성적: "+score.getSubject3());
	            	System.out.println("변경된 과목4성적: "+score.getSubject4());
	            	System.out.println("변경된 평균총점: "+score.getAverageScore());
	            	
	            	pstmt.close();
	            	 MainMenu mm = new MainMenu(); // MainMenu 객체 생성
	                 mm.mainMn(); // MainMenu 실행
	          
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            if (conn != null) {
	                try {
	                    conn.close();
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                }
	            }
	        }
	    }

	 
	}
