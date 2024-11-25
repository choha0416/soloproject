<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ page import="dto.Album" %>
<%@ page import="dao.AlbumRepository" %>
<jsp:useBean id="AlbumDAO" class="dao.AlbumRepository" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"><meta charset="utf-8">
<title>음반 정보</title>
</head>
<body>
	<div class="container py-4">
		<%@ include file="menu.jsp" %>
		
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">음반 정보</h1>
				<p class="col-md-8 fs-4">AlbumInfo</p>
			</div>
		</div>	
		<%
			String id = request.getParameter("id");
			AlbumRepository dao = AlbumRepository.getInstance();
			Album album = dao.getAlbumById(id);
		%>
		<div class = "row align-items-md-stretch">
			<div class="col-md-12">
				<h3><b><%=album.getName() %></b></h3>
				<p><%=album.getDescription() %></p>
				<p><b>음반코드 : </b><span class="badge text-bg-danger"><%=album.getAlbumId() %></span></p>
				<p><b>가수 : </b><%=album.getSinger() %></p>
				<p><b>배급사 : </b><%=album.getPublisher() %></p>
				<p><b>발매일 : </b><%=album.getReleaseDate() %></p>
				<p><b>장르 : </b><%=album.getCategory() %></p>
				<p><b>재고수 : </b><%=album.getUnitInStock() %></p>
				<h4><%=album.getUnitPrice() %>원</h4>
				<div class="d-flex justify-content-start align-items-center">
    				<p><a href="#" class="btn btn-info me-2 d-flex align-items-center">
        		 	<i class="bi bi-cart-plus"></i> 음반 주문<!-- 앨범 주문과 오른쪽 화살표 간의 간격 -->
    				</a></p>
    				<p><a href="./albums.jsp" class="btn btn-secondary"> <i class="bi bi-box-arrow-in-left"></i>음반 목록</a></p>
				</div>

			</div>
		</div>
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>