<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>게시판</title>
</head>
<body>
<%
response.sendRedirect("http://localhost:8083/Web01_desc/DescenteServlet?command=desc_list");
%>
</body>
</html>