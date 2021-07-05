<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
String pwd = request.getParameter("pwd");
String pwd2 = request.getParameter("pwd2");
String name = request.getParameter("name");
String gender = request.getParameter("gender");

String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
//라디오박스는 이렇게 받아온다
String birth = String.format("%s-%s-%s", year,month,day);

String IsLunar = request.getParameter("IsLunar");
String cphone = request.getParameter("cphone");
String email = request.getParameter("email");

//체크박스는 선택해야할게 많아서 배열로 받아야한다 getParameterValues:배열로 값불러온다
String[] habits = request.getParameterValues("habit");
String habit ="";

//아래 조건을 주는 이유는 체크를 아무것도 안하고 확인버튼을 누르면 널포인트 오류가 나온다
//아래 조건을 줘서 체크를 안하면 빈공간으로 출력
//하나라도 체크되어있다면 아래 조건문실행 - 반복문실행해서 체크한값 출력
if(habits!=null){//habits가 널이 아니면 아래 조건문 실행
	for(int i=0; i<habits.length; i++){
		habit+=habits[i];
		if(habits.length>i+1){
			habit+=", ";
		}
	}
}
//==========================================================================
//ID 비밀번호 필터링
List<String> erros = new ArrayList();
if(id == null || id.equals("")){
	erros.add("아이디입력 없음");
}

if(!pwd.equals(pwd2)){
	erros.add("pwd 불일치");
}

//아이디 비밀번호도 안넣거나 틀렸을경우에도 DB가 실행되서 값저장되는걸 막기위한작업
if(erros.size()>0){//에러가 1개라도 존재한다면 즉 위에 if문 두개중 하나라고 false이면
	//에러를 request에 셋팅
	request.setAttribute("erros", erros);//"erros"라는 이름으로 erros(아이디없고/비번불일치)중에 에러난것을 erros에 담고
	//에러가있으니 join.jsp로가라 reqest,response를 가지고 가라
	request.getRequestDispatcher("join.jsp").forward(request, response);
	
}else{//에러가 없다면
	/* DB연결 */
	String sql ="insert into member(id,pwd,name,gender,birth,is_lunar,cphone,email,habit,regdate)"
	+" values(?,?,?,?,?,?,?,?,?,sysdate)";

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
	pstmt.setString(2, pwd);
	pstmt.setString(3, name);
	pstmt.setString(4, gender);
	pstmt.setString(5, birth);
	pstmt.setString(6, IsLunar);
	pstmt.setString(7, cphone);
	pstmt.setString(8, email);
	pstmt.setString(9, habit);

	//결과
	pstmt.executeUpdate();

	//main으로 보내기
	response.sendRedirect("join.jsp");
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>joinProc.jsp</h3>
id : <%=id %> <br />
habit : <%=habit %>
</body>
</html>