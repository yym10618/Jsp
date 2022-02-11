<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.EmployeeBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
		//데이터베이스 정보
		String host = "jdbc:mysql://54.180.134.197:3306/yym10618";
		String user = "test";
		String pass = "1234";
		List<EmployeeBean> worker = new ArrayList<>(); // EmployeeBean 리스트 생성
	
	try{
		// 1단계 - JDBC 드라이버 로드
		Class.forName("com.mysql.jdbc.Driver");
		
		// 2단계 - 데이터베이스 접속
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		// 3단계 - SQL실행객체 생성(Statement)
		Statement stmt = conn.createStatement();
		
		// 4단계 - Employee table 조회
		String sql = "SELECT * FROM `Employee`;";
		ResultSet rs = stmt.executeQuery(sql);
		
		// 5단계
		while(rs.next()){
			// 자바빈 생성 및 데이터 저장
			EmployeeBean eb = new EmployeeBean();
			eb.setUid(rs.getString(1));
			eb.setName(rs.getString(2));
			eb.setGender(rs.getInt(3));
			eb.setHp(rs.getString(4));
			eb.setEmail(rs.getString(5));
			eb.setPos(rs.getString(6));
			eb.setDep(rs.getInt(7));
			eb.setRdate(rs.getString(8));
			
			// 리스트 추가
			worker.add(eb);
		}
		
		
		// 6단계 - 종료
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
		<h3>Employee 목록</h3>
		<a href="./register.jsp">직원등록</a>
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
			<% for(EmployeeBean eb : worker){ %>
				<tr>
					<td><%= eb.getUid() %></td>
					<td><%= eb.getName() %></td>
					<td>
						<%
							switch(eb.getGender()){
							case 1:
								out.println("남");
								break;
							case 2:
								out.println("여");
								break;
							} 
						%>
					</td>
					<td><%= eb.getHp() %></td>
					<td><%= eb.getEmail() %></td>
					<td><%= eb.getPos() %></td>
					<td>
						<% 
							switch(eb.getDep()){
							case 101:
								out.println("영업1부");
								break;
							case 102:
								out.println("영업2부");
								break;
							case 103:
								out.println("영업3부");
								break;
							case 104:
								out.println("영업4부");
								break;
							case 105:
								out.println("인사부");
								break;
							}
						%>
					</td>
					<td><%= eb.getRdate().substring(0, 10) %></td>
				</tr>
			<% } %>		
		</table>		
	</body>
</html>
