<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ page import="java.util.ArrayList" %>    
<%@ page import="dto.Album" %>
<%@ page import="dao.AlbumRepository" %>

<%
	String id = request.getParameter("id");
	if(id==null || id.trim().equals("")) {
		response.sendRedirect("albums.jsp");
		return;
	}
	
	AlbumRepository dao = AlbumRepository.getInstance();
	
	Album album = dao.getAlbumById(id);
	if(album==null) {
		response.sendRedirect("exceptionNoAlbumId.jsp");
	}
	
	ArrayList<Album> cartList = (ArrayList<Album>)session.getAttribute("cartlist");
	Album goodsQnt = new Album();
	for (int i=0; i<cartList.size(); i++) {
		goodsQnt = cartList.get(i);
		if(goodsQnt.getAlbumId().equals(id)){
			cartList.remove(goodsQnt);
		}
	}
	
	response.sendRedirect("cart.jsp");
%>

