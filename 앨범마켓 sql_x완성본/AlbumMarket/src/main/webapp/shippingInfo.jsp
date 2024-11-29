<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"><meta charset="utf-8">   
<meta charset="utf-8">
<title>배송 정보</title>
</head>
<body>

	<fmt:setLocale value='<%=request.getParameter("language") %>' />
	<fmt:bundle basename="bundle.message">

	<div class="container py-4">
		<%@ include file="menu.jsp" %>
		
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold"><fmt:message key="shippinginfo" /></h1><!-- 배송정보 -->
				<p class="col-md-8 fs-4">Shipping info</p>
			</div>		
		</div>
		<div class="row align-items-md-stretch">
			<form action="./processShippingInfo.jsp?cartId=<%=request.getParameter("cartId")%>" method="post">
				<input type="hidden" name="cartId" value="<%=request.getParameter("cartId") %>">			
				<div class="mb-3 row">
					<label class="col-sm-2"><fmt:message key="username" /></label><!-- 성명 -->
					<div class="col-sm-3">
						<input type="text" name="name" class="form-control">
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2"><fmt:message key="deliverydate" /></label><!-- 배송일 -->
					<div class="col-sm-3">
						<input type="text" name="shippingDate" class="form-control">(yyyy/mm/dd)
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2"><fmt:message key="countryname" /></label><!-- 국가명 -->
					<div class="col-sm-3">
						<input type="text" name="country" class="form-control">
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2"><fmt:message key="zipcode" /></label><!-- 우편번호 -->
					<div class="col-sm-3">
						<input type="text" name="zipCode" class="form-control">
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2"><fmt:message key="useraddress" /></label><!-- 주소 -->
					<div class="col-sm-3">
						<input type="text" name="addressName" class="form-control">
					</div>
				</div>
				<div class="mb-3 row">
					<div class="col-sm-offset-2 col-sm-10">
						<a href="./cart.jsp?cartId=<%=request.getParameter("cartId")%>" class="btn btn-secondary" role="button"> <fmt:message key="before" /> </a><!-- 이전 -->
						<input type="submit" class="btn btn-primary" value="<fmt:message key="register" />" /><!-- 등록 -->
						<a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button"> <fmt:message key="cancel" /> </a><!-- 취소 -->
					</div>
				</div>
			</form>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
  	</fmt:bundle>
  	
</body>
</html>