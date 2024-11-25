<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ page import="dto.Album" %>
<%@ page import="dao.AlbumRepository" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	String albumId = request.getParameter("albumId");
	String name = request.getParameter("name");
	String unitPrice = request.getParameter("unitPrice");
	String singer = request.getParameter("singer");
	String description = request.getParameter("description");
	String publisher = request.getParameter("publisher");
	String category = request.getParameter("category");
	String unitInStock = request.getParameter("unitInStock");
	String releaseDate = request.getParameter("releaseDate");
	String condition = request.getParameter("condition");
	
	Integer price;
	
	if (unitPrice.isEmpty())
		price=0;
	else
		price=Integer.valueOf(unitPrice);
	
	long stock;
	
	if (unitInStock.isEmpty())
		stock=0;
	else
		stock=Long.valueOf(unitInStock);
	
	AlbumRepository dao = AlbumRepository.getInstance();
	
	Album newAlbum = new Album();
	newAlbum.setAlbumId(albumId);
	newAlbum.setName(name);
	newAlbum.setUnitPrice(price);
	newAlbum.setSinger(singer);
	newAlbum.setDescription(description);
	newAlbum.setPublisher(publisher);
	newAlbum.setCategory(category);
	newAlbum.setUnitInStock(stock);
	newAlbum.setReleaseDate(releaseDate);
	newAlbum.setCondition(condition);
	
	dao.addAlbum(newAlbum);
	
	response.sendRedirect("albums.jsp");
%>
</body>
</html>