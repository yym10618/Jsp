<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<!-- 
			날짜 : 2022/03/07
			이름 : 양용민
			내용 : JSP표현언어 연산자
		 -->
		<meta charset="UTF-8"/>
		<title>3.EL 연산자</title>
	</head>
	<body>
		<h3>3.표현언어 연산자 실습</h3>
		<%
			String str1 = null;
			String str2 = "";
			String str3 = "Hello";
			
			int num1 = 1;
			int num2 = 2;
			
			request.setAttribute("str1", str1);
			request.setAttribute("str2", str2);
			request.setAttribute("str3", str3);
			request.setAttribute("num1", num1);
			request.setAttribute("num2", num2);
		%>
		
		<p>
			num1 + num2 = ${num1 + num2}<br/>
			num1 - num2 = ${num1 - num2}<br/>
			num1 * num2 = ${num1 * num2}<br/>
			num1 / num2 = ${num1 / num2}<br/><br/>
			
			num1 > num2 = ${num1 > num2}<br/>
			num1 < num2 = ${num1 < num2}<br/>
			num1 >= num2 = ${num1 >= num2}<br/>
			num1 <= num2 = ${num1 <= num2}<br/>
			num1 == num2 = ${num1 == num2}<br/>
			num1 != num2 = ${num1 != num2}<br/><br/>
			
			num1 gt num2 = ${num1 gt num2}<br/><!-- greater than -->
			num1 lt num2 = ${num1 lt num2}<br/><!-- less than -->
			num1 ge num2 = ${num1 ge num2}<br/><!-- greater than equal -->
			num1 le num2 = ${num1 le num2}<br/><!-- less than equal -->
			num1 eq num2 = ${num1 eq num2}<br/><!-- equal -->
			num1 ne num2 = ${num1 ne num2}<br/><br/><!-- not equal -->
			
			empty str1 = ${empty str1}<br/>
			empty str2 = ${empty str2}<br/>
			empty str3 = ${empty str3}<br/><br/>
			
			str3 eq "Hello" = ${str3 eq "Hello"}<br/>
			str3 eq "hi" = ${str3 eq "hi"}<br/><br/>
		</p>
		
		
	</body>
</html>