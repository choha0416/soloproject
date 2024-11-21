<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.Date" %>    
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
 
<meta charset="utf-8">
<title>Welcome</title>

</head>
<body>
<div class="container py-4">
<%@ include file="menu.jsp" %>
<%! 
	String greeting="음식 쇼핑몰에 오신것을 환영합니다";
	String tagline="Welcome to web Market";
%>
</div>



</body>
</html>