<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath}"  /> 
<html>
<head>
<meta charset="utf-8">
<title>로그인</title>
<link rel = "stylesheet" href ="css/stylex.css" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">
$(function(){
    $("#checkJson").click(function() {    
    	var _id=$("#user_id_field").val();
        // AJAX 요청 보내기
        $.ajax({
        type: "POST",
        url: "${contextPath}/memlog", 
        dataType: 'json',  //
        success: function(data, textStatus) {
            // 데이터가 성공적으로 전달되었을 때의 처리
            console.log(data);  
            var meberInfo = ""; 
            for (var i = 0; i < data.length; i++) {
                meberInfo += data[i].idf + "<br>"; 
            }
            $("#output").html(meberInfo);  
        },
        error: function(data, textStatus) {
            alert("에러가 발생했습니다.");
            }
        });    
    });
   
});
</script>
</head>
<body>
<div id="login">             
        <li>id_field<input type="text" id="user_id_field"></li>   
        <li>pw<input type="password" id="password"></li>                        
        <li><input type="button" id="checkJson" value="로그인"/></li>  
    </div>
 
    <div id="output"></div>      
</body>
</html>