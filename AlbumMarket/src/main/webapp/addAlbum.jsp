<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
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
<fmt:setLocale value="<%= language %>" />
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"><meta charset="utf-8">
<!-- <link rel="stylesheet" href="./resources/css/bootstrap.min.css" /> -->
<script type="text/javascript" src="./resources/js/validation.js"></script>
<title>음반 등록</title>
</head>
<body>

	<fmt:bundle basename="bundle.message">
	
	<div class="container py-4">
		<%@ include file="menu.jsp" %>
			<div class="p-5 mb-4 bg-body-tertiary rounded-3">
				<div class="container-fluid py-5">
					<h1 class="display-5 fw-bold"><fmt:message key="title" /></h1>
					<p class="col-md-8 fs-4">Album Addition</p>
				</div>
			</div>
			<div class="row align-items-md-stretch">
				<div class="text-end">
					<a href="logout.jsp" class="btn btn-sm btn-success pull right">logout</a>
				</div>
					<form name="newAlbun" action="./processAddAlbum.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
			
				
					<div class="mb-3 row">
						<label class="col-sm-2"><fmt:message key="albumID" /></label>
						<div class="col-sm-3">
							<input type="text" id="albumId" name="albumId" class="form-control">
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2"><fmt:message key="name" /></label>
						<div class="col-sm-3">
							<input type="text" id="name" name="name" class="form-control">
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2"><fmt:message key="unitPrice" /></label>
						<div class="col-sm-3">
							<input type="text" id="unitPrice" name="unitPrice" class="form-control">
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2"><fmt:message key="singer" /></label>
						<div class="col-sm-3">
							<input type="text" name="singer" class="form-control">
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2"><fmt:message key="publisher" /></label>
						<div class="col-sm-3">
							<input type="text" name="publisher" class="form-control">
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2"><fmt:message key="releaseDate" /></label>
						<div class="col-sm-3">
							<input type="text" name="releaseDate" class="form-control">
						</div>
					</div>
					
					<div class="mb-3 row">
						<label class="col-sm-2"><fmt:message key="description" /></label>
						<div class="col-sm-5">
							<textarea name="description" id="description" cols="50" row="2" class="form-control" placeholder="<fmt:message key="placeholder" />"></textarea>
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2"><fmt:message key="category" /></label>
						<div class="col-sm-3">
							<input type="text" name="category" class="form-control">
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2"><fmt:message key="unitInStock" /></label>
						<div class="col-sm-3">
							<input type="text" id="unitInStock" name="unitInStock" class="form-control">
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2"><fmt:message key="condition" /></label>
						<div class="col-sm-5">
							<input type="radio" name="condition" value="New"> <fmt:message key="condition_New" />
							<input type="radio" name="condition" value="Old"> <fmt:message key="condition_Old" />
							<input type="radio" name="condition" value="Limited"> <fmt:message key="condition_Limited" />
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2"><fmt:message key="albumImage" /></label>
						<div class="col-sm-5">
							<input type="file" name="AlbumImage" class="form-control">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" class="btn btn-primary" value="<fmt:message key="button" />" onclick="CheckAddAlbum()">
						</div>
					</div>
				</form>
			</div>
		<%@ include file="footer.jsp" %>
	</div>
	</fmt:bundle>

</body>
</html>