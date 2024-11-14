package scmn;
import java.util.*;
import java.sql.*;
public class ScoreList {
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
	//성적 보여주는 list 메서드 여러개 생성해서 학생일시 본인 성적만 보여주는 메서드와 교수일시 전체 보여주는 메서드생성
	public void listS() {
		Connection conn = null;
		try {
			//jdbc드라이버 등록
			//Class.forName("oracle.jdbc.OracleDriver");
			//연결
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521/xe",
					"system",
					"oracle"
			);
			String sql=""+
			"SELECT user_id, user_grade, subject1_grade, subject2_grade, subject3_grade, subject4_grade, average_score,"
			+ "RANK() OVER (PARTITION BY user_grade ORDER BY average_score DESC) AS rank "+
			"FROM scores";
			PreparedStatement pstmt = conn.prepareStatement(sql);
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
					System.out.println();
					System.out.println();
					//mm.mainMn();
		}  catch(SQLException e) {
			e.printStackTrace();
		} 
	}
}