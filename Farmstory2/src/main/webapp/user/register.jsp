<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<script>
	//Validation 수행(유효성 검증)
	// 데이터 형식을 검사하기 위한 정규표현식(Regular Expression)
	let reUid  = /^[a-z]+[a-z0-9]{3,9}$/;
	let rePass = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{5,}$/;
	let reName = /^[가-힣]{2,10}$/;
	let reNick = /^[a-z가-힣0-9]{2,5}$/;
	
	//최종 유효성 검사에 사용될 상태변수
	let isUidOk   = false;
	let isPassOk  = false;
	let isNameOk  = false;
	let isNickOk  = false;
	let isEmailOk = false;
	let isHpOk    = false;
	
	$(function(){
		
		// 아이디 중복체크
		$('input[name=uid]').keyup(function(){
			
			let value = $(this).val();
			
			console.log(value);
			
			if(value.length > 3){
				
				let jsonData = {"uid": value};
				
				$.ajax({
					url: '/Farmstory2/user/checkUid.do',
					type: 'GET',
					data: jsonData,
					dataType: 'json',
					success: function(data){
						
						if(data.result == 1){
							$('.resultId').css('color', 'red').text('이미 사용중인 아이디 입니다.');
						}else{
							$('.resultId').css('color', 'green').text('사용 가능한 아이디 입니다.');
						}
					}
				});
			}else{
				$('.resultId').text('아이디는 최소 4자 이상이어야 합니다.');
			}
		});
		
		// 비밀번호 유효성 검사
		$('input[name=pass1]').focusout(function(){
			
			let pw1 = $('input[name=pass1]').val(); 
			let pw2 = $('input[name=pass2]').val(); 
			
			if(rePass.test(pw1)){
				$('.insertPass').css('color', 'green').text('사용가능한 비밀번호입니다.');
				isPassOk = true;
			}else{
				$('.insertPass').css('color', 'red').text('비밀번호는 영문, 숫자, 특수문자 최소 4이상 이어야 합니다.');
				isPassOk = false;
			}
		});
		
		$('input[name=pass2]').focusout(function(){
			
			let pw1 = $('input[name=pass1]').val(); 
			let pw2 = $('input[name=pass2]').val(); 
			
			if(pw1 == pw2){
				$('.resultPass').css('color', 'green').text('비밀번호가 일치 합니다.');
				isPassOk = true;
			}else{
				$('.resultPass').css('color', 'red').text('비밀번호가 일치하지 않습니다.');
				isPassOk = false;
			}
		});
		
		// 이름 유효성 검사
		$('input[name=name]').focusout(function(){
			
			let name = $(this).val();
			
			if(reName.test(name)){
				$('.resultName').text('');
				isNameOk = true;
			}else{
				$('.resultName').css('color', 'red').text('이름은 한글로 2자 이상이어야 합니다.');
				isNameOk = false;
			}
		});
		
		// 닉네임 중복체크
		$('input[name=nick]').keyup(function(){
			
			let value = $(this).val();
			
			console.log(value);
			
			if(value.length > 1){
				
				let jsonData = {"nick": value};
				
				$.ajax({
					url: '/Farmstory2/user/checkNick.do',
					type: 'GET',
					data: jsonData,
					dataType: 'json',
					success: function(data){
						
						if(data.result == 1){
							$('.resultNick').css('color', 'red').text('이미 사용중인 닉네임 입니다.');
						}else{
							$('.resultNick').css('color', 'green').text('사용 가능한 닉네임 입니다.');
						}
					}
				});
			}else{
				$('.resultNick').css('color', 'red').text('닉네임은 최소 2자 이상이어야 합니다.');
			}
		});
		
		// 이메일 중복체크
		$('input[name=email]').focusout(function(){
			
			let value = $(this).val();
			
			console.log(value);
			
			let jsonData = {"email": value};
				
				$.ajax({
					url: '/Farmstory2/user/checkEmail.do',
					type: 'GET',
					data: jsonData,
					dataType: 'json',
					success: function(data){
						
						if(data.result == 1){
							$('.resultEmail').css('color', 'red').text('이미 사용중인 이메일 입니다.');
						}else{
							$('.resultEmail').css('color', 'green').text('사용 가능한 이메일 입니다.');
						}
					}
				});
		});
		
		
		// 휴대폰 중복체크
		$('input[name=hp]').focusout(function(){
			
			let value = $(this).val();
			
			console.log(value);
			
			let jsonData = {"hp": value};
				
				$.ajax({
					url: '/Farmstory2/user/checkHp.do',
					type: 'GET',
					data: jsonData,
					dataType: 'json',
					success: function(data){
						
						if(data.result == 1){
							$('.resultHp').css('color', 'red').text('이미 사용중인 전화번호 입니다.');
						}else{
							$('.resultHp').css('color', 'green').text('사용 가능한 전화번호 입니다.');
						}
					}
				});
		});
	});
</script>
<section id="user" class="register">
    <form action="/Farmstory2/user/register.do" method="POST">
        <table border="1">
            <caption>사이트 이용정보 입력</caption>
            <tr>
                <td>아이디</td>
                <td>
                    <input type="text" name="uid" placeholder="아이디 입력"/>
                    <span class="resultId"></span>
                </td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td>
                    <input type="password" name="pass1" placeholder="비밀번호 입력"/>     
                    <span class="insertPass"></span>                       
                </td>
            </tr>
            <tr>
                <td>비밀번호 확인</td>
                <td>
                    <input type="password" name="pass2" placeholder="비밀번호 확인 입력"/>
                    <span class="resultPass"></span>
                </td>
            </tr>
        </table>
        <table border="1">
            <caption>개인정보 입력</caption>
            <tr>
                <td>이름</td>
                <td>
                    <input type="text" name="name" placeholder="이름 입력"/>                            
                </td>
            </tr>
            <tr>
                <td>별명</td>
                <td>
                    <p>공백없이 한글, 영문, 숫자만 입력가능</p>
                    <input type="text" name="nick" placeholder="별명 입력"/>
                    <span class="resultNick"></span>                            
                </td>
            </tr>
            <tr>
                <td>E-Mail</td>
                <td>
                    <input type="email" name="email" placeholder="이메일 입력"/>
                    <span class="resultEmail"></span>
                </td>
            </tr>
            <tr>
                <td>휴대폰</td>
                <td>
                    <input type="text" name="hp" placeholder="- 포함 13자리 입력" minlength="13" maxlength="13" />
                    <span class="resultHp"></span>
                </td>
            </tr>
            <tr>
                <td>주소</td>
                <td>
                    <div>
                        <input type="text" name="zip" placeholder="우편번호" readonly/>
                        <button class="btnZip">주소검색</button>
                    </div>                            
                    <div>
                        <input type="text" name="addr1" placeholder="주소를 검색하세요." readonly/>
                    </div>
                    <div>
                        <input type="text" name="addr2" placeholder="상세주소를 입력하세요."/>
                    </div>
                </td>
            </tr>
        </table>

        <div>
            <a href="/Farmstory2/user/login.do" class="btnCancel">취소</a>
            <input type="submit"   class="btnJoin" value="회원가입"/>
        </div>

    </form>
</section>
<%@ include file="../_footer.jsp" %>