<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
		<title>2.조건문</title>
		<%--
			날짜 : 2022/02/07
			이름 : 양용민
			내용 : JSP 조건문 실습하기 p124
		 --%>
	</head>
	<body>
		<h3>2.조건문</h3>
		<%
			int num1 = 1;
			int num2 = 2;
			int num3 = 3;
			int num4 = 4;
			
			if(num1 > 0){
				out.println("<h4>num1은 0보다 크다.</h4>");
			}
			
			if(num1 > num2){
		%>
			<h4>num1은 num2보다 크다.</h4>
		<%
			}else{
		%>
			<h4>num1은 num2보다 작다.</h4>
		<% } %>
		
		<hr/>
		
		<% if(num1 > num2){ %>
			<h4>num1은 num2보다 크다.</h4>
		<% }else if(num2 > num3){ %>
			<h4>num2은 num3보다 크다.</h4>
		<% }else if(num3 > num4){ %>
			<h4>num3은 num4보다 크다.</h4>
		<% }else{ %>
			<h4>num4가 가장 크다.</h4>
		<% } %>
		

	</body>
</html>