<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.MemberBean"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String host = "jdbc:mysql://chhak.or.kr:3306/yym10618";
	String user = "yym10618";
	String pass = "1234";
	
	List<MemberBean> members = new ArrayList<>();
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT * FROM `Member`";
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){	
			
			MemberBean mb = new MemberBean();
			mb.setUid(rs.getString(1));
			mb.setName(rs.getString(2));
			mb.setHp(rs.getString(3));
			mb.setPos(rs.getString(4));
			mb.setDep(rs.getInt(5));
			mb.setRdate(rs.getString(6));
			
			members.add(mb);
		}
		
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// json 데이터 출력
	Gson gson = new Gson();
	String jsonData = gson.toJson(members);
	
	out.print(jsonData);
%>