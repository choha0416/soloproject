<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Album" %>
<jsp:useBean id="AlbumDAO" class="dao.AlbumRepository" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"><meta charset="utf-8">
 
<meta charset="utf-8">
<title>음반 목록</title>
</head>
<body>
	<div class="container py-4">
		<%@ include file="menu.jsp" %>
		
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">음반 목록</h1>
				<p class="col-md-8 fs-4">AlbumList</p>
			</div>
		</div>
		<%
			ArrayList<Album> listOfAlbums = AlbumDAO.getAllAlbums();
		%>
		
		<div class="row align-items-md-strech text-center">
			<%
				for (int i=0; i< listOfAlbums.size(); i++) {
					Album album = listOfAlbums.get(i);				
			%>
			<div class="col-md-4">
				<div class="h-100 p-2">
					
					<h5><b><%=album.getName() %></b></h5>
					<p><%=album.getSinger() %></p>
					<p><%=album.getPublisher() %></p>
					<P><%=album.getDescription().substring(0,80) %>...</P>
					<p><%=album.getUnitPrice() %>원</p>
					<p><a href="./album.jsp?id=<%=album.getAlbumId() %>" class="btn btn-secondary" role="button"> 상세 정보 <i class="bi bi-box-arrow-in-right"></i></a>					
				</div>
			</div>
			<%
				}
			%>
		</div>
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>