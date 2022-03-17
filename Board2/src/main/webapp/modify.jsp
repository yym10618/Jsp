<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글수정</title>
    <link rel="stylesheet" href="./css/style.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
	    $(function(){
		    $('.btnWrite').click(function(){
				
				let isOk = confirm('정말 수정 하시겠습니까?');
			
				if(isOk){
					alert('수정완료되었습니다.');
					return true;	
				}else{
					return false;
				}
			});
	    });
	</script>
</head>
<body>
    <div id="wrapper">
        <section id="board" class="modify">
            <h3>글수정</h3>
            <article>
                <form action="/Board2/modify.do" method="post">
                    <table>
                    <input type="hidden" name="no" value="${article.no}">
                        <tr>
                            <td>제목</td>
                            <td><input type="text" name="title" placeholder="제목을 입력하세요." value="${article.title}"/></td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>
                                <textarea name="content" placeholder="내용을 입력하세요.">${article.content}</textarea>                                
                            </td>
                        </tr>
                        <tr>
                            <td>첨부</td>
                            <td><input type="file" name="fname"/></td>
                        </tr>
                    </table>
                    <div>
                        <a href="/Board2/list.do" class="btnCancel">취소</a>
                        <input type="submit"  class="btnWrite" value="수정완료">
                    </div>
                </form>
            </article>
        </section>
    </div>
</body>
</html>