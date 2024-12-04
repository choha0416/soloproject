<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ page import="dto.Album" %>
<%@ page import="dao.AlbumRepository" %>
<%@ page errorPage="exceptionNoAlbumId.jsp" %>
<%@ page import="java.sql.*" %>  
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
<link rel="icon" href="resources/images/icon.png" sizes="32x32" type="/image/png">
<title>음반 정보</title>
<script type="text/javascript">
	function addToCart() {
		if (confirm("음반을 장바구니에 추가하시겠습니까?")){
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
</script>
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
				<h1 class="display-5 fw-bold"><fmt:message key="albumInfo" /></h1>
				<p class="col-md-8 fs-4">AlbumInfo</p>
			</div>
		</div>	
		<%@ include file="dbconn.jsp" %>
        <%
            String albumId = request.getParameter("id");
            System.out.println("앨범 ID: " + albumId);  // 디버깅: 앨범 ID 확인
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            String sql = "SELECT * FROM album WHERE a_id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, albumId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                System.out.println("앨범 데이터 조회 성공");
        %>
		<div class = "row align-items-md-stretch">
			<div class="col-md-5">
				<img src="./resources/images/<%=rs.getString("a_filename")%>" style="width:70%">
			</div>	
			<!-- 앨범 정보 불러오기 getter사용 -->
			<div class="col-md-6">
				<h3><b><%=rs.getString("a_name")%>  </b></h3>
				<p  class="description"><%=rs.getString("a_desciption")%></p>
				<p><b><fmt:message key="albumID" /> : </b><span class="badge text-bg-danger"><%=rs.getString("a_id")%></span></p><!-- 음반코드 -->
				<p><b><fmt:message key="singer" /> : </b><%=rs.getString("a_singer")%>   </p><!-- 가수 -->
				<p><b><fmt:message key="publisher" /> : </b><%=rs.getString("a_publisher")%></p><!-- 배급사 -->
				<p><b><fmt:message key="releaseDate" /> : </b><%=rs.getString("a_releaseDate")%></p><!-- 발매일 -->
				<p><b><fmt:message key="category" /> : </b><%=rs.getString("a_category")%></p><!-- 장르 -->
				<p><b><fmt:message key="unitInStock" /> : </b><%=rs.getString("a_unitsInStock")%></p><!-- 재고 -->
				<h4><%=rs.getString("a_unitPrice")%><fmt:message key="won" /></h4><!-- 가격 -->
				
				<form name="addForm" action="./addCart.jsp?id=<%=rs.getString("a_id")%>" method="post">
				<div class="d-flex justify-content-start align-items-center">
				<p>
				<a href="#" class="btn btn-info me-2 d-flex align-items-center" onclick="addToCart()">
        		 	<i class="bi bi-cart-plus"></i> <fmt:message key="buy" /><!-- 음반 주문  -->
    				</a></p>
    				<p><a href="./cart.jsp" class="btn btn-warning me-2"><i class="bi bi-bag-plus-fill"></i><fmt:message key="cart" /></a></p><!-- 장바구니 -->
    				<p><a href="./albums.jsp" class="btn btn-secondary"> <i class="bi bi-box-arrow-in-left"></i><fmt:message key="albumList" /></a></p><!-- 음반 목록 -->				
				</div>
			</form>
			</div>
		</div>
		        <%
            } else {
                System.out.println("앨범 데이터 조회 실패. ID: " + albumId);
            }
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        %>
		<%@ include file="footer.jsp" %>
	</div>
	</fmt:bundle>

</body>
</html>