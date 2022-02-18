<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	String sid    = request.getParameter("sid");
	String name   = request.getParameter("name");
	String gender = request.getParameter("gender");
	String hp     = request.getParameter("hp");
	String grade  = request.getParameter("grade");
	String regdate = request.getParameter("regdate");
	
	// 데이터베이스 작업(PrepareStatement 사용)
	String host = "jdbc:mysql://chhak.or.kr:3306/yym10618";
	String user = "yym10618";
	String pass = "1234";
	
	int result = 0;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		String sql = "INSERT INTO `Students` VALUES (?,?,?,?,?,?);";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, sid);
		psmt.setString(2, name);
		psmt.setString(3, gender);
		psmt.setString(4, hp);
		psmt.setString(5, grade);
		psmt.setString(6, regdate);
		
		result = psmt.executeUpdate();
		conn.close();
				
	}catch(Exception e){
		e.printStackTrace();
	}
	
	Gson gson = new Gson();
	
	JsonObject jsonObj = new JsonObject();
	jsonObj.addProperty("result", result);
	
	String jsonStr = gson.toJson(jsonObj);
	out.print(jsonStr);	
%>
