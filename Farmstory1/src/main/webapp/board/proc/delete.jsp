<%@page import="kr.co.farmstory1.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String no = request.getParameter("no");
	String cate = request.getParameter("cate");
	String type = request.getParameter("type");
	
	ArticleDao.getInstance().deleteArticle(no);
	
	response.sendRedirect("/Farmstory1/board/list.jsp?cate="+cate+"&type="+type+"&no="+no);
%>