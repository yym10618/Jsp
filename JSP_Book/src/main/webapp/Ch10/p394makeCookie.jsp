<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
		<title>makeCookie</title>
	</head>
	<body>
		<%
			Cookie cookie = new Cookie("id", "kingdora");
			cookie.setMaxAge(60*2);
			response.addCookie(cookie);
			
			out.print("쿠키가 생성되었습니다.");
		%>
		
		<form action="p394useCookie.jsp" method = "post">
			<table>
				<tr>
					<td>
						<input type="submit" value="생성된 쿠키 확인">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>