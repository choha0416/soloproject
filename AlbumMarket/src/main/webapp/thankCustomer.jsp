<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%> 
<%@ page import="java.net.URLDecoder" %>
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
<title>주문 완료</title>
</head>
<body>

<%
	String shipping_cartId="";
	String shipping_name="";
	String shipping_shippingDate ="";
	String shipping_country ="";
	String shipping_zipCode ="";
	String shipping_addressName ="";
	
	Cookie[] cookies = request.getCookies();
	
	if (cookies !=null) {
		for (int i=0; i<cookies.length; i++) {
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			if(n.equals("Shipping_cartId"))
				shipping_cartId=URLDecoder.decode((thisCookie.getValue()),"utf-8");
			if(n.equals("Shipping_shippingDate"))
				shipping_shippingDate=URLDecoder.decode((thisCookie.getValue()),"utf-8");
		}
	}
%>


	<fmt:bundle basename="bundle.message">
    
    <div class="container py-4">
	    <%@include file="menu.jsp" %>
	    	
	    	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
	    		<div class="container-fluid py-5">
	    			<h1 class="display-5 fw-bold"><fmt:message key="ordercompleted" /></h1><!--주문 완료  -->
	    			<p class="col-md-8 fs-4">Order Completed</p>
	    		</div>
	    	</div>
	    	<div class="row align-items-md-strech">
	    		<h2 class="alert alert-success"><fmt:message key="orderment" /></h2><!--주문해주셔서 감사합니다  -->
	    		<p> <fmt:message key="dedament" /> <% out.println(shipping_shippingDate); %><fmt:message key="dedament2" /></p><!--에 배송될 예정입니다!  -->
	    		<p> <fmt:message key="cartId" /> : <% out.println(shipping_cartId); %> </p>
	    	</div>
	    	<div class="container">
	    		<p><a href="./albums.jsp" class="btn btn-secondary"><i class="bi bi-box-arrow-in-left"></i><fmt:message key="albumList" /></a></p><!-- 음반 목록 -->
	    	</div>
	    <%@ include file="footer.jsp" %>
    </div>
    
    </fmt:bundle>
</body>
</html>
<%
	session.invalidate(); //세션내용 삭제
	
	for (int i=0; i<cookies.length; i++){
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		if(n.equals("Shipping_cartId"))
			thisCookie.setMaxAge(0);
		if(n.equals("Shipping_name"))
			thisCookie.setMaxAge(0);
		if(n.equals("Shipping_shippingDate"))
			thisCookie.setMaxAge(0);
		if(n.equals("Shipping_country"))
			thisCookie.setMaxAge(0);
		if(n.equals("Shipping_zipCode"))
			thisCookie.setMaxAge(0);
		if(n.equals("Shipping_addressName"))
			thisCookie.setMaxAge(0);
		
		response.addCookie(thisCookie);
	}
%>