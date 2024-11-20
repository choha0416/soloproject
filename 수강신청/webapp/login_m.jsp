<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<html>
<head>
<meta charset="utf-8">
<title>로그인</title>
<link rel="stylesheet" href="css/stylex.css" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">
$(function(){
    $("#checkJson").click(function() {
        var _id = $("#user_id_field").val();  // 입력된 아이디
        var password = $("#password").val();  // 입력된 비밀번호

        // 입력이 비어있지 않은지 체크
        if (!_id || !password) {
            alert("아이디와 비밀번호를 입력하세요.");
            return;
        }

        // AJAX 요청 보내기
        $.ajax({
            type: "POST",
            url: "${contextPath}/memlog", 
            data: {
                _id: _id,      // 아이디
                password: password  // 비밀번호
            },
            dataType: 'json',
            success: function(data, textStatus) {
                // 데이터가 성공적으로 전달되었을 때의 처리
                console.log(data);  
                var memberInfo = ""; 
                // 로그인 성공 시
                if (data.length > 0 && data[0].status !== "failure") {
                    for (var i = 0; i < data.length; i++) {
                        memberInfo += "아이디: " + data[i].id + "<br>";
                        memberInfo += "이름: " + data[i].name + "<br>";
                        memberInfo += "역할: " + data[i].role + "<br>";
                    }
                    $("#output").html("로그인 성공!<br>" + memberInfo);  
                } else {
                    // 로그인 실패 시
                    $("#output").html("로그인 실패: " + data[0].message);
                }
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
    <li>아이디: <input type="text" id="user_id_field"></li>   
    <li>비밀번호: <input type="password" id="password"></li>                        
    <li><input type="button" id="checkJson" value="로그인"/></li>  
</div>

<div id="output"></div>  <!-- 로그인 결과 표시 -->
