<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ page import="java.util.ArrayList" %>    
<%@ page import="java.net.URLDecoder" %>
<%@ page import="dto.Album" %>
<%@ page import="dao.AlbumRepository" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	request.setCharacterEncoding("utf-8");

	String cartId=session.getId();
	
	String shipping_cartId="";
	String shipping_name="";
	String shipping_shippingDate ="";
	String shipping_country ="";
	String shipping_zipCode ="";
	String shipping_addressName ="";
	
	Cookie[] cookies = request.getCookies();
	
	if (cookies!=null) {
		for (int i=0; i<cookies.length; i++) {
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			if (n.equals("Shipping_cartId"))
				shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_name"))
				shipping_name = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_shippingDate"))
				shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_country"))
				shipping_country = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_zipCode"))
				shipping_zipCode = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_addressName"))
				shipping_addressName = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		}
	}
%>
<!DOCTYPE html>

<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"><meta charset="utf-8">
<meta charset="utf-8">
<title>주문정보</title>
</head>
<body>

	<fmt:setLocale value='<%=request.getParameter("language") %>' />
    <fmt:bundle basename="bundle.message">
    
    <div class="container py-4">
    	<%@include file="menu.jsp" %>
    	
    		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
    			<div class="container-fluid py-5">
    				<h1 class="disPlay-5 fw-bold"><fmt:message key="orderinfo" /></h1><!-- 주문 정보 -->
    				<p class="col-md-8 fs-4">Order Info</p>
    			</div>
    		</div>
    		
    		<div class="row align-items-md-stretch alert alert-info">
 				<div class="text-center">
 					<h1>영수증</h1><!-- 영수증 -->
 				</div>	   		
 				<div class="row justify-content-between">
 					<div class="col-4" align="left">
 					
 						<strong><fmt:message key="useraddress2" /></strong><!-- 배송 주소 --> <br>
 						<fmt:message key="username" /> : <% out.println(shipping_name); %> <br><!-- 성명 -->
 						<fmt:message key="zipcode" /> : <% out.println(shipping_zipCode); %> <br><!-- 우편번호 -->
 						<fmt:message key="useraddress" /> : <% out.println(shipping_addressName); %>( <%out.println(shipping_country);%>)<!-- 주소 -->
 					</div>
 					<div class="col-4" align="right">
 						<p><em><fmt:message key="deliverydate" /> : <% out.println(shipping_shippingDate); %> </em></p><!-- 배송일 -->
 					</div>
 				</div>
 				<div class="py-5">
 					<table class="table table-hover">
 					<tr>
 						<th class="text-center"><fmt:message key="album" /></th><!-- 음반 -->
 						<th class="text-center">#</th>
 						<th class="text-center"><fmt:message key="unitPrice" /></th><!-- 가격 -->
 						<th class="text-center"><fmt:message key="subtotal" /></th><!-- 소계 -->
 					</tr>
 					<%
 						int sum=0;
 						ArrayList<Album> cartList = (ArrayList<Album>) session.getAttribute("cartlist");
 						if(cartList==null)
 							cartList = new ArrayList<Album>();
 						for (int i=0; i<cartList.size(); i++) { //상품리스트 하나씩 출력하기
 							Album album = cartList.get(i);
 						int total = album.getUnitPrice() * album.getQuantity();
 						sum = sum + total;
 					%>
 					<tr>
 						<td class="text-center"><em><%=album.getName() %></em></td>
 						<td class="text-center"><%=album.getQuantity() %></td>
 						<td class="text-center"><%=album.getUnitPrice() %></td>
 						<td class="text-center"><%=total %><fmt:message key="won" /></td><!-- 원 -->
 					</tr>
 					<%
 						}
 					%>
 					<tr>
 						<td></td>
 						<td></td>
 						<td class="text-right"><strong><fmt:message key="totalamount" /> : </strong></td><!-- 총액 -->
 						<td class="text-center text-danger"><strong><%=sum %></strong></td>
 					</tr>
 					</table>
 					<a href="./shippingInfo.jsp?cartId=<%= shipping_cartId%>" class="btn btn-secondary" role="button"> <fmt:message key="before" /> </a><!-- 이전 -->
 					<a href="./thankCustomer.jsp" class="btn btn-success" role="button"> <fmt:message key="ordercompleted" /> </a><!-- 주문 완료 -->
 					<a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button"> <fmt:message key="cancel" /> </a><!-- 취소 -->
 				</div>
    		</div>
    	
    	<%@ include file="footer.jsp" %>
    </div>
    
    </fmt:bundle>
    
</body>
</html>