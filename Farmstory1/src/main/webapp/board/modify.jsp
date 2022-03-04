<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String cate = request.getParameter("cate");
	String type = request.getParameter("type");
	String no = request.getParameter("no");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	pageContext.include("./inc/_"+cate+".jsp");
%>
<section id="board" class="modify">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
        <form action="/Farmstory1/board/proc/update.jsp">
            <table>
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title" placeholder="제목을 수정하세요"/></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td>
                        <textarea name="content" placeholder="내용을 수정하세요"></textarea>                                
                    </td>
                </tr>
                <tr>
                    <td>첨부</td>
                    <td><input type="file" name="file"/></td>
                </tr>
            </table>
            <div>
                <a href="/Farmstory1/board/view.jsp?cate=<%= cate %>&type=<%= type %>&no=<%=no %>" class="btnCancel">취소</a>
                <input type="submit"  class="btnWrite" value="수정완료">
                <input type="hidden"  name="cate" value="<%=cate%>">
                <input type="hidden"  name="type" value="<%=type%>">
                <input type="hidden"  name="no" value="<%=no%>">
                <input type="hidden"  name="title" value="<%=title%>">
                <input type="hidden"  name="content" value="<%=content%>">
            </div>
        </form>
    </article>
</section>


<!-- 내용 끝 -->
</article>
</section>
</div>
<%@ include file="../_footer.jsp" %>