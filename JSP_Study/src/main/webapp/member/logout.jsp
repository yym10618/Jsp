<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%	
	// 세션 종료(로그아웃)
	session.invalidate();
	response.sendRedirect("./login.jsp?success=101");

%>