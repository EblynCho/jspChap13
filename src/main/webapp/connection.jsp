<%--
    Created by IntelliJ IDEA.
    User: admin
    Date: 2022-10-27
    Time: 오후 3:32
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>DB 사용하기</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<%
    Connection conn = null;

    try {
        String url = "jdbc:mysql://localhost:3306/javadb";
        String userId = "test1";
        String userPw = "java505";

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, userId, userPw);  // DriverManager : 접속
        out.println("데이터 베이스 연결이 성공하였습니다.");
    }
    catch (SQLException e) {
        out.println("데이터 베이스 연결이 실패했습니다.");
        out.println("SQLException : " + e.getMessage());
    }
    finally {
        if (conn != null) {
            conn.close();
        }
    }
%>
</body>
</html>
