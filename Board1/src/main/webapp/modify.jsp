<%@page import="kr.co.board1.bean.ArticleBean"%>
<%@page import="kr.co.board1.dao.ArticleDao"%>
<%@page import="kr.co.board1.bean.UserBean"%>
<%
	UserBean sessUser = (UserBean) session.getAttribute("sessUser");
	
	// 로그인하지 않고 글목록 요청하면 로그인 페이지로 이동시킴
	if(sessUser == null){
		response.sendRedirect("/Board1/user/login.jsp?success=102");
		return; // <-- 프로그램 실행 여기까지
	}

	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	
	// 글 가져오기
	ArticleDao dao = ArticleDao.getInstance();
	ArticleBean article = dao.selectArticle(id);
%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글수정</title>
    <link rel="stylesheet" href="./css/style.css"/>
</head>
<body>
    <div id="wrapper">
        <section id="board" class="modify">
            <h3>글수정</h3>
            <article>
                <form action="/Board1/proc/update.jsp" method="post">
                	<input type="hidden" name="id" value=<%=article.getId() %>>
                    <table>
                        <tr>
                            <td>제목</td>
                            <td><input type="text" name="title" placeholder="제목을 입력하세요."/></td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>
                                <textarea name="content"></textarea>                                
                            </td>
                        </tr>
                        <tr>
                            <td>첨부</td>
                            <td><input type="file" name="file"/></td>
                        </tr>
                    </table>
                    <div>
                        <a href="./list.jsp" class="btnCancel">취소</a>
                        <input type="submit"  class="btnWrite" value="수정완료">
                    </div>
                </form>
            </article>
        </section>
    </div>
</body>
</html>