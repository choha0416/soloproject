<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %> <!-- DB 연결 설정 포함 -->

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Login</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String mid = request.getParameter("id");
    String mpw = request.getParameter("pw");

    if (mid == null || mpw == null || mid.isEmpty() || mpw.isEmpty()) {
        response.sendRedirect("loginMember.jsp?error=true");
        return;
    }


    String sql = "SELECT * FROM memberab WHERE id=? AND password=?";
    
    pstmt = conn.prepareStatement(sql); 
    pstmt.setString(1, mid);
    pstmt.setString(2, mpw);


    rs = pstmt.executeQuery();

    if (rs.next()) {
        session.setAttribute("sessionId", mid);
        response.sendRedirect("albums.jsp");
    } else {
        response.sendRedirect("loginMember.jsp?error=true");
    }

    if (rs != null) rs.close();
    if (pstmt != null) pstmt.close();
    if (conn != null) conn.close(); 
%>
</body>
</html>
