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
<meta charset="utf-8">
<title>주문 취소</title>
</head>
<body>

	<fmt:bundle basename="bundle.message">
    
    <div class="container py-4">
	    <%@include file="menu.jsp" %>
	    	
	    	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
	    		<div class="container-fluid py-5">
	    			<h1 class="display-5 fw-bold"><fmt:message key="ordercancellation" /></h1><!--주문 취소  -->
	    			<p class="col-md-8 fs-4">Order Cancellation</p>
	    		</div>
	    	</div>
	    	<div class="row align-items-md-stretch">
	    		<h2 class="alert alert-danger"><fmt:message key="cancelment" /></h2><!--  주문이 취소되었습니다-->
	    	</div>
	    	<div class="container">
	    		<p><a href="./albums.jsp" class="btn btn-secondary"><i class="bi bi-box-arrow-in-left"></i><fmt:message key="albumList" /></a></p><!-- 음반 목록 -->
	    	</div>
	    <%@ include file="footer.jsp" %>
    </div>
    
    </fmt:bundle>
</body>
</html>