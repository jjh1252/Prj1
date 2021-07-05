<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<h2>jstl1.jsp</h2>
<!-- delims= , 콤마 기준으로 갯수만큼 반복한거다 -->
<%-- 
<c:forTokens items="이름1,이름1,이름1,이름1,이름1" delims=",">
반복 <br />
</c:forTokens>
 --%>
 <!-- var="name"을 주면 itmes값이 출력된다. -->
<%--  
<c:forTokens var="name" items="이름1,이름1,이름1,이름1,이름1" delims=",">
${name } <br />
</c:forTokens>
 --%>
 <!-- varStatus=st st를 이용해 요소들을 활용할 수 있다 -->
<%--  
<c:forTokens var="name" items="이름1,이름2,이름3,이름4,이름5" delims="," varStatus="st">
index : ${st.index } <br /> <!-- //현재 인덱스 -->
current: ${st.current } <br /> <!-- //현재인덱스에 있는 값 출력 -->
count : ${st.count } <br /> 
first : ${st.first } <br /> <!-- //첫번째냐 -->
last : ${st.last} <br /> <!-- //마지막이냐 -->
begin : ${st.begin } <br />
end : ${st.end } <br />
step : ${st.step } <br />
 --%>
 <!-- delims=", / " 콤마랑 슬래쉬를 넣어 두개를 구분할 수 있다.-->
<%--  
 <c:forTokens var="name" items="이름1,20/이름2,30/이름3,40/이름4,50/이름5,60" delims=",/" varStatus="st">
index : ${st.index } <br /> <!-- //현재 인덱스 -->
current: ${st.current } <br /> <!-- //현재인덱스에 있는 값 출력 -->
count : ${st.count } <br /> 
first : ${st.first } <br /> <!-- //첫번째냐 -->
last : ${st.last} <br /> <!-- //마지막이냐 -->
begin : ${st.begin } <br />
end : ${st.end } <br />
step : ${st.step } <br />
  --%>
  
<c:forTokens var="name" items="이름1,20/이름2,30/이름3,40/이름4,50/이름5,60" delims=",/" varStatus="st"
step="2">
index : ${st.index } <br /> <!-- //현재 인덱스 -->
current: ${st.current } <br /> <!-- //현재인덱스에 있는 값 출력 -->
count : ${st.count } <br /> 
first : ${st.first } <br /> <!-- //첫번째냐 -->
last : ${st.last} <br /> <!-- //마지막이냐 -->
begin : ${st.begin } <br />
end : ${st.end } <br />
step : ${st.step } <br />
<hr />
</c:forTokens>

</body>
</html>