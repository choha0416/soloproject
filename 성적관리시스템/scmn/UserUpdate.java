package scmn;
import java.util.*;
import java.sql.*;
public class UserUpdate {
	
	Scanner scanner = new Scanner(System.in);
	private String userid;
	private String userpassword;	
	private String username;
	private int userage;
	private int usergrade;
	User us = new User(userid,userpassword,username,userage,usergrade);
	
	public void updateU() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521/xe",
					"system",
					"oracle"
			);
			System.out.print("수정할 아이디를 선택하세요: ");		
			String usidu = scanner.nextLine();
			us.setUserId(usidu);
			
			System.out.print("비밀번호를 입력하세요: ");		
			String uspwu = scanner.nextLine();
			us.setUserPassword(uspwu);
			
			System.out.print("이름 입력하세요: ");		
			String usnmu = scanner.nextLine();
			us.setUserName(usnmu);
			
			System.out.println("수정할 나이");
			int usagu = Integer.parseInt(scanner.nextLine());
			us.setUserAge(usagu);
			
			System.out.println("수정할 학년");
			int usgdu = Integer.parseInt(scanner.nextLine());
			us.setUserGrade(usgdu);
			
			String sql1 = new StringBuilder() 
					.append("UPDATE usersc SET ")
					.append("userpassword=?, ")
					.append("username=?, ")					
					.append("userage=?, ")
					.append("usergrade=? ")
					.append("WHERE userid=?")
					.toString();
			
			PreparedStatement pstmt1 = conn.prepareStatement(sql1);
			
			pstmt1.setString(1,us.getUserPassword());
			pstmt1.setString(2,us.getUserName());
			pstmt1.setInt(3,us.getUserAge());
			pstmt1.setInt(4,us.getUserGrade());
			pstmt1.setString(5,usidu);

			pstmt1.executeUpdate();
			
		
			System.out.println("수정 완료하였습니다");
			System.out.println("변경된 이름: "+us.getUserName());
			System.out.println("변경된 비밀번호: "+us.getUserPassword());
			System.out.println("변경된 나이: "+us.getUserAge());
			System.out.println("변경된 학년: "+us.getUserGrade());
			
			pstmt1.close();		
			System.out.println();
			System.out.println();
			
		}  catch(SQLException e) {
			e.printStackTrace();
		} finally {
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {}
			}
		}
	}
}