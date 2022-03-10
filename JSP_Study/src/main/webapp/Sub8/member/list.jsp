<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
		<title>list</title>
	</head>
	<body>
		<h3>직원목록</h3>
		<a href="/JSP_Study/Sub8/member/register.do">직원등록하기</a>
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>직급</th>
				<th>부서</th>
				<th>입사일</th>
				<th>관리</th>
			</tr>
			<c:forEach var="member" items="${members}">
				<tr>
					<td>${member.getUid()}</td>
					<td>${member.name}</td>
					<td>${member.hp}</td>
					<td>${member.pos}</td>
					<td>${member.dep}</td>
					<td>${member.rdate}</td>
					<td>
						<a href="/JSP_Study/Sub8/member/modify.do?uid=${member.uid}">수정</a>
						<a href="/JSP_Study/Sub8/member/delete.do?uid=${member.uid}">삭제</a>
					</td>			
				</tr>
			</c:forEach>
		</table>		
	</body>
</html>