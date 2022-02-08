<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
		<title>1.Request</title>
		<!-- 
			날짜 : 2022/02/08
			이름 : 양용민
			내용 : Jsp 내장객체 실습하기
			
			request 내장객체
			 - 클라이언트의 요청 정보를 갖는 객체
			 - 클라이언트의 전송 데이터(Parameter) 수신기능을 제공
			
			요청방식 Get 
			 - 기본적인 서버 요청방식
			 - 서버에 페이지나 데이터를 요청하는 요청방식
			 - 전송 데이터가 주소에 노출
			
			요청방식 Post
			 - 서버에서 데이터를 전송하면서 처리를 요청하는 요청방식
			 - 전송데이터를 요청메세지에 삽입해서 전송하기 때문에 데이터 노출이 안됨
		 -->
	</head>
	<body>
		<h3>1.Request 내장객체</h3>
		
		<h4>로그인</h4>
		<form action="/JSP_Study/proc/loginProc.jsp" method="post">
			<table border = "1">
				<tr>
					<td>아이디</td>
					<td><input type = "text" name = "uid"/></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type = "password" name = "pass"/></td>
				</tr>
				<tr>
					<td colspan = "2" align = "right" >
						<input type = "submit" value = "로그인"/>
					</td>
				</tr>
			</table>
		</form>
		
		<h4>회원가입</h4>
		<form action="/JSP_Study/proc/registerProc.jsp" method="post">
			<table border = "1">
				<tr>
					<td>아이디</td>
					<td><input type = "text" name = "uid"/></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type = "password" name = "pass"/></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type = "text" name = "name"/></td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<select name = "addr">
							<option>서울</option>
							<option>대전</option>
							<option>대구</option>
							<option>부산</option>
							<option>광주</option>
						</select>
					
					</td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
					<label><input type = "radio" name = "gender" value = "1"/>남</label>
					<label><input type = "radio" name = "gender" value = "2"/>여</label>
					</td>
				</tr>
				<tr>
					<td>취미</td>
					<td>
					<label><input type = "checkbox" name = "hobby" value = "등산"/>등산</label>
					<label><input type = "checkbox" name = "hobby" value = "독서"/>독서</label>
					<label><input type = "checkbox" name = "hobby" value = "여행"/>여행</label>
					<label><input type = "checkbox" name = "hobby" value = "운동"/>운동</label>
					<label><input type = "checkbox" name = "hobby" value = "영화"/>영화</label>
					</td>
				</tr>
				<tr>
					<td colspan = "2" align = "right" >
						<input type = "submit" value = "회원가입"/>
					</td>
				</tr>
			</table>
		
		</form>
		
		<h4>request 주요기능</h4>
		<table border = "1">
			<tr>
				<td>헤더정보</td>
				<td><%= request.getHeader("User-Agent") %></td>
			</tr>
			<tr>
				<td>통신규약</td>
				<td><%= request.getProtocol() %></td>
			</tr>
			<tr>
				<td>서버이름</td>
				<td><%= request.getServerName() %></td>
			</tr>
			<tr>
				<td>요청주소</td>
				<td><%= request.getRequestURL() %></td>
			</tr>
			<tr>
				<td>요청경로</td>
				<td><%= request.getRequestURI() %></td>
			</tr>
			<tr>
				<td>클라이언트 IP주소</td>
				<td><%= request.getRemoteAddr() %></td>
			</tr>
		</table>
		
		
		
		
		
		
		
	</body>
</html>