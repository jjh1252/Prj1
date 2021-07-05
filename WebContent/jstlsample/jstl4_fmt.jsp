<%@page import="java.util.Locale"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<h3>jstl4.jsp</h3>

<c:set var="now" value="<%=new java.util.Date() %>" />
<fmt:formatNumber value="1000000" type="currency" /> <br />
<fmt:formatNumber value="1000000" type="currency" pattern="#원"/> <br />
<fmt:formatNumber value="1000000" type="currency" pattern="###,###원"/> <br />
<fmt:formatNumber value="1000000" type="currency" pattern="###,###"/>원 <br />
<fmt:formatNumber value="1000000.1254" type="currency" pattern="###,###.##"/>원 <br />
<hr />

locale <br />
<!-- setLocalle은 ip주소값을 가지고 국가를 추적해서 그국가 시간을 표시해준다 -->
<fmt:setLocale value="en_us"/>
<fmt:formatDate value="${now }" type="both" dateStyle="short" pattern="YY-MM-dd"/> <br />
<fmt:formatDate value="${now }" type="both" dateStyle="medium" 
pattern="YYYY-MM-dd [a] hh:mm:ss"/> <br />
<fmt:formatDate value="${now }" type="both" dateStyle="short" /> <br />
<fmt:formatDate value="${now }" type="both" dateStyle="medium" /> <br />
<fmt:formatDate value="${now }" type="both" dateStyle="long" /> <br />
<fmt:formatDate value="${now }" type="both" dateStyle="full" /> <br />
<fmt:formatDate value="${now }" type="both" dateStyle="full" pattern="YYY-MM-dd[E]"/> <br />
<hr />

timezone <br />
<fmt:setLocale value="en_us"/>
<fmt:formatDate value="${now }" type="both" dateStyle="short" pattern="YY-MM-dd"/> <br />
<fmt:formatDate value="${now }" type="both" dateStyle="medium" 
pattern="YYYY-MM-dd [a] hh:mm:ss"/> <br />
<fmt:formatDate value="${now }" type="both" dateStyle="long" timeZone="America/Los_Angeles" /> <br />
<fmt:formatDate value="${now }" type="both" dateStyle="long"/> <br />
<fmt:formatDate value="${now }" type="both" dateStyle="full" pattern="YYY-MM-dd[E]" /> <br />

<hr />

<fmt:setLocale value="ru_RU"/>
<fmt:formatDate value="${now }" type="both" dateStyle="short" pattern="YY-MM-dd"/> <br />
<fmt:formatDate value="${now }" type="both" dateStyle="medium" 
pattern="YYYY-MM-dd [a] hh:mm:ss"/> <br />
<fmt:formatDate value="${now }" type="both" dateStyle="short"/> <br />
<fmt:formatDate value="${now }" type="both" dateStyle="medium"/> <br />
<fmt:formatDate value="${now }" type="both" dateStyle="long"/> <br />
<fmt:formatDate value="${now }" type="both" dateStyle="full"/> <br />
<fmt:formatDate value="${now }" type="both" dateStyle="full" pattern="YYYY-MM-dd[E]"/> <br />
<hr />

국가코드 알아보기 <br />
<c:set var="ics" value="<%=Locale.getAvailableLocales() %>" />
<c:forEach var="lo" items="${ics }">
${lo } &nbsp; &nbsp;
</c:forEach>








</body>
</html>