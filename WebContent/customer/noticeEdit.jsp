<%@page import="notice.vo.Notice"%>
<%@page import="notice.dao.NoticeDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<%
/* 
String seq = request.getParameter("c");

//NoticeDao 객체생성
NoticeDao dao = new NoticeDao();
//Notice getNotice에서 작업한 값을 가져온다.
Notice n = dao.getNotice(seq);
 */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/nstyle.css" /> <!-- css파일 연결 -->
</head>
<body>
<h3>수정</h3>
<!-- 수정할 데이터들을 넘겨줘야해서 form으로 감싸줘야한다. -->
<form action="noticeEditProc.do" method="post">
<table class ="twidth">
	<colgroup>
		<col width="15%"/>
		<col width="35%"/>
		<col width="15%"/>
		<col width="35%"/>
	</colgroup>
	<caption>Edit</caption>
	<tbody>
		<tr>
			<th class="left">글번호</th>
			<td>${n.seq }</td>
			<th class="left">조회수</th>
			<td>${n.hit }</td>
		</tr>
		<tr>
			<th class="left">작성자</th>
			<td>${n.writer }</td>
			<th class="left">작성시간</th>
			<td>${n.regdate }</td>
		</tr>
		<tr>
			<th class="left">제목</th>
			<td colspan="3">
			<input class="inp" name="title" type="text" value="${n.title }"/></td>
		</tr>
		<tr>
			<th class="left">내용</th>
			<td colspan="3" id="content">
			<textarea class="txt" name="content" >${n.content }</textarea></td>
		</tr>
		<tr>
			<th class="left">첨부</th>
			<td colspan="3" id="addfile">
			첨부
			</td>
		</tr>
	</tbody>
</table>
<div>
	<input type="hidden" name="c" value="${n.seq }" />
	<input type="submit" value="저장"/>
	<a href="noticeDetail.jsp?c=${n.seq }">취소</a>
</div>
</form>
</body>
</html>