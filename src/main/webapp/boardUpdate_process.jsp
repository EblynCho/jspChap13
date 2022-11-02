<%--
    Created by IntelliJ IDEA.
    User: admin
    Date: 2022-11-02
    Time: 오전 10:48
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%@ include file="dbconn.jsp" %>

<%
    request.setCharacterEncoding("utf-8");

    int seq = Integer.parseInt(request.getParameter("seq"));
    String title = request.getParameter("title");
    String contents = request.getParameter("contents");


    String sql = "UPDATE board SET title = ?, contents = ? ";
    sql += "WHERE seq = ? ";

    PreparedStatement pstmt = null;

    try {
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, title);
        pstmt.setString(2, contents);
        pstmt.setInt(3, seq);
        pstmt.executeUpdate();
    }
    catch (SQLException e) {
        out.print(e.getMessage());
    }
    finally {
        if (pstmt != null) { pstmt.close(); }
        if (conn != null) { conn.close(); }
    }

    response.sendRedirect("boardList.jsp");
%>