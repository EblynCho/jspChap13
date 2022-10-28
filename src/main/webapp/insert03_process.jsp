<%--
    Created by IntelliJ IDEA.
    User: admin
    Date: 2022-10-28
    Time: 오전 9:42
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>DB 사용하기 - PreparedStatement</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
    request.setCharacterEncoding("utf-8");

    String userId = request.getParameter("userId");
    String userPw = request.getParameter("userPw");
    String userNm = request.getParameter("userName");

    PreparedStatement pstmt = null;

    try {
        String sql = "INSERT INTO member (id, passwd, name) ";
        sql += "VALUES (?, ?, ?) ";

        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);
        pstmt.setString(2, userPw);
        pstmt.setString(3, userNm);
        pstmt.executeUpdate();
        out.println("member 테이블에 데이터를 추가하였습니다.");
    }
    catch (SQLException e) {
        out.println("member 테이블에 데이터 추가를 실패했습니다.");
        out.println("SQLException : " + e.getMessage());
    }
    finally {
        if (pstmt != null) { pstmt.close(); }
        if (conn != null) { conn.close(); }
    }
%>
</body>
</html>
