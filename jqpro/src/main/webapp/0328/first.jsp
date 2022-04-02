<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
h1{
	color: red
}
p{
	font-size : 2.0em;
	color : blue;
}
</style>
</head>
<body>
<h1>JSP: Java Server Page</h1>
<%
	request.setCharacterEncoding("utf-8");
	
	String userid = request.getParameter("id");
	String username = request.getParameter("name");
	//db연결 - select, insert, update, delete
	//CRUD처리 
%>



<p><%=userid %>님 환영합니다.</p>
<p><%=username %>님 즐거운 하루 되세요.</p>


</body>
</html>