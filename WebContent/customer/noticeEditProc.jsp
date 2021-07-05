<%@page import="notice.vo.Notice"%>
<%@page import="notice.dao.NoticeDao"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<%
/* 
//noticeEdit에서 수정할부분 제목 내용 값 가져오기
String title = request.getParameter("title");
String content= request.getParameter("content");
String seq = request.getParameter("c");

//NoticeDao에서 가져오기
NoticeDao dao = new NoticeDao();
//방법1
//int af = dao.update(title, content, seq);

//방법2
Notice n = new Notice();
n.setSeq(seq);
n.setTitle(title);
n.setContent(content);

int af = dao.update(n);

if(af>0)
//예로 3번글을 수정했다고 가정했을경우  수정이 다됬을때 3번글을 다시 보여주개하기위해서 c= + seq 해준다
	response.sendRedirect("noticeDetail.jsp?c="+seq);
else
	out.write("수정오류");
 */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>noticeEditProc(수정 실행부분)</h3>


</body>
</html>