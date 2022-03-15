<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글목록</title>
    <link rel="stylesheet" href="./css/style.css">    
</head>
<body>
    <div id="wrapper">
        <section id="board" class="list">
            <h3>글목록</h3>
            <article>
                <p>
                    ${sessUser.nick}님 반갑습니다.
                    <a href="/Board2/user/logout.do" class="logout">[로그아웃]</a>
                </p>
                <table border="0">
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>글쓴이</th>
                        <th>날짜</th>
                        <th>조회</th>
                    </tr>
                    
                    <c:forEach var="article" items="${articles}">
	                    <tr>
	                        <td>${pageStartNum = pageStartNum - 1}</td>
	                        <td><a href="/Board2/view.do?no=${article.no}">${article.title}</a>&nbsp;[${article.comment}]</td>
	                        <td>${article.nick}</td>
	                        <td>${article.rdate}</td>
	                        <td>${article.hit}</td>
	                    </tr>
                    </c:forEach>
                </table>
            </article>

            <!-- 페이지 네비게이션 -->
            <div class="paging">
            	<c:if test="${groups[0] > 1}">
                	<a href="/Board2/list.do?pg=${groups[0] - 1}" class="prev">이전</a>
                </c:if>
                <c:forEach var="i" begin="${groups[0]}" end="${groups[1]}">
                	<a href="/Board2/list.do?pg=${i}" class="num ${currentPage == i ? 'current':'off'}">${i}</a>                
                </c:forEach>
				<c:if test="${groups[1] < lastPageNum}">                            
                	<a href="/Board2/list.do?pg=${groups[1] + 1}" class="next">다음</a>
                </c:if>
            </div>

            <!-- 글쓰기 버튼 -->
            <a href="/Board2/write.do" class="btnWrite">글쓰기</a>

        </section>
    </div>    
</body>
</html>