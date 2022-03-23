<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../_header.jsp" %>
<jsp:include page="./inc/_${cate}.jsp"/>
<section id="board" class="view">
    <h3>글보기</h3>
    <table>
        <tr>
            <td>제목</td>
            <td><input type="text" name="title" value="${article.title}" readonly/></td>
        </tr>
        <c:if test="${article.file > 0}">
         <tr>
             <td>첨부파일</td>
             <td>
                 <a href="/Farmstory2/board/fileDownload.do?fid=${article.fv.fid}">${article.fv.oName}</a>
                 <span>${article.fv.download}회 다운로드</span>
             </td>
         </tr>
        </c:if>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="content" readonly>${article.content}</textarea>
            </td>
        </tr>
    </table>
    <div>
        <a href="/Farmstory2/board/delete.do?cate=${cate}&type=${type}&no=${article.no}" class="btnDelete">삭제</a>
        <a href="/Farmstory2/board/modify.do?cate=${cate}&type=${type}&no=${article.no}" class="btnModify">수정</a>
        <a href="/Farmstory2/board/list.do?cate=${cate}&type=${type}" class="btnList">목록</a>
    </div>  
    
    <!-- 댓글리스트 -->
    <section class="commentList">
        <h3>댓글목록</h3>
        <c:forEach var="comment" items="${comments}">
         <article class="comment">
             <span>
                 <span>${comment.nick}</span>
                 <span>${comment.rdate}</span>
             </span>
             <textarea name="content" readonly>${comment.content}</textarea>
             <div>
                 <a href="#" class="del" data-no="${comment.no}">삭제</a>
                 <a href="#" class="modify" data-no="${comment.no}" data-mode="r">수정</a>	                        
             </div>
         </article>
        </c:forEach>
        
        <c:if test="${comments.size() == 0}">
        	<p class="empty">등록된 댓글이 없습니다.</p>
        </c:if>
    </section>
            <script>
            	$(function(){
         			$('.btnDelete').click(function(){
            			
            				let isOk = confirm('정말 삭제 하시겠습니까?');
            			
            				if(isOk){
            					return true;	
            				}else{
            					return false;
            				}
         			});
            	});
            
            
           		// 댓글 삭제/수정
            	$(function(){
            		
            		// 댓글 삭제 - 동적 이벤트 구현
            		$(document).on('click', '.comment > div > .del', function(e){
            			e.preventDefault();
            			
            			let parentArticle = $(this).parent().parent();
            			
            			let result = confirm('정말 삭제하시겠습니까?');
            			if(!result){
            				return;
            			}
						
            			let no = $(this).attr('data-no');
            			let jsonData = {"no":no};
            			let url = "/Farmstory2/board/commentDelete.do";
            			
            			$.get(url, jsonData, function(data){
            				
            				if(data.result == 1){
            					alert("삭제 되었습니다.");
            					// 화면 동적 삭제
            					parentArticle.remove();
            				}
            				
            			}, 'json');
            		});
            		
            	}); // 댓글 삭제 끝
            
	    		// 댓글 수정 - 동적 이벤트 구현
	    		$(document).on('click', '.comment > div > .modify', function(e){
	    			e.preventDefault();
	    			
	    			let mode = $(this).attr('data-mode');
	    			
	    			if(mode == 'r'){
	    				// 수정모드 전환
	    				$(this).attr('data-mode', 'w');
	    				
	    				let tag = $(this);    			
		    			let textarea = tag.parent().prev();
		    			
		    			tag.prev().hide();		    			
		    			tag.text('수정하기');
		    			
		    			textarea.attr('readonly', false).focus();
		    			textarea.css({'background':'white', 'outline':'1px solid gray'});
		    			
	    			}else{
	    				// 수정완료 하기
	    				$(this).attr('data-mode', 'r');
	    				
	    				let tag = $(this);    			
		    			let textarea = tag.parent().prev();    			 			
		    			
		    			let content = textarea.val();
		    			let no = tag.attr('data-no');
		    			
		    			let jsonData = {"content": content, "no": no};
		    			
		    			
		    			$.ajax({
		    				url: '/Farmstory2/board/commentModify.do',
		    				type: 'post',
		    				data: jsonData,
		    				dataType: 'json',
		    				success: function(data){
		    					if(data.result == 1){
		    						alert('댓글을 수정 했습니다.');
		    						// 수정완료 모드로 전환
		    						tag.text('수정');
		    						tag.prev().show();		    						
		    						textarea.attr('readonly', true);
		    						textarea.css({'background':'transparent', 'outline':'none'});
		    					}
		    				}
		    			});
	    			}
	    		});// 댓글 수정 끝
            
            	// 댓글 등록
	            $(function(){
	            	
	            	$('.commentForm > form').submit(function(){
	            		
	            		let inputParent = $(this).children('input[name=parent]');
	            		let inputUid    = $(this).children('input[name=uid]');
	            		let textarea    = $(this).children('textarea[name=content]');
	            		
	            		let parent  = inputParent.val();
	            		let uid     = inputUid.val();
	            		let content = textarea.val();
	            		
	            		let jsonData = {"parent": parent, "uid": uid, "content": content };
	            		
	            		$.ajax({
	            			url: '/Farmstory2/board/comment.do',
	            			type: 'post',
	            			data: jsonData,
	            			dataType: 'json',
	            			success: function(data){
	            				
	            				console.log(data);
	            				// 화면 동적 생성
            					let html = `<article class="comment">
				        	                    <span>
				    	                        	<span class="nick">닉네임</span>
				    	                        	<span class="rdate">22-03-16</span>
				    	                    	</span>
				    	                    	<textarea name="comment" readonly>댓글내용</textarea>
				    	                    	<div>
				    	                        	<a href="#" class="del">삭제</a>
				    	                        	<a href="#" class="modify" data-mode="r">수정</a>
				    	                    	</div>
				    	                	</article>`;
            					
				    	        
            					let dom = $(html);
        						
            					dom.find('.nick').text(data.nick);
            					dom.find('.rdate').text(data.rdate);
            					dom.find('textarea').text(data.content);
            					dom.find('.del').attr('data-no', data.no);
            					dom.find('.modify').attr('data-no', data.no);
            					
            					$('.commentList').append(dom);
            					
            					textarea.val("");
            					$('.empty').remove();
            					
            					
	            			} // success end
	            		}); // ajax end
	            		
	            		return false;
	            	});
	            });
            </script>

    <!-- 댓글입력폼 -->
    <section class="commentForm">
        <h3>댓글쓰기</h3>
        <form action="#" method="post">
        	<input type="hidden" name="parent" value="${article.no}"/>
        	<input type="hidden" name="uid" value="${sessUser.uid}"/>
            <textarea name="content"></textarea>
            <div>
                <a href="#" class="btnCancel">취소</a>
                <input type="submit" class="btnWrite" value="작성완료"/>
            </div>
        </form>
    </section>
</section>

<!-- 내용 끝 -->
</article>
</section>
</div>

<%@ include file="../_footer.jsp" %>