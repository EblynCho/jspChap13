<%--
    Created by IntelliJ IDEA.
    User: admin
    Date: 2022-10-28
    Time: 오후 12:11
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>DB 사용하기 - Statement (delete)</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<form action="delete01_process.jsp" method="post">
    <label for="user-id">아이디</label>
    <input type="text" id="user-id" name="userId"><br>
    <label for="user-pw">비밀번호</label>
    <input type="password" id="user-pw" name="userPw"><br>
    <button type="submit">삭제</button>
</form>
</body>
</html>
