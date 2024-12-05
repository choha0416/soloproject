<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
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
<title>음반 수정</title>
</head>
<body>
    <fmt:bundle basename="bundle.message">
    <div class="container py-4">
        <%@ include file="menu.jsp" %>
        <div class="p-5 mb-4 bg-body-tertiary rounded-3">
            <div class="container-fluid py-5">
                <h1 class="display-5 fw-bold"><fmt:message key="albumUpdating" /></h1><!-- 음반 편집 -->
                <p class="col-md-8 fs-4">Album Updating</p>
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
      <div class="row align-items-md-stretch">
      	<div class="col-md-5 mb-3">
      		<img src="./resources/images/<%=rs.getString("a_filename")%>" alt="image" class="img-fluid" style="width:100%"/>
      	</div>
      	<div class="col-md-7">
      		<form name="newAlbum" action="./processUpdateAlbum.jsp" method="post" enctype="multipart/form-data">
      		<div class="mb-3 row">
      			<label class="col-sm-2"><fmt:message key="albumID" /></label>
      			<div class="col-sm-5">
      			<input type="text" name="albumId" id="albumId" class="form-control" value='<%=rs.getString("a_id")%>'readonly>
      			</div>
      		</div>
      		<div class="mb-3 row">
      			<label class="col-sm-2"><fmt:message key="name" /></label>
      			<div class="col-sm-5">
      			<input type="text" name="name" id="name" class="form-control" value='<%=rs.getString("a_name")%>'>      			
      			</div>
      		</div>
       		<div class="mb-3 row">
      			<label class="col-sm-2"><fmt:message key="unitPrice" /></label>
      			<div class="col-sm-5">
      			<input type="text" name="unitPrice" id="unitPrice" class="form-control" value='<%=rs.getString("a_unitPrice")%>'>      			
      			</div>
      		</div> 
      		<div class="mb-3 row">
      			<label class="col-sm-2"><fmt:message key="singer" /></label>
      			<div class="col-sm-5">
      			<input type="text" name="singer" id="singer" class="form-control" value='<%=rs.getString("a_singer")%>'>      			
      			</div>
      		</div>    
      		<div class="mb-3 row">
      			<label class="col-sm-2"><fmt:message key="publisher" /></label>
      			<div class="col-sm-5">
      			<input type="text" name="publisher" id="publisher" class="form-control" value='<%=rs.getString("a_publisher")%>'>      			
      			</div>
      		</div>      
      		<div class="mb-3 row">
      			<label class="col-sm-2"><fmt:message key="releaseDate" /></label>
      			<div class="col-sm-5">
      			<input type="text" name="releaseDate" id="releaseDate" class="form-control" value='<%=rs.getString("a_releaseDate")%>'>      			
      			</div>
      		</div>  
      		<div class="mb-3 row">
      			<label class="col-sm-2"><fmt:message key="description" /></label>
      			<div class="col-sm-8">
      			<textarea name="description" id="description" cols="50" rows="2" class="form-control" placeholder="100자 이상 적어주세요"><%=rs.getString("a_desciption")%></textarea>     			
      			</div>
      		</div>        
      		<div class="mb-3 row">
      			<label class="col-sm-2"><fmt:message key="category" /></label>
      			<div class="col-sm-5">
      			<input type="text" name="category" id="category" class="form-control" value='<%=rs.getString("a_category")%>'>      			
      			</div>
      		</div>     
      		<div class="mb-3 row">
      			<label class="col-sm-2"><fmt:message key="unitInStock" /></label>
      			<div class="col-sm-5">
      			<input type="text" name="unitsInStock" id="unitsInStock" class="form-control" value='<%=rs.getString("a_unitsInStock")%>'>      			
      			</div>
      		</div>    
      		<div class="mb-3 row">
      			<label class="col-sm-2"><fmt:message key="condition" /></label>
      			<div class="col-sm-5">
      			<div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="condition" value="New"> <fmt:message key="condition_New" />
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="condition" value="Old"> <fmt:message key="condition_Old" />
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="condition" value="Limited"> <fmt:message key="condition_Limited" />
                </div>
      			</div>
      		</div> 
  		  	<div class="mb-3 row">
  		  	<label class="col-sm-2"><fmt:message key="albumImage" /></label>
  		  	<div class="col-sm-8">
  		  	<input type="file" name="albumImage" class="form-control">
  		  	</div>
  		  	</div>
  		  	<div class="mb-3 row">
  		  		<div class="col-sm-offset-2 col-sm-10">
  		  			<input type="submit" class="btn btn-primary" value="<fmt:message key="button" />">
  		  		</div>
  		  	</div>   		     		     		 		 			
      		</form>
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
