<%--
    Created by IntelliJ IDEA.
    User: admin
    Date: 2022-10-28
    Time: 오후 3:55
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%@ include file="dbconn.jsp" %>

<%
    request.setCharacterEncoding("utf-8");

    String title = request.getParameter("title");
    String userId = request.getParameter("userId");
    String contents = request.getParameter("contents");

    PreparedStatement pstmt = null;
//    insert 할거라서 resultset 필요없음

    try {
        String sql = "INSERT INTO board (title, contents, user_id, create_date) ";
        sql += "VALUES (?, ?, ?, now()) ";

        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, title);
        pstmt.setString(2, contents);
        pstmt.setString(3, userId);
        pstmt.executeUpdate();

//        int result = pstmt.executeUpdate();  // 결과 보고싶으면
//        if (result > 0) {}  // 0 보다 크면 정상 실행
    }
    catch (SQLException e) {
        out.println("SQLException : " + e.getMessage());
    }
    finally {
        if (pstmt != null) { pstmt.close(); }
        if (conn != null) { conn.close(); }
    }

    response.sendRedirect("boardList.jsp");
%>

<%-- 화면이 아니라서 view 필요없음 --%>