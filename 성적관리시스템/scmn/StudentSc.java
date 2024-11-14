package scmn;
import java.sql.*;
import java.util.*;
public class StudentSc {
	private ScoreInsert si = new ScoreInsert(); // ScoreInsert 객체 초기화
    private ScoreUpdate su = new ScoreUpdate();
    private ScoreList sl = new ScoreList();
    private Scanner scanner = new Scanner(System.in);
    UserLogInOut ulio = new UserLogInOut();
    private String userId;
	private double subject1;
	private double subject2;
	private double subject3;
	private double subject4;
	private double averageScore;
	private int userGrade;
    User us;
    Score score = new Score(userId, userGrade ,subject1, subject2, subject3, subject4, averageScore);
	public void stuScLi() {
		 User us = ulio.userLgI();
		 Connection conn = null;
        // System.out.println(us.getUserGrade());
        // System.out.println(us.getUserId());
         userId = us.getUserId();
         if(us.getUserGrade()!=12345) {
        	// System.out.println("1");
        	 
        	 try {
     			conn = DriverManager.getConnection(
     					"jdbc:oracle:thin:@localhost:1521/xe",
     					"system",
     					"oracle"
     			);
    			String sql=""+
    					"SELECT user_id, user_grade, subject1_grade, subject2_grade, subject3_grade, subject4_grade, average_score,"
    					+ "RANK() OVER (PARTITION BY user_grade ORDER BY average_score DESC) AS rank "+
    					"FROM scores "+
    					"WHERE user_id=? ";
     					PreparedStatement pstmt = conn.prepareStatement(sql);
     			
     					pstmt.setString(1, userId);
    					ResultSet rs = pstmt.executeQuery();
    					while(rs.next()) {
    						score.setUserId(rs.getString("user_id"));
    						score.setUserGrade(rs.getInt("user_grade"));
    						score.setSubject1(rs.getDouble("subject1_grade"));
    						score.setSubject2(rs.getDouble("subject2_grade"));
    						score.setSubject3(rs.getDouble("subject3_grade"));
    						score.setSubject4(rs.getDouble("subject4_grade"));
    						score.setAverageScore(rs.getDouble("average_score"));
    						score.setRank(rs.getInt("rank"));
    						System.out.println(score);
    					}

     					rs.close();
     					pstmt.close();
     					System.out.println();
     					System.out.println();
     					MainMenu mm = new MainMenu();
     					mm.mainMn();
     		}  catch(SQLException e) {
     			e.printStackTrace();
     		}  finally {
	            if (conn != null) {
	                try {
	                    conn.close();
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                }
	            }
	        }
        	 
      	   
         } else {
         	System.out.println("학생으로 로그인해주세요");
         	 MainMenu mm = new MainMenu(); // MainMenu 객체 생성
              mm.mainMn(); // MainMenu 실행
         }
  	
  	
      
  }

}

