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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"><meta charset="utf-8">
 
<meta charset="utf-8">
<link rel="icon" href="resources/images/icon.png" sizes="32x32" type="/image/png">

<title>Welcome</title>

</head>
<body>
	
	<fmt:bundle basename="bundle.message"><!-- 해당 태그 안에 있는범위에 message태그 변환 가능 -->
	<div class="container py-4">
	 <!-- 모듈화 헤더 인클루드 body안 가장큰 <div>의 맨위에 있으므로 바디 맨위로 menu.jsp표시 -->
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
	

		<div class="row algin-items-md-stretch text-center">
			<div class="col-md-12">
				<div class="h-100 p-5">
					<h3><a href="albums.jsp" class="link-dark text-decoration-none"><%=tagline%></a></h3>
					<%// 접속시간 출력
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
	<%@ include file="footer.jsp" %><!-- 푸터 인클루드 -->
	</div>
	</fmt:bundle>

</body>
</html>