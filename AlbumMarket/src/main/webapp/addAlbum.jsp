<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"><meta charset="utf-8">
<title>앨범 등록</title>
</head>
<body>
	<div class="container py-4">
		<%@ include file="menu.jsp" %>
			<div class="p-5 mb-4 bg-body-tertiary rounded-3">
				<div class="container-fluid py-5">
					<h1 class="display-5 fw-bold">음반 등록</h1>
					<p class="col-md-8 fs-4">Album Addition</p>
				</div>
			</div>
			
			<div class="row align-items-md-stretch">
				<form name="newAlbum" action="./processAddAlbum.jsp" method="post">
					<div class="mb-3 row">
						<label class="col-sm-2">음반코드</label>
						<div class="col-sm-3">
							<input type="text" name="albumId" class="form-control">
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">가격</label>
						<div class="col-sm-3">
							<input type="text" name="unitPrice" class="form-control">
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">가수</label>
						<div class="col-sm-3">
							<input type="text" name="singer" class="form-control">
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">배급사</label>
						<div class="col-sm-3">
							<input type="text" name="publisher" class="form-control">
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">발매일</label>
						<div class="col-sm-3">
							<input type="text" name="releaseDate" class="form-control">
						</div>
					</div>
					
					<div class="mb-3 row">
						<label class="col-sm-2">앨범설명</label>
						<div class="col-sm-5">
							<textarea name="description" cols="50" row="2" class="form-control" placeholder="100자 이상 적어주세요"></textarea>
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">장르</label>
						<div class="col-sm-3">
							<input type="text" name="category" class="form-control">
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">재고수</label>
						<div class="col-sm-3">
							<input type="text" name="unitInStock" class="form-control">
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">상태</label>
						<div class="col-sm-5">
							<input type="radio" name="condition" value="New"> 미개봉앨범
							<input type="radio" name="condition" value="Old"> 개봉앨범
							<input type="radio" name="condition" value="Limited"> 한정앨범
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" class="btn btn-primary" value="등록">
						</div>
					</div>
				</form>
			</div>
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>