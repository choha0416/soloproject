<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Album" %>
<%@ page import="dao.AlbumRepository" %>
<%@ page import = "java.sql.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="AlbumDAO" class="dao.AlbumRepository" scope="session"/>
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
<fmt:setLocale value="<%= language %>" />
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"><meta charset="utf-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="utf-8">
<link rel="icon" href="resources/images/icon.png" sizes="32x32" type="/image/png">
<title>음반 목록</title>
<style>
    .description {
        word-wrap: break-word;
        word-break: break-all;
        white-space: normal;
    }
</style>
</head>
<body>
	
	<fmt:bundle basename="bundle.message">
	<div class="container py-4">
		<%@ include file="menu.jsp" %>
		
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold"><fmt:message key="albumList" /></h1><!-- 음반 목록 -->
				<p class="col-md-8 fs-4">AlbumList</p>
			</div>
		</div>
		<%
			AlbumRepository dao = AlbumRepository.getInstance();
			ArrayList<Album> listOfAlbums = dao.getAllAlbums();
		%>
		<%@ include file ="dbconn.jsp" %>
		<div class="row align-items-md-strech text-center">
			<%
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				String sql="SELECT * FROM album";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while (rs.next()){
			%>
			<div class="col-md-4">
				<div class="h-100 p-2 round-3">
					<img src="./resources/images/<%=rs.getString("a_filename") %>" style="width:250; height:350;">
					<h5><b><%=rs.getString("a_name") %></b></h5>
					<p><%=rs.getString("a_singer") %></p>
					<p><%=rs.getString("a_publisher") %></p>
					
					<p class="description">
					    <%
					        // album.getDescription()을 통해 음반의 설명을 가져옵니다.
					        String descriptionText = rs.getString("a_desciption"); 
					
					        // descriptionText가 null이 아니고, 길이가 80자보다 긴 경우
					        if (descriptionText != null && descriptionText.length() > 80) {
					            // description이 80자를 초과하면 80자까지 잘라내고 '...'을 추가합니다.
					            descriptionText = descriptionText.substring(0, 80) + "...";
					        } else if (descriptionText == null) {
					            // 만약 description이 null이면 빈 문자열로 설정합니다.
					            descriptionText = "";
					        }
					    %>
					    <!-- 처리된 descriptionText를 출력합니다. 80자 이상인 경우 잘린 텍스트와 '...'이 포함되어 출력됩니다. -->
					    <%= descriptionText %>
					    <!-- 80자 미만일경우 --> 
					</p>
	
					<p><%=rs.getString("a_unitPrice") %><fmt:message key="won" /></p>
					<p><a href="./album.jsp?id=<%=rs.getString("a_id") %>" class="btn btn-secondary" role="button"> <fmt:message key="description2" /> <i class="bi bi-box-arrow-in-right"></i></a><!-- 상세정보 -->					
				</div>
			</div>
			<%
				}
				if (rs!=null)
					rs.close();
				if (pstmt!=null)
					pstmt.close();
				if (conn!=null)
					conn.close();
			%>
		</div>
		<%@ include file="footer.jsp" %>
	</div>
	</fmt:bundle>

</body>
</html>