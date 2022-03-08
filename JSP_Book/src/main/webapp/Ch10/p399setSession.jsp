<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
		<title>setSession</title>
	</head>
	<body>
		<%
			String id = "kingdora@kings.com";
			String passwd = "123456";
			
			session.setAttribute("id", id);
			session.setAttribute("passwd", passwd);
			
			out.print("세션에 id와 passwd 속성을 설정했습니다.");
		%>
		
		<form action="p399viewSession.jsp" method="post">
			<table>
				<tr>
					<td>
						<input type="submit" value="세션 속성 확인">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>