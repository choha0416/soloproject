<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ page import="dto.Album" %>
<%@ page import="dao.AlbumRepository" %>   
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ include file ="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	String filename="";
	// C:\\web 현재 프로젝트가 생성된 위치 경로
	String realFolder="C:\\web\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\AlbumMarket\\resources\\images";
	
	int maxSize=100 * 1024 * 1024; //최대 업로드 될 파일의 크기 5mb
	String encType="utf-8";
	//파일 업로드 MultipartRequest
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String albumId = multi.getParameter("albumId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String singer = multi.getParameter("singer");
	String description = multi.getParameter("description");
	String publisher = multi.getParameter("publisher");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String releaseDate = multi.getParameter("releaseDate");
	String condition = multi.getParameter("condition");
	
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	Integer price;
	
	if (unitPrice.isEmpty())
		price=0;
	else
		price=Integer.valueOf(unitPrice);
	
	long stock;
	
	if (unitsInStock.isEmpty())
		stock=0;
	else
		stock=Long.valueOf(unitsInStock);
	
	PreparedStatement pstmt=null;
	
	String sql="INSERT INTO album VALUES(?,?,?,?,?,?,?,?,?,?,?)";
			
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,albumId);
	pstmt.setString(2,name);
	pstmt.setInt(3,price);
	pstmt.setString(4,singer);
	pstmt.setString(5,description);
	pstmt.setString(6,publisher);
	pstmt.setString(7,category);
	pstmt.setLong(8,stock);
	pstmt.setString(9,releaseDate);
	pstmt.setString(10,condition);
	pstmt.setString(11,fileName);
	
	if (pstmt!=null)
		pstmt.close();
	if (conn!=null)
		conn.close();
	
	AlbumRepository dao = AlbumRepository.getInstance();
	
	Album newAlbum = new Album();
	newAlbum.setAlbumId(albumId);
	newAlbum.setName(name);
	newAlbum.setUnitPrice(price);
	newAlbum.setSinger(singer);
	newAlbum.setDescription(description);
	newAlbum.setPublisher(publisher);
	newAlbum.setCategory(category);
	newAlbum.setUnitsInStock(stock);
	newAlbum.setReleaseDate(releaseDate);
	newAlbum.setCondition(condition);
	newAlbum.setFilename(fileName);
	dao.addAlbum(newAlbum);
	
	response.sendRedirect("albums.jsp");
%>
</body>
</html>