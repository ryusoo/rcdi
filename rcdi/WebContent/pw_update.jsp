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
				<form action="memberPlay.rcdi" id="frm_mem" method="POST" name="frm_mem">
					
					<input type="password" id="pw" name="pw" class="input_box" maxlength="20" placeholder="비밀번호">
					<span class="error_next_box">필수입력 정보입니다.</span>
						
					<div class="space"></div>
						
					<input type="password" id="npw" name="npw" class="input_box" maxlength="20" placeholder="비밀번호">
					<span class="error_next_box">필수입력 정보입니다.</span>
						
					<input type="password" id="nrpw" name="nrpw" class="input_box" maxlength="20" placeholder="비밀번호 재확인">
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
		$("#pw").blur(function() {
			var pw = $.trim($("#pw").val());
                                
			var regEmpty = /\s/g; // 공백문자
			var pwReg = RegExp(/^[a-zA-Z0-9]{4,12}$/); // 비밀번호 체크 /^이면 true, false가 반대가 된다
                
			 if (pw == "" || pw.length == 0) {
				$(".error_next_box").eq(0).text("필수입력 정보입니다.").css("display","block").css("color", "#FF3636");
				return false;
			} else if (pw.match(regEmpty)) {
				$(".error_next_box").eq(0).text("공백없이 입력해주세요.").css("display","block").css("color", "#FF3636");
				return false;
			} else if (!pwReg.test(pw)) { // 위의 정규식에서 /^이기 때문에 true, false가 반대가 되어!를 써야함			
				$(".error_next_box").eq(0).text("올바른 비밀번호(4~12자)를 입력해주세요").css(	"display", "block").css("color","#FF3636");
				return false;
			} else {
				$(".error_next_box").eq(0).text("사용가능한 비밀번호입니다.").css("display","block").css("color", "#0000FF");
			} 
		});
                        
		$("#npw").blur(function() {
			var npw = $.trim($("#npw").val());
                                
			var regEmpty = /\s/g; // 공백문자
			var pwReg = RegExp(/^[a-zA-Z0-9]{4,12}$/); // 비밀번호 체크 /^이면 true, false가 반대가 된다
                
			if (npw == "" || npw.length == 0) {
				$(".error_next_box").eq(1).text("필수입력 정보입니다.").css("display","block").css("color", "#FF3636");
				return false;
			} else if (npw.match(regEmpty)) {
				$(".error_next_box").eq(1).text("공백없이 입력해주세요.").css("display","block").css("color", "#FF3636");
				return false;
 			} else if (!pwReg.test(npw)) { // 위의 정규식에서 /^이기 때문에 true, false가 반대가 되어!를 써야함			
				$(".error_next_box").eq(1).text("올바른 비밀번호(4~12자)를 입력해주세요").css(	"display", "block").css("color","#FF3636");
				return false;
			} else {
				$(".error_next_box").eq(1).text("사용가능한 비밀번호입니다.").css("display","block").css("color", "#0000FF");
			} 
                        
			var nrpw = $.trim($("#nrpw").val());
                        
			if(npw == nrpw) {
				$(".error_next_box").eq(2).text("사용가능한 비밀번호입니다.").css("display","block").css("color", "#0000FF");
			}
		});
                        
		$("#nrpw").blur(function() {
			var npw = $.trim($("#npw").val());
			var nrpw = $.trim($("#nrpw").val());

			var regEmpty = /\s/g; // 공백문자
    	    var pwReg = RegExp(/^[a-zA-Z0-9]{4,12}$/); // 비밀번호 체크 /^이면 true, false가 반대가 된다

			if (nrpw == "" || nrpw.length == 0) {
				$(".error_next_box").eq(2).text("필수입력 정보입니다.").css("display","block").css("color", "#FF3636");
				return false;
			} else if (nrpw.match(regEmpty)) {
                $(".error_next_box").eq(2).text("공백없이 입력해주세요.").css("display","block").css("color", "#FF3636");
                return false;
			} else if (!pwReg.test(nrpw)) { // 위의 정규식에서 /^이기 때문에 true, false가 반대가 되어!를 써야함			
                $(".error_next_box").eq(2).text("올바른 비밀번호(4~12자)를 입력해주세요").css(	"display", "block").css("color","#FF3636");
                return false;
			} else if (npw != nrpw) {
                $(".error_next_box").eq(2).text("입력하신 비밀번호가 일치하지 않습니다.").css("display", "block").css("color","#FF3636");
                return false;
			} else {
                $(".error_next_box").eq(2).text("사용가능한 비밀번호입니다.").css("display","block").css("color", "#0000FF");
			}
		});
	});
</script>
</body>
</html>
