<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>

    <fmt:setLocale value='<%=request.getParameter("language") %>' />
    <fmt:bundle basename="bundle.message">
        <header class="pb-3 mb-5 border-bottom">
        	
            <div class="d-flex justify-content-between align-items-center ">
                <!-- 홈 링크 -->
                <a href="./welcome.jsp" class="d-flex align-items-center text-dark text-decoration-none ">
                   <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-vinyl-fill" viewBox="0 0 16 16">
					  <path d="M8 6a2 2 0 1 0 0 4 2 2 0 0 0 0-4m0 3a1 1 0 1 1 0-2 1 1 0 0 1 0 2"/>
					  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M4 8a4 4 0 1 0 8 0 4 4 0 0 0-8 0"/>
					</svg>
                    <span class="fs-4">AlbumMarket</span>
                </a>

                <!-- 언어 선택 링크 -->
                <div>
                	<!-- &id=<%= request.getParameter("id") %> 언어선택후 새로고침시 id정보 유지 -->
                    <a class="text-decoration-none text-muted custom-hover" href="?language=ko&id=<%= request.getParameter("id") %>">Korean</a> |
                    <a class="text-decoration-none text-muted custom-hover" href="?language=en&id=<%= request.getParameter("id") %>">English</a>
                </div>
            </div>   
            <nav class="py-2 bg-body-tertiary">
		    <div class="container d-flex flex-wrap">
		      <ul class="nav me-auto">
		        <li class="nav-item"><a href="./welcome.jsp" class="nav-link link-body-emphasis px-2 active" aria-current="page">Home</a></li>
		        <li class="nav-item"><a href="./albums.jsp" class="nav-link link-body-emphasis px-2">Album List</a></li>
		        <li class="nav-item"><a href="./cart.jsp" class="nav-link link-body-emphasis px-2">Cart</a></li>
		        <li class="nav-item"><a href="./editAlbum.jsp?edit=update" class="nav-link link-body-emphasis px-2">Album Edit</a></li>
		        <li class="nav-item"><a href="#" class="nav-link link-body-emphasis px-2">About</a></li>
		      </ul>
		      <!-- 
		      <ul class="nav">
		        <li class="nav-item"><a href="#" class="nav-link link-body-emphasis px-2">Login</a></li>
		        <li class="nav-item"><a href="#" class="nav-link link-body-emphasis px-2">Sign up</a></li>
		      </ul>
		       -->
		       <form class="col-12 col-lg-auto mb-3 mb-lg-0" role="search">
        <input type="search" class="form-control" placeholder="Search..." aria-label="Search">
      </form>
		    </div>
		  </nav>                       
        </header>    
		 
    </fmt:bundle>
</body>
</html>
