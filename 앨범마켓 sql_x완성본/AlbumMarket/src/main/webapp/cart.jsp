<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ page import="java.util.ArrayList" %>    
<%@ page import="dto.Album" %>
<%@ page import="dao.AlbumRepository" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"><meta charset="utf-8">
    <meta charset="utf-8">
    <title>장바구니</title>
</head>
<body>
<%
	String cartId=session.getId();
%>
    <fmt:setLocale value='<%=request.getParameter("language") %>' />
    <fmt:bundle basename="bundle.message">
    <div class="container py-4">
        <%@ include file="menu.jsp" %>
        
        <div class="p-5 mb-4 bg-body-tertiary rounded-3">
            <div class="container-fluid py-5">
                <h1 class="display-5 fw-bold"><fmt:message key="cart" /></h1>
                <p class="col-md-8 fs-4">Cart</p>
            </div>
        </div>
        
        <div class="row align-items-md-stretch">
            <div class="row">
                <table width="100%">
                    <tr>
                        <td align="left">
                            <a href="./deleteCart.jsp?cartId=<%=cartId %>" class="btn btn-danger"><fmt:message key="delete" /></a><!-- 삭제하기 -->
                        </td>
                        <td align="right">
                            <a href="./shippingInfo.jsp?cartId=<%=cartId %>" class="btn btn-success"><fmt:message key="order" /></a><!-- 주문하기 -->
                        </td>
                    </tr>
                </table>
            </div>
            <div style="padding-top: 50px">
                <table class="table table-hover">
                    <tr>
                        <th><fmt:message key="album" /></th><!-- 음반 -->
                        <th><fmt:message key="unitPrice" /></th><!-- 가격 -->
                        <th><fmt:message key="quantity" /></th><!-- 수량 -->
                        <th><fmt:message key="subtotal" /></th><!-- 소계 -->
                        <th><fmt:message key="note" /></th><!-- 비고 -->
                    </tr>
                    <%
                        int sum = 0;
                        ArrayList<Album> cartList = (ArrayList<Album>) session.getAttribute("cartlist");
                        if (cartList == null) 
                            cartList = new ArrayList<Album>();
                           
                        for (int i = 0; i < cartList.size(); i++) {
                            Album album = cartList.get(i);
                            int total = album.getUnitPrice() * album.getQuantity();
                            sum = sum + total;
                            // Debugging 
                            System.out.println("Album in cart: " + album.getAlbumId() + " - " + album.getName() + " Quantity: " + album.getQuantity() + " Total: " + total);
                    %>
                    <tr>
                        <td><%=album.getAlbumId() %> - <%=album.getName() %></td>
                        <td><%=album.getUnitPrice() %></td>
                        <td><%=album.getQuantity() %></td>
                        <td><%=total %></td>
                        <td><a href="./removeCart.jsp?id=<%=album.getAlbumId()%>" class="badge text-bg-danger"><fmt:message key="delete" /></a></td><!-- 삭제 -->
                    </tr>
                    <%
                        }
                    %>
                    <tr>
                        <th></th>
                        <th></th>
                        <th><fmt:message key="totalamount" /></th><!-- 총액 -->
                        <th><%=sum %></th>
                        <th></th>
                    </tr>
                </table>
                <a href="./albums.jsp" class="btn btn-secondary"><i class="bi bi-box-arrow-in-left"></i><fmt:message key="continueshopping" /></a><!-- 쇼핑 계속하기 -->
            </div>
        </div>
        
        <%@ include file="footer.jsp" %>
    </div>
    </fmt:bundle>
  
</body>
</html>
