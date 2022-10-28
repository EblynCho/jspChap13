<%--
    Created by IntelliJ IDEA.
    User: admin
    Date: 2022-10-28
    Time: 오후 2:27
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<%@ include file="dbconn.jsp" %>

<header class="container mt-3">
    <div class="p-5 mb-4 bg-light rounded-3">
        <div class="container-fluid py-4">
            <h1 class="text-center">게시물 리스트 페이지</h1>
        </div>
    </div>
</header>

<main class="container mt-4">
    <div class="row">
        <div class="col-sm">
            <table class="table table-hover table-striped">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>글제목</th>
                        <th>글쓴이</th>
                        <th>등록시간</th>
                        <th>조회수</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;

                    try {
                        String sql = "SELECT seq, title, user_id, create_date, cnt FROM board WHERE deleted_yn = 'N' ";
                        pstmt = conn.prepareStatement(sql);
                        rs = pstmt.executeQuery();

                        while (rs.next()) {
                            int seq = rs.getInt("seq");
                            String title = rs.getString("title");
                            String userId = rs.getString("user_id");
                            String createDt = rs.getString("create_date");
                            int cnt = rs.getInt("cnt");
                %>
                    <tr>
                        <td><%=seq%></td>
                        <td><%=title%></td>
                        <td><%=userId%></td>
                        <td><%=createDt%></td>
                        <td><%=cnt%></td>
                    </tr>
                <%
                        }
                    }
                    catch (SQLException e) {
                        out.println("SQLException : " + e.getMessage());
                    }
                    finally {
                        if (rs != null) { rs.close(); }
                        if (pstmt != null) { pstmt.close(); }
                        if (conn != null) { conn.close(); }
                    }
                %>

                </tbody>
            </table>
            <div class="d-flex justify-content-end">
                <a href="boardWrite.jsp" class="btn btn-primary">글쓰기</a>
            </div>
        </div>
    </div>
</main>

<footer class="container-fluid mt-5 p-5 border-top">
    <p class="lead text-muted text-center">made by bitc java 505</p>
</footer>

</body>
</html>
