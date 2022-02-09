<%@page import="test.Member"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Member member = (Member)session.getAttribute("sessMember");

	if(member == null){
		response.sendRedirect("./login.jsp?success=102");
		return; // 처리 종료 -> 아래 코드 실행안함
	}
	String uid = member.getUid();
		
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
		<title>loginSuccess</title>
	</head>
	<body>
		<h4>로그인 성공</h4>
		
		<p>
			<%=uid %>님 반갑습니다.<br/>
			<a href="./logout.jsp">로그아웃</a>
		</p>
	</body>
</html>