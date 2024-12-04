<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%
	String albumId=request.getParameter("id");
	
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	String sql="SELECT * FROM album";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	if (rs.next()) {
		sql="DELETE FROM album WHERE a_id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,albumId);
		pstmt.executeUpdate();
	} else
		out.println("일치하는 음반이 없습니다");
	
	if (rs!=null)
		rs.close();
	if (pstmt!=null)
		pstmt.close();
	if (conn!=null)
		conn.close();
	response.sendRedirect("editAlbum.jsp?edit=delete");
%>    