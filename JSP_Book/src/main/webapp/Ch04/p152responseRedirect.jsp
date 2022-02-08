<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
		<title>responseRedirect</title>
	</head>
	<body>
		<h2>response 객체 예제 - sendRedirect() 메소드의 사용</h2>
		현재 페이지는 <b>responseRedirect.jsp</b> 페이지입니다.
		<%response.sendRedirect("p153responseRedirected.jsp"); %>
	</body>
</html>