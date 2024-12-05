<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ page import="java.sql.*" %>    
<%@ page import="java.util.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");

	String filename="";
	String realFolder="C:\\web\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\AlbumMarket\\resources\\images";
	String encType="utf-8";
	int maxSize=100*1024*1024;
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String albumId = multi.getParameter("albumId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String singer = multi.getParameter("singer");
	String publisher = multi.getParameter("publisher");
	String releaseDate = multi.getParameter("releaseDate");
	String description = multi.getParameter("description");	
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");	
	String condition = multi.getParameter("condition");
	
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	int price;
	
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
	ResultSet rs=null;
	
	String sql="SELECT * FROM album WHERE a_id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,albumId);
	rs=pstmt.executeQuery();
	
	
	if(rs.next()) {
		if (fileName != null){
			sql="UPDATE album SET a_name=?, a_unitPrice=? ,a_singer=?, a_desciption=?, a_publisher=?, a_category=?, a_unitsInStock=?, a_releaseDate=?, a_condition=?, a_fileName=? WHERE a_id=?";
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1,name);
			pstmt.setInt(2,price);
			pstmt.setString(3,singer);
			pstmt.setString(4,description);
			pstmt.setString(5,publisher);
			pstmt.setString(6,category);
			pstmt.setLong(7,stock);
			pstmt.setString(8,releaseDate);
			pstmt.setString(9,condition);
			pstmt.setString(10,fileName);
			pstmt.setString(11,albumId);
			pstmt.executeUpdate();
			
		
		} else {
			sql="UPDATE album SET a_name=?, a_unitPrice=?, a_singer=?, a_desciption=?, a_publisher=?, a_category=?, a_unitsInStock=?, a_releaseDate=?, a_condition=? WHERE a_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setInt(2,price);
			pstmt.setString(3,singer);
			pstmt.setString(4,description);
			pstmt.setString(5,publisher);
			pstmt.setString(6,category);
			pstmt.setLong(7,stock);
			pstmt.setString(8,releaseDate);
			pstmt.setString(9,condition);
			pstmt.setString(10,albumId);
			pstmt.executeUpdate();
			
			
		}
	}
	//System.out.print(singer);
	if (pstmt!=null)
		pstmt.close();
	if (conn!=null)
		conn.close();
	response.sendRedirect("editAlbum.jsp?edit=update");
	
%>