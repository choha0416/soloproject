<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"><meta charset="utf-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />

</head>
<body>
<fmt:setLocale value='<%=request.getParameter("language") %>' />
    <fmt:bundle basename="bundle.message">
<div class="container">
  <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
    <div class="col-md-4 d-flex align-items-center">
      <a href="./welcome.jsp" class="mb-3 me-2 mb-md-0 text-body-secondary text-decoration-none lh-1">
       <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-vinyl-fill" viewBox="0 0 16 16">
					  <path d="M8 6a2 2 0 1 0 0 4 2 2 0 0 0 0-4m0 3a1 1 0 1 1 0-2 1 1 0 0 1 0 2"/>
					  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M4 8a4 4 0 1 0 8 0 4 4 0 0 0-8 0"/>
					</svg>
      </a>
      <span class="mb-3 mb-md-0 text-body-secondary">&copy; AlbumMarket</span>
    </div>

    <ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
      <li class="ms-3"><a class="text-body-secondary" href="https://www.facebook.com/"><i class="bi bi-facebook"></i></a></li>
      <li class="ms-3"><a class="text-body-secondary" href="https://x.com/"><i class="bi bi-twitter"></i></a></li>
      <li class="ms-3"><a class="text-body-secondary" href="https://www.instagram.com/"><i class="bi bi-instagram"></i></a></li>
    </ul>
  </footer>
</div>
</fmt:bundle>
</body>
</html>