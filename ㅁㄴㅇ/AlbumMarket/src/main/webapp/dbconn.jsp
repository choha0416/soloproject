<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ page import="java.sql.*" %>
<%
	Connection conn = null;
	try {
		 Class.forName("oracle.jdbc.OracleDriver");
		 
		 conn = DriverManager.getConnection(
				 "jdbc:oracle:thin:@localhost:1521/xe",
				 "system",
				 "oracle"
				 );
				 
	    } catch(SQLException e) {
			e.printStackTrace();
			out.println("데이터베이스 연결이 실패했습니다, <br>");
			out.println("SQLException" + e.getMessage());
		}
	
%>
    