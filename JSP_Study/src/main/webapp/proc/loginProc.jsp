<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
		<title>loginProc</title>
	</head>
	<body>
		<h3>데이터 수신</h3>
		<%
			// 수신 데이터 인코딩 설정
			request.setCharacterEncoding("UTF-8");
		
			// 데이터 수신
			String uid = request.getParameter("uid");
			String pass = request.getParameter("pass");
		%>
		
		<p>
			아이디 : <%= uid %><br/>
			비밀번호 : <%= pass %><br/>
		</p>
		
		<a href="../Sub3/1.Request.jsp">뒤로가기</a>
	</body>
</html>