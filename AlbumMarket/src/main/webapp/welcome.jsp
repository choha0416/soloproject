<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ page import="java.util.Date" %>    
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
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script type="text/javascript" src="./resources/js/time.js"></script>
<link rel="icon" href="resources/images/icon.png" sizes="32x32" type="/image/png">

<title>Welcome</title>

<style>

    .carousel {
        width: 50%;
        margin: 0 auto;
    }


    @media (max-width: 768px) {
        .carousel {
            width: 100%; 
        }
    }
</style>

</head>
<body>
	
	<fmt:bundle basename="bundle.message">
	<div class="container py-4">
	
		<%@ include file="menu.jsp" %>
		<%! 
			
			String tagline="Welcome to web Market";
		%>
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold"><fmt:message key="greeting" /></h1>
				<p class="col-md-8 fs-4">MusicAlbum Maket</p>
			</div>
		</div>
		<!-- 캐러셀 나중에db연동으로 변경할것 -->
		<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="resources/images/ISANHZ1106.jpg" class="d-block w-100" alt="...">
		    <div class="carousel-caption d-none d-md-block">
		        <h5>FALLIN'</h5>
		        <p>헤이즈(Heize)</p>
		      </div>
		    </div>
		    <div class="carousel-item">
		      <img src="resources/images/ISANBD1113.jpg" class="d-block w-100" alt="...">
		    <div class="carousel-caption d-none d-md-block">
		        <h5>Blue Ocean</h5>
		        <p>이바다(LEEBADA))</p>
		      </div>
		    </div>
		    <div class="carousel-item">
		      <img src="resources/images/ISANRT1105.jpg" class="d-block w-100" alt="...">
		   <div class="carousel-caption d-none d-md-block">
		        <h5>너의 계절이 돌아올거야</h5>
		        <p>로시(Rothy)</p>
		      </div>
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
			


		<div class="row algin-items-md-stretch text-center">
			<div class="col-md-12">
				<div class="h-100 p-5">
					<h3><a href="albums.jsp" class="link-dark text-decoration-none"><fmt:message key="tagline" /></a></h3>
					<p id="current-time">현재 접속 시각: </p>
				</div>
			</div>	
		</div>
	<%@ include file="footer.jsp" %>
	</div>
	</fmt:bundle>

</body>
</html>
