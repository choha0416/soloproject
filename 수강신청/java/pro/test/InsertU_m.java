package pro.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class InsertU_m {
	
	Connection conn = null;
	PreparedStatement pstmt;
	
	public InsertU_m() {
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
	public int insertU(String id, String idf, String pw, String name, String email) {
	     int row = 0;
	        
	        try {
	            String sql = "INSERT INTO users_m(user_id, name, user_id_field, email, password) VALUES(?, ?, ?, ?, ?)";
	            PreparedStatement pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, id);      
	            pstmt.setString(2, name);    
	            pstmt.setString(3, idf);     
	            pstmt.setString(4, email);    
	            pstmt.setString(5, pw);      
	            row = pstmt.executeUpdate(); 
	            pstmt.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return row;
	    }
}
		
	
