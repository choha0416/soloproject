package pro.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LoginDAO {
	
	Connection conn = null;
	PreparedStatement pstmt;
	
	public LoginDAO() {
		 try {
			 Class.forName("oracle.jdbc.OracleDriver");
			 
			 conn = DriverManager.getConnection(
					 "jdbc:oracle:thin:@localhost:1521/xe",
					 "system",
					 "oracle"
					 );				 
		 	} catch (ClassNotFoundException e) {
		        // Class.forName에서 발생한 예외 처리
		        e.printStackTrace();
		    } catch(SQLException e) {
		 		e.printStackTrace();
		 		}

	}
	public int insertU(String id, String pw, String name, String age ) {
		int row=0;
		
		try {
	    	 
			String sql = "INSERT INTO user_in(id, pw, name, age) VALUES(?, ?, ?, ?)";
            //out.println("PreparedStatement: "+sql);
           //System.out.println("dao:"+id);
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, pw);
            pstmt.setString(3, name);
            pstmt.setString(4, age);
            row=pstmt.executeUpdate();
            pstmt.close();
            //System.out.println("작동 확인:"+row);
     } catch (Exception e) {
            e.printStackTrace();
     	} 
		return row;
	}
	
	public List<User> selectU(String id, String pw, String name, String age ) {
		List<User> users = new ArrayList<>();
		
		try {
	    	 
			String sql = "SELECT id, pw, name, age FROM user_in";
            //out.println("PreparedStatement: "+sql);
           //System.out.println("dao:"+id);
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
            	String uid = rs.getString("id");
            	String upw= rs.getString("pw");
            	String uname = rs.getString("name");
            	String uage =rs.getString("age");
            	User user = new User(uid, upw, uname, uage);
            	
            	users.add(user);
            	//System.out.println(uid);
            }
            rs.close();
			pstmt.close();
            
            //System.out.println("작동 확인:"+row);
     } catch (Exception e) {
            e.printStackTrace();
     	} 
		return users;
	}
}
		
	

