<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ page import="java.util.Date" %>    
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"><meta charset="utf-8">
 
<meta charset="utf-8">
<title>Welcome</title>

</head>
<body>
	<div class="container py-4">
		<%@ include file="menu.jsp" %>
		<%! 
			String greeting="음반 쇼핑몰에 오신것을 환영합니다";
			String tagline="Welcome to web Market";
		%>
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold"><%=greeting%></h1>
				<p class="col-md-8 fs-4">MusicAlbum Maket</p>
			</div>
		</div>
	

		<div class="row algin-items-md-stretch text-center">
			<div class="col-md-12">
				<div class="h-100 p-5">
					<h3><a href="albums.jsp" class="link-dark text-decoration-none"><%=tagline%></a></h3>
					<%
						response.setIntHeader("Refresh",5);//5초마다 자동 페이지 새로고침
						Date day = new java.util.Date();
						String am_pm;
						int hour = day.getHours();
						int minute = day.getMinutes();
						int second = day.getSeconds();
						if (hour / 12 == 0 ) {
							am_pm = "AM";
						} else {
							am_pm = "PM";
							hour = hour - 12;
						}
						String CT = hour + ":" + minute + ":" + second + " " + am_pm;
						out.println("현재 접속 시각: " + CT + "\n");
					%>
				</div>
			</div>	
		</div>
	<%@ include file="footer.jsp" %>
	</div>
</body>
</html>