<%@page import="kr.co.board1.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	ArticleDao.getInstance().updateArticle(title, content, id);
	
	response.sendRedirect("/Board1/view.jsp?id="+id);
%>