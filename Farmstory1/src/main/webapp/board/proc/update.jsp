<%@page import="kr.co.farmstory1.bean.ArticleBean"%>
<%@page import="kr.co.farmstory1.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String no = request.getParameter("no");
	String cate = request.getParameter("cate");
	String type = request.getParameter("type");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	ArticleDao.getInstance().updateArticle(title, content, no);
	
	response.sendRedirect("/Farmstory1/board/view.jsp?cate="+cate+"&type="+type+"&no="+no);
%>