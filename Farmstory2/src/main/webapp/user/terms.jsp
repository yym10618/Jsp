<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<script>
	$(function(){
		$('.terms > div > a:eq(1)').click(function(){
			let isChecked1 = $('input[name=chk1]').is(':checked');
			let isChecked2 = $('input[name=chk2]').is(':checked');
			
			if(!isChecked1){
				alert('이용약관에 동의 체크를 하셔야 합니다.');
				return false;
			}else if(!isChecked2){
				alert('개인정보 취급방침에 동의 체크를 하셔야 합니다.');
				return false;	
			}else{
				return true;
			}
		});
	});
</script>
<section id="user" class="terms">
    <table>
        <caption>사이트 이용약관</caption>
        <tr>
            <td>
                <textarea readonly>${termsVo.terms}</textarea>
                <p>
                    <label><input type="checkbox" name="chk1"/>동의합니다.</label>
                </p>
            </td>
        </tr>
    </table>
    <table>
        <caption>개인정보 취급방침</caption>
        <tr>
            <td>
                <textarea readonly>${termsVo.privacy}</textarea>
                <p>
                    <label><input type="checkbox" name="chk2"/>동의합니다.</label>
                </p>
            </td>
        </tr>
    </table>
    <div>
        <a href="/Farmstory2/user/login.do">취소</a>
        <a href="/Farmstory2/user/register.do">다음</a>
    </div>
</section>
<%@ include file="../_footer.jsp" %>   