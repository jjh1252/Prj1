<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>logoutProc</h3>
<!-- 세션삭제 , 로그인화면 이동 -->
<%
session.invalidate();//세션삭제
response.sendRedirect("loginForm.jsp");//로그인화면 이동

%>
</body>
</html>