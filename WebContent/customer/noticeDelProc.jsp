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
String seq = request.getParameter("c");

String sql ="delete from notices where seq =?";

//db connect
//드라이버 로드
Class.forName("oracle.jdbc.driver.OracleDriver");
//접속
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "hr";
String pw = "123456";
Connection con = DriverManager.getConnection(url, user, pw);
//실행
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, seq);
//결과
//delete된 갯수가 af로 들어간다 1개가 delete됫으면 1이 들어간다 
//예로 체크해서 여러개를 한번에 지울때 아래처럼 쓰면된다
//연습한 예제는 삭제가 1개씩밖에 안되서
//사용하던 pstmt.executeUpdate(); 이것만 써도 된다. 
int af = pstmt.executeUpdate();//return int값
if(af>0)//del이 되었다.
	response.sendRedirect("notice.jsp");
else
	out.write("삭제오류");
 */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>noticeDelProc(삭제)</h3>
</body>
</html>