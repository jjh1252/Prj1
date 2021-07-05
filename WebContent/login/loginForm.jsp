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
<link rel="stylesheet" href="../css/join_style.css" />
<script>
	function checkValue() {
		 inputForm = eval("document.loginInfo");/* document:폼전체를 가져온다 */
		 if(!inputForm.id.value){//inputForm에 id값이 비어있다면
			 alert("id입력필요");
			 inputForm.id.focus();
			 return false;//return checkValue()로 값을 돌려준다
		 }
		 if(!inputForm.password.value){
			 alert("pass입력필요");
			 inputForm.password.focus();
			 return false;
		 }
	}
	
	function goJoinForm() {
		location.href = "../joinus/join.jsp";
	}
</script>
</head>
<body>
<h3>loginForm.jsp</h3>
<div id="wrap">
<!--login버튼을 누를때 return checkValue() 프론트엔드에서 아이디 비밀번호 체크하는거  -->
<!--return checkValue()는 true 또는 false를 돌려받는다.  -->
	<form action="loginProc.jsp" name="loginInfo" method="post" onsubmit="return checkValue()">
		<!-- 이미지 추가 -->
		<img src="../img/welcome.jpg" id="wel_img" />
		<br /><br />
		
		<table>
			<tr>
				<td bgcolor="skyblue">아이디</td>
				<td><input type="text" name="id" maxlength="50"/></td>
			</tr>
			
			<tr>
				<td bgcolor="skyblue">비밀번호</td>
				<td><input type="password" name="password" maxlength="50"/></td>
			</tr>
		</table>
		<br />
		
		<input type="submit" value="login"/>
		<input type="button" value="join" onclick="goJoinForm()"/><!-- 가입되지않았다면 goJoinForm()로 가라  -->
	</form>
<!-- loginProc에서 x값에 따라 어느 페이지로 이동할지 결정 값 받아온거  값 : 0 , -1  -->	
	<%
	String msg = request.getParameter("msg");//loginProc에 있는 msg값 0 ,-1 가져온다
		if(msg!=null && msg.equals("0")){
			out.println("<br>");
			out.println("<font color = 'red' size='5'>비밀번호 확인</font>");
		}else if(msg!=null && msg.equals("-1")){
			out.println("<br>");
			out.println("<font color = 'red' size='5'>아이디확인</font>");
		}
	%>
</div>
</body>
</html>