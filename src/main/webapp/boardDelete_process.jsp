<%--
    Created by IntelliJ IDEA.
    User: admin
    Date: 2022-11-02
    Time: 오전 10:37
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%@ include file="dbconn.jsp" %>

<%
    int seq = Integer.parseInt(request.getParameter("seq"));

    String sql = "UPDATE board SET deleted_yn = 'Y' ";
    sql += "WHERE seq = ? ";

    PreparedStatement pstmt = null;

    try {
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, seq);
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