<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<%
String id = request.getParameter("id");
String pass = request.getParameter("password");

String sql ="select id, pwd from member where id = ?";

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
pstmt.setString(1, id);
ResultSet rs = pstmt.executeQuery();
//==============================================================
/*입력한 ID/Pass와 DB에 저장된 ID/pass 비교확인*/
String ypass="";//DB에있는 패스워드
int x = -1;//x값에 따라서 패스워드가 일치 불일치 아이디없음 표현
String msg = "";
if(rs.next()){
	ypass = rs.getString("pwd");
	if(ypass.equals(pass)){//ypass : DB패스워드 / pass : 뷰에서 입력한 패스워드 / 패스워드가 일치한다면
		x = 1;//x = 1로 줘라
	}else{//패스워드 불일치
		x = 0;//x = 0으로 줘라
	}
}else{//rs.netx()할 대상 차제가 없다면 / 아이디 없음
	x = -1;
}
System.out.println("xxx : " + x);
//==============================================================
/* x값에 따라 어느 페이지로 이동할지 결정 */
if(x==1){ //로그인이 잘 됫을경우
	session.setAttribute("sessionID", id);//세션에 세션id에 입력한 id를 넣어준다.
	msg = "../mainForm.jsp";	
}else if(x==0){//
	msg = "loginForm.jsp?msg=0";//로긴폼에 메세지 0인값을 넘겨준다
}else{
	msg = "loginForm.jsp?msg=-1";
}
response.sendRedirect(msg); //if문 상황에 따라서 주소가 달라진다 달리진값으로 이동시켜준다

System.out.println("id : "+ id);
System.out.println("pass : "+ pass);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>loginProc.jsp</h3>
</body>
</html>