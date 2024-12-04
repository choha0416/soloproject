<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Album" %>
<%@ page import="dao.AlbumRepository" %>

<%
	String id = request.getParameter("id");
	if (id==null || id.trim().equals("")) {
		response.sendRedirect("albums.jsp");
		return;
	}
	
	AlbumRepository dao = AlbumRepository.getInstance();
	
	Album album = dao.getAlbumById(id);
	if (album==null) {
		response.sendRedirect("exceptionNoAlbumId.jsp");		
	}
	
	ArrayList<Album> goodsList=dao.getAllAlbums();
	Album goods = new Album();
	for (int i=0; i<goodsList.size(); i++){
		goods = goodsList.get(i);
		if (goods.getAlbumId().equals(id)) {
			break;
		}
	}
	
	ArrayList<Album> list = (ArrayList<Album>) session.getAttribute("cartlist");
	if (list==null) {
		list = new ArrayList<Album>();
		session.setAttribute("cartlist", list);
	}
	
	int cnt=0;
	Album goodsQnt = new Album();
	for (int i=0; i<list.size(); i++) {
		goodsQnt = list.get(i);
		if (goodsQnt.getAlbumId().equals(id)) {
			cnt++;
			int orderQuantity = goodsQnt.getQuantity() + 1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}
	if (cnt==0) {
		goods.setQuantity(1);
		list.add(goods);
	}
	
	response.sendRedirect("album.jsp?id=" + id);
%>