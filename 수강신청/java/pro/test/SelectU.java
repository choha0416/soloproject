package pro.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SelectU {
	Connection conn = null;
	PreparedStatement pstmt;
	
	public SelectU() {
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
	public List<User_m> selectU(String user_id, String name, String user_id_field, String email, String password, String role ) {
		List<User_m> users = new ArrayList<>();
		
		try {
	    	 
			String sql = "SELECT user_id, name, user_id_field, email, password, role  FROM users_m";
            //out.println("PreparedStatement: "+sql);
           //System.out.println("dao:"+id);
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
            	String user_id_m = rs.getString("user_id");
            	String name_m= rs.getString("name");
            	String user_id_field_m = rs.getString("user_id_field");
            	String email_m =rs.getString("email");
            	String password_m =rs.getString("password");
            	String role_m =rs.getString("role");
            	User_m userInfo = new User_m(user_id_m, name_m, user_id_field_m, email_m,password_m,role_m);
            	
            	users.add(userInfo);
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
