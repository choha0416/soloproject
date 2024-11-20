<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath}"  /> 
<html>
<head>
<meta charset="utf-8">
<title>회원가입</title>
<link rel = "stylesheet" href ="css/stylex.css" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">
$(function(){
    // 버튼 클릭 이벤트 핸들러
    $("#checkJson").click(function() {
        var userData = {
            id: $("#user_id").val(),       
            idf: $("#user_id_field").val(), 
            pw: $("#password").val(),      
            name: $("#name").val(),         
            email: $("#email").val()       
        };
        
        // AJAX 요청 보내기
        $.ajax({
            type: "POST",
            url: "${contextPath}/memin", 
            data: JSON.stringify(userData), 
            success: function(data, textStatus) {

                $("#message").text(data.message); 
 				var mainp = '<a href="mainpage_m.html">메인 페이지로 돌아가기</a>';
 				$("#insert").hide();
                $('#mainp').html(mainp);  
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
    <div id="insert">
        <li>학번<input type="text" id="user_id"></li>                
        <li>id<input type="text" id="user_id_field"></li>   
        <li>pw<input type="password" id="password"></li>          
        <li>name<input type="text" id="name"></li>               
        <li>email<input type="text" id="email"></li>              
        <li><input type="button" id="checkJson" value="회원가입"/></li>  
    </div>        
    <div id="message"></div>   
    
    <div id="mainp"></div> 
</body>
</html>
