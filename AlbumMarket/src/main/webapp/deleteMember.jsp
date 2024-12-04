<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="dbconn.jsp" %> 

<%

    String sessionId = (String) session.getAttribute("sessionId");

    if (sessionId == null) {
        out.println("로그인 후 탈퇴할 수 있습니다.");
        return;
    }

 
    String sql = "DELETE FROM memberab WHERE id = ?";


    PreparedStatement pstmt = conn.prepareStatement(sql); 
    pstmt.setString(1, sessionId); 


    int result = pstmt.executeUpdate();
    if (result > 0) {
  
        session.removeAttribute("sessionId");
        session.invalidate();

        out.println("회원 탈퇴가 완료되었습니다.");
        response.sendRedirect("albums.jsp");  
    } else {
        out.println("탈퇴 처리에 실패했습니다.");
    }

    // 리소스 정리
    if (pstmt != null) {
        pstmt.close();
    }
%>
