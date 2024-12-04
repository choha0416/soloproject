<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>회원 가입 처리</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String mid = request.getParameter("id");
    String mpw = request.getParameter("pw");
    String mname = request.getParameter("name");
    String mgender = request.getParameter("gender");
    String mbirth = request.getParameter("birth");
    if (mid == null || mpw == null || mname == null || mgender == null || mbirth == null ||
        mid.trim().isEmpty() || mpw.trim().isEmpty() || mname.trim().isEmpty() || mgender.trim().isEmpty() || mbirth.trim().isEmpty()) {
        response.sendRedirect("addMember.jsp?error=true");
    } else {
        PreparedStatement pstmt = conn.prepareStatement("INSERT INTO memberab (id, password, name, gender, birth) VALUES (?, ?, ?, ?, ?)");
        pstmt.setString(1, mid);
        pstmt.setString(2, mpw);
        pstmt.setString(3, mname);
        pstmt.setString(4, mgender);
        pstmt.setString(5, mbirth);
        pstmt.executeUpdate();
        response.sendRedirect("albums.jsp");

        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
</body>
</html>
