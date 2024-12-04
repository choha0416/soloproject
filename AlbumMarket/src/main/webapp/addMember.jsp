<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
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

<fmt:setLocale value="<%= language %>" /><!-- 언어 설정관련 fmt  -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>회원 가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
</head>
<body>
<fmt:bundle basename="bundle.message">
    <div class="container py-4">
        <%@ include file="menu.jsp" %> 

        <div class="p-5 mb-4 bg-body-tertiary rounded-3">
            <div class="container-fluid py-5">
                <h1 class="display-5 fw-bold"><fmt:message key="addmember" /></h1>
                <p class="col-md-8 fs-4">Add Member</p>
            </div>
        </div>
        <%
            String error = request.getParameter("error");
            if ("true".equals(error)) {
                out.println("<div class='alert alert-danger'>모든 필드를 입력해 주세요.</div>");
            }
        %>

        <div class="row justify-content-center align-items-center">
            <div class="h-100 p-5 col-md-6">
                <h3><fmt:message key="addmeminfo" /></h3>
                <form action="processAddMember.jsp" method="post">  
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="id" name="id" required>
                        <label for="id"><fmt:message key="id" /></label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="password" class="form-control" id="pw" name="pw" required>
                        <label for="pw"><fmt:message key="pw" /></label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="name" name="name" required>
                        <label for="name"><fmt:message key="username" /></label>
                    </div>
                    <div class="mb-3">
                        <label class="form-label"><fmt:message key="gender" /></label>
                        <div>
                            <input type="radio" name="gender" value="m" required> <fmt:message key="m" />
                            <input type="radio" name="gender" value="f" required> <fmt:message key="f" />
                        </div>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="birth" name="birth" required>
                        <label for="birth"><fmt:message key="birth" /></label>
                    </div>
                    <button class="btn btn-lg btn-success" type="submit"><fmt:message key="button" /></button>
                </form>
            </div>
        </div>

        <%@ include file="footer.jsp" %> 
    </div>
</fmt:bundle>
</body>
</html>
