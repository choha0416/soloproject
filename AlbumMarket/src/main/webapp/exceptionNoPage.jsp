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

<title>페이지 오류</title>
</head>
<body>
	
	<fmt:bundle basename="bundle.message">
	<div class="container py-4">
		<%@ include file="menu.jsp" %>
		
		<div class="jumbotron">
			<div class="container">
				<h2 class="alert alert-danger"><fmt:message key="noPage" /></h2>
			</div>
		</div>
		<div class="container">
		<p><%=request.getRequestURL() %></p>
		<p><a href="albums.jsp" class="btn btn-secondary"><fmt:message key="albumList" /><i class="bi bi-box-arrow-in-right"></i></a></p>
		</div>
		<%@ include file="footer.jsp" %>
	</div>
	</fmt:bundle>
</body>
</html>