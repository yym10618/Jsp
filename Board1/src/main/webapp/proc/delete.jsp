<%@page import="kr.co.board1.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	
	ArticleDao.getInstance().deleteArticle(id);
	
	response.sendRedirect("/Board1/list.jsp");
%>