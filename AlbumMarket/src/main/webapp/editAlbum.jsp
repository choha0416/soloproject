<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ page import="java.sql.*" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    // 'language' 파라미터로 언어를 변경하면 세션에 저장
    String language = request.getParameter("language");
    if (language != null) {
        session.setAttribute("language", language);  // 세션에 언어 저장
    } else {
        // 세션에 저장된 언어 값이 없으면 기본값으로 설정
        language = (String) session.getAttribute("language");
        if (language == null) {
            language = "ko";  // 기본값은 'ko' (한국어)
        }
    }
%>

<fmt:setLocale value="<%= language %>" /><!-- 언어 설정관련 fmt  -->
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"><meta charset="utf-8">
<link rel="stylesheet" href="resources/css/album.css" />
<meta charset="utf-8">
<link rel="icon" href="resources/images/icon.png" sizes="32x32" type="/image/png">
<title>음반 편집</title>
<script type="text/javascript">
	function deleteConfirm(id){
		if(confirm("해당 음반을 삭제합니다!!")==true)
			location.href="./deleteAlbum.jsp?id="+id;
		else
			return;
	}
</script>
</head>
<%
    String edit = request.getParameter("edit");
%>
<body>
    <fmt:bundle basename="bundle.message">
    <div class="container py-4">
        <%@ include file="menu.jsp" %>
        <div class="p-5 mb-4 bg-body-tertiary rounded-3">
            <div class="container-fluid py-5">         
                   <%
                        if (edit != null && edit.equals("update")) {
                    %>
                    <h1 class="display-5 fw-bold"><fmt:message key="albumEditing" /></h1><!-- 음반 편집 -->
                	<p class="col-md-8 fs-4">Album Editing</p>
                    <%
                        } else if (edit.equals("delete")){
                    %>
                   <h1 class="display-5 fw-bold"><fmt:message key="albumDelete" /></h1><!-- 음반 편집 -->
                	<p class="col-md-8 fs-4">Album Delete</p>
            	<%
                        }
            	%>  
            </div>
        </div>
        <%@ include file="dbconn.jsp" %>
        
        <div class="row row-cols-1 row-cols-md-3 g-4">
        <%
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            String sql = "SELECT * FROM album";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()){
        %>
        <div class="col">
            <div class="album-card">
                <img src="./resources/images/<%= rs.getString("a_filename") %>" class="album-image" alt="<%= rs.getString("a_name") %>">
                <h5 class="mt-3"><b><%= rs.getString("a_name") %></b></h5>
                <p><%= rs.getString("a_singer") %></p>
                <p><%= rs.getString("a_publisher") %></p>
                <p class="description">
                    <%
                        String descriptionText = rs.getString("a_desciption");
                        if (descriptionText != null && descriptionText.length() > 80) {
                            descriptionText = descriptionText.substring(0, 80) + "...";
                        } else if (descriptionText == null) {
                            descriptionText = "";
                        }
                    %>
                    <%= descriptionText %>
                </p>
                <p><%= rs.getString("a_unitPrice") %><fmt:message key="won" /></p>
                <p>
                    <%
                        if (edit != null && edit.equals("update")) {
                    %>
                    <a href="./updateAlbum.jsp?id=<%= rs.getString("a_id") %>" class="btn btn-secondary" role="button"><fmt:message key="update" /> <i class="bi bi-box-arrow-in-right"></i></a><!-- 수정 -->
                    <%
                        } else if (edit.equals("delete")){
                    %>
                    <a href="#" onclick="deleteConfirm('<%= rs.getString("a_id") %>')" class="btn btn-danger" role="button"><fmt:message key="delete" /> <i class="bi bi-box-arrow-in-right"></i></a>
                </p>
            	<%
                        }
            	%>
            </div>
        </div>
        <%
            }
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        %>
        </div>
        
        <%@ include file="footer.jsp" %>
    </div>
    </fmt:bundle>

</body>
</html>
