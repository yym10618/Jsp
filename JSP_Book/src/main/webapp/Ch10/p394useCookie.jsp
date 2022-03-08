<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
		<title>useCookie</title>
	</head>
	<body>
		<%
			Cookie[] cookies = request.getCookies();
			if(cookies != null){
				for(int i=0 ; i<cookies.length ; i++){
					if(cookies[i].getName().equals("id")){
						out.print("쿠키이름 : "+cookies[i].getName());
						out.print(", 쿠키 값 : "+cookies[i].getValue());
					}
				}
			}
		%>
	</body>
</html>