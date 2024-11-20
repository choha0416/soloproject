<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath}"  /> 
<html>
<head>
<meta charset="utf-8">
<title>수강신청</title>
<link rel = "stylesheet" href ="css/stylex.css" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">

</script>
</head>
<body>
    <div>
    <ul>
    	<li>id<input type="text" id="id"></li>
        <li>pw<input type="password" id="pw"></li>
        <li><input type="button" id="checkJson" value="로그인"/></li>
    </ul>
    </div>
</body>
</html>