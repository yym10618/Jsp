<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.EmployeeBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 데이터베이스 작업(Statement 사용)
	String host = "jdbc:mysql://54.180.134.197:3306/yym10618";
	String user = "test";
	String pass = "1234";
	
	List<EmployeeBean> members = new ArrayList<>();
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT * FROM `Employee`";
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			
			EmployeeBean eb = new EmployeeBean();
			eb.setUid(rs.getString(1));
			eb.setName(rs.getString(2));
			eb.setGender(rs.getString(3));
			eb.setHp(rs.getString(4));
			eb.setEmail(rs.getString(5));
			eb.setPos(rs.getString(6));
			eb.setDep(rs.getString(7));
			eb.setRdate(rs.getString(8));
			
			members.add(eb);
		}
		
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
		
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
		<title>list</title>
	</head>
	<body>
		<h3>직원목록</h3>
		<a href="./register.jsp">직원등록하기</a>
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>성별</th>
				<th>휴대폰</th>
				<th>이메일</th>
				<th>직급</th>
				<th>부서</th>
				<th>입사일</th>
			</tr>
			<% for(EmployeeBean eb : members){ %>
				<tr>
					<td><%= eb.getUid() %></td>
					<td><%= eb.getName() %></td>
					<td><%= eb.getGender() %></td>
					<td><%= eb.getHp() %></td>
					<td><%= eb.getEmail() %></td>
					<td><%= eb.getPos() %></td>
					<td><%= eb.getDep() %></td>
					<td><%= eb.getRdate().substring(0, 10) %></td>
				</tr>
			<% } %>
		</table>		
	</body>
</html>