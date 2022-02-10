<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송데이터 수신
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("uid");
	
	//데이터베이스 정보
	String host = "jdbc:mysql://54.180.134.197:3306/yym10618";
	String user = "test";
	String pass = "1234";
	
	try{
		// 1단계
		Class.forName("com.mysql.jdbc.Driver");
		// 2단계
		Connection conn = DriverManager.getConnection(host, user, pass);
	
		// 3단계
		String sql = "DELETE FROM `User1` WHERE `uid`=?;";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, uid);
		
		// 4단계
		psmt.executeUpdate();
		// 5단계
		// 6단계
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	//리다이렉트
	response.sendRedirect("./2.Select.jsp");

%>