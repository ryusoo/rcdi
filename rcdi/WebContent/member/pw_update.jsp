<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.section_outline {
	height: auto;
}
.section_inline {
    height: auto;
    width: 400px;
    margin: 0 auto;
}
.title {
    text-align: center;
    padding: 50px 0;
    font-size: 30px;
    font-weight: 600;
    color: #363636;
}
.input_box {
    font-size: 16px;
    line-height: 40px;
    padding: 0 10px;
    width: 100%;
    letter-spacing: -1;
    border: 1px solid #dadada;
    outline-color: black;
    margin-bottom: 13px;
}
.error_next_box {
    color: tomato;
    font-size: 12px;
    padding: 5px;
    letter-spacing: -1;
    display: none;
    margin-bottom: 10px;
}
.space {
    width:100%;
    border: 1px solid dimgray;
    margin: 20px 0;
}
.btn_update {
    display: flex;
    margin: 20px auto;
    width: 100%;
    line-height: 40px;
    background-color: #363636;
    font-size: 16px;
    color: white;
    letter-spacing: -1;
    text-align: center;
    margin: 10px 0 100px;
}
.cancel_btn {
    flex: 1;
    color: black;
    background-color: white;
    font-weight: 700;
    color: #363636;
    cursor: pointer;
    font-size: 18px;
    border: 1px solid #363636;
}
.update_btn {
    flex: 1;
    color: white;
    background-color: #363636;
    font-weight: 700;
    font-size: 18px;
    cursor: pointer;
}
</style>
</head>
<body>
	<section>
		<div class="section_outline">
			<div class="section_inline">
				<div class="title">비밀번호 수정</div>
				<form action="pwUpdatePlay.rcdi" id="frm_mem" method="POST" name="frm_mem">
					<!-- ID값을 가져와야 하는데 session에 있음. 세션에서 가져오는 2가지 경우 중 하나. 
					type="hidden"하면 안 나오지만 데이터를 받아올 수 있다. 여기서 받아서 PwUpdatePlayAction에서 쉽게 보낼 수 있음   -->
					<input type="hidden" name="id" value="${sessionScope.loginUser.id}">
					<input type="password" id="pw" name="pw" class="input_box" maxlength="20" placeholder="현재 비밀번호">
					<span class="error_next_box pwAjax">필수입력 정보입니다.</span>
						
					<div class="space"></div>
						
					<input type="password" id="npw" name="npw" class="input_box" maxlength="20" placeholder="새 비밀번호">
					<span class="error_next_box">필수입력 정보입니다.</span>
						
					<input type="password" id="nrpw" name="nrpw" class="input_box" maxlength="20" placeholder="새 비밀번호 재확인">
					<span class="error_next_box">필수입력 정보입니다.</span>
                                        
					<div class="btn_update">
						<div class="cancel_btn">취소</div>
						<div class="update_btn">비밀번호 수정</div>
					</div>
				</form>
			</div>
		</div>
	</section>
<%@ include file="include/footer.jsp"%>
<script type="text/javascript" src="js/validation.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var currentPw = false;
		var newPwEq = false;
		
		$('.update_btn').click(function(){
			var postPw = $('#pw').val();
			var newPw = $('#npw').val();
			
			if(!currentPw){
				// 1. 현재 비밀번호가 맞는 지 확인(현재비밀번호가 계속  false이고 비밀번호가 일치할 때만 true주고 submit되게함)
				$('#pw').focus();
				return false;
			} else if(!newPwEq){
				// 2. 새비밀번호와 새비밀번호확인 유효성체크
				$('#npw').focus();
				return false;
			} else if(postPw == newPw) {
				// 3. 현재비밀번호와 새비밀번호가 같은지 체크
				$('#npw').focus();
				$('.error_next_box').eq(1).text("현재비밀번호와 다르게 입력해주세요.").css("display","block").css("color", "#FF3636");
				return false;
			}
			// 위의 3단계를 다 거쳐야지 submit을 할 수 있다
			$('#frm_mem').submit();
		});
		
		$("#pw").blur(function() {
			//Ajax를 활용하여 입력한 비밀번호와 현재 유저의 비밀번호가 일치하는지 확인
			var nowPw = $("#pw").val(); // 입력한 비밀번호
			var nowId = "${sessionScope.loginUser.id}"; // 비밀번호가 중복이 있을 수 있기 때문에 세션에서 ID가져옴
			if(nowPw != null || nowPw.length != 0){
				currentPw = ajaxPwCheck(nowId, nowPw);
			}
		});
		
		
		// npw 
		$('#npw').blur(function() {					
			var memPw = $.trim($('#npw').val());
			var memRpw = $.trim($("#nrpw").val());
			// checkPw한 결과값
			var checkResult = joinValidate.checkPw(memPw, memRpw);
			// code와 desc를 가져옴
			
			// alert(checkResult.code);
			// alert(checkResult.desc);

			if(checkResult.code != 0) {
				$('.error_next_box').eq(1).text(checkResult.desc).css('display', 'block').css('color', '#FF3636');
				return false;
			} else {
				$('.error_next_box').eq(1).text(checkResult.desc).css('display', 'block').css('color', '#0000FF');
				if (memRpw != null || memRpw.length != 0) {
					if (memPw == memRpw) {
						$('.error_next_box').eq(2).text('사용가능한 비밀번호입니다.').css("display", "block").css("color", "#0000FF");
					} else {
						$('.error_next_box').eq(2).text('입력하신 비밀번호가 일치하지 않습니다.').css("display", "block").css("color", "#FF3636");
						return false;
					}
				} // if끝
				return true;
			}
			return false;
		});

		// 비밀번호 재확인(비교)
		$("#nrpw").blur(function() {
			var memPw = $.trim($('#npw').val());
			var memRpw = $.trim($("#nrpw").val());
			// checkRpw한 결과값
			var checkResult = joinValidate.checkRpw(memPw, memRpw);
			// code와 desc를 가져옴
			//alert(checkResult.code);
			// alert(checkResult.desc);

			if(checkResult.code != 0) {
				$('.error_next_box').eq(2).text(checkResult.desc).css('display', 'block').css('color', '#FF3636');
				return false;
			} else {
				$('.error_next_box').eq(2).text(checkResult.desc).css('display', 'block').css('color', '#0000FF');
				if (memPw != null || memPw.length != 0) {
					if (memPw == memRpw) {
						newPwEq = true;
						$('.error_next_box').eq(2).text('비밀번호가 일치합니다.').css("display", "block").css("color", "#0000FF");
					} else {
						newPwEq = false;
						$('.error_next_box').eq(2).text('입력하신 비밀번호가 일치하지 않습니다.').css("display", "block").css("color", "#FF3636");
						return false;
					}
				} // if끝
				return true;
			}
			return false;
		});
		
	});
	
</script>
</body>
</html>
