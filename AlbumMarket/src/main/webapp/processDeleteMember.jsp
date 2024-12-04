<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%
	String mid=request.getParameter("id");
	System.out.println(mid);
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	String sql="SELECT * FROM memberab";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	if (rs.next()) {
		sql="DELETE FROM memberab WHERE id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,mid);
		pstmt.executeUpdate();
	} else
		out.println("일치하는 아이디 없습니다");
	
	if (rs!=null)
		rs.close();
	if (pstmt!=null)
		pstmt.close();
	if (conn!=null)
		conn.close();
	session.invalidate();
	response.sendRedirect("albums.jsp");
%>    