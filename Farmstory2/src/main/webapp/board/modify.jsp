<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../_header.jsp" %>
<jsp:include page="./inc/_${cate}.jsp"/>
<section id="board" class="modify">
<script>
           	$(function(){
       			$('.btnWrite').click(function(){
           			
       				let isOk = confirm('정말 수정 하시겠습니까?');
           			
       				if(isOk){
       					return true;	
       				}else{
       					return false;
       				}
   				});
       		});
       		
</script>
    <h3>글수정</h3>
    <article>
        <form action="/Farmstory2/board/modify.do" method="post" enctype="multipart/form-data">
            <table>
            <input type="hidden" name="no" value="${article.no}">
            <input type="hidden" name="cate" value="${cate}">
            <input type="hidden" name="type" value="${type}">
            <input type="hidden" name="fname"  value="${file.fid}" />
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title" placeholder="제목을 입력하세요." value="${article.title}"/></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td>
                        <textarea name="content" >${article.content}</textarea>                                
                    </td>
                </tr>
                <tr>
                    <td>첨부</td>
                    <td><input type="file" name="fname"/></td>
                </tr>
            </table>
            <div>
                <a href="/Farmstory2/board/list.do?cate=${cate}&type=${type}" class="btnCancel">취소</a>
                <input type="submit"  class="btnWrite" value="수정완료">
            </div>
        </form>
    </article>
</section>
	
<!-- 내용 끝 -->
</article>
</section>
</div>
<%@ include file="../_footer.jsp" %>