<%@page import="bean.StudentsBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 데이터 수신
	request.setCharacterEncoding("utf-8");
	String host = "jdbc:mysql://chhak.or.kr:3306/yym10618";
	String user = "yym10618";
	String pass = "1234";
	
	List<StudentsBean> stds = new ArrayList<>();
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT * FROM `Students`";
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			
			StudentsBean sb = new StudentsBean();
			sb.setSid(rs.getString(1));
			sb.setName(rs.getString(2));
			sb.setGender(rs.getInt(3));
			sb.setHp(rs.getString(4));
			sb.setGrade(rs.getInt(5));
			sb.setRegdate(rs.getString(6));
			
			stds.add(sb);
		}
		
		
		conn.close();
				
	}catch(Exception e){
		e.printStackTrace();
	}
	
	Gson gson = new Gson();
	String jsonData = gson.toJson(stds);
	out.print(jsonData);	
%>
