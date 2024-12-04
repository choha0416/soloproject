<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ page import="java.sql.*" %>    
<%@ page import="java.util.*" %>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String mid = request.getParameter("id");
	String mpw = request.getParameter("pw");
	String mname = request.getParameter("name");
	String mgender = request.getParameter("gender");
	String mbirth = request.getParameter("birth");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="SELECT * FROM memberab WHERE id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,mid);
	rs=pstmt.executeQuery();
	
	System.out.println(mid);
	if(rs.next()) {
		
			sql="UPDATE memberab SET password=?, name=? ,gender=?, birth=? WHERE id=?";
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1,mpw);
			pstmt.setString(2,mname);
			pstmt.setString(3,mgender);
			pstmt.setString(4,mbirth);
			pstmt.setString(5,mid);
			
			pstmt.executeUpdate();
	
	}
	//System.out.print(singer);
	if (pstmt!=null)
		pstmt.close();
	if (conn!=null)
		conn.close();


	response.sendRedirect("albums.jsp");
	
%>