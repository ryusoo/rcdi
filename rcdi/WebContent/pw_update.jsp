<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic');
	.member_wrap {
		width: 960px;
		margin: 190px auto 60px;
		border: none;
		padding: 0;
	}
	.member_header {
		margin-left: 350px;
		padding-bottom: 28px;
		margin-bottom: 41px;
		position: relative;
		z-index: 1;
	}
	.tit {
		font-size: 26px;
		color: #111;
		line-height: 28px;
	}
	.location {
		position: absolute;
		right: 0;
		top: 12px;
		list-style: none;
	}
	.location li {
		float: left;
		letter-spacing: -0.5px;
		margin-left: 18px;
		font-size: 15px;
		margin-bottom: 15px;
	}
	.step { color: #999; }
	#step2 {
		color: black;
		font-weight: bold;
	}
	.container {
		width: 770px;
		margin: 0 auto;
		max-width: 770px;
		min-width: 460px;
	}
	.join_row {
		margin-bottom: 25px;
	}
	.pswd_space {
		padding-bottom: 5px;
		margin-bottom: 10px;
	}

	/* 회원가입 정보 */
	.join_content {
		width: 460px;
		margin: 0 auto;
	}
	.ps_box {
		display: block;
		position: relative; /* step_url의 기준 */
		width: 100%;
		height: 51px;
		border: 1px solid #dadada;
		padding: 10px 14px;
		background: #fff;
		vertical-align: top;
		z-index: 1;
	}
	.msg_box {
		position: absolute;
		z-index: 10;
		top: 10px;
		right: -28px;
	}
	
	/* input박스 */
	.int {
		display: block;
		position: relative;
		width: 100%; /* input태그가 가질 수 있는 영역을 다 차지하라고 100%를 줬다. 근데 그 영역을 알려면 부모를 봐야한다 */
		height: 29px;
		padding-right: 25px;
		line-height: 29px;
		border: none;
		background: #fff;
		font-size: 15px;
		z-index: 10;
	}
	.step_url {
		position: absolute; /* 기준은 ps_box임 */
		top: 16px; /* 위에서 안쪽으로 16px */
		right: 13px; /* 오른쪽에서 안쪽으로 13px  */
		font-size: 15px;
		line-height: 18px;
		color: #8e8e8e;
	}
	.error_next_box {
		display: none; /* block이라고 해주면 나중에 유효성체크후에 "필수정보입니다"가 빨간 글씨로 뜬다 */
		margin: 9px 0 -2px;
		font-size: 12px;
		line-height: 14px;
		color: red;
		height: 15px;
	}
	.int_pass {
		padding-right: 40px;
	}
	.join_agree {
		margin-top: 18px;
	}
	.re_list {
		width: 320px;
		margin: 0 auto;
		list-style: none;
	}
	
	/* 수정하기 버튼 */
	.btn_double_area {
		margin: 30px -5px 0px;
		overflow: hidden;
	}
	.btn_double_area > span {
		display: block;
		width: 100%;
	}
	.btn_type {
		width: auto;
		margin: 0 5px;
		font-size: 20px;
		font-weight: 600;
		line-height: 61px;
		display: block;
		height: 61px;
		padding-top: 1px;
		text-align: center;
		color: white!important;
		border: 1px solid #333;
		background-color: #333;
	}
	.line {
		border-top: 1px solid dimgray;
		width: 460px;
		margin: 0 auto 35px;
	
	}
</style>
</head>
<body>
	<div class="member_wrap">
		<header class="member_header">
			<h1 class="tit">
				<a href="#" class="rcdi_logo">RCDI</a>
				<span>비밀번호 수정</span>
			</h1>
		</header>
		<section>
			<form action="memberPlay.rcdi" class="member_form" id="frm_mem" method="POST" name="frm_mem">
				<div class="container">
					<div class="join_content">
						<div class="join_row">
							<span class="ps_box int_pass">
								<input type="password" id="pw" name="pw" class="int" maxlength="20" placeholder="기존 비밀번호"> 
									<!-- 비밀번호니까 type을 text로안하고 password로 바꿈 -->
								<span class="step_url"></span>
							</span>
								<span class="error_next_box" id="test">필수정보입니다.</span>
						</div>
						<div class="pswd_space"></div>
						<div class="line"></div>
						<div class="join_row">
							<span class="ps_box int_pass">
								<input type="password" id="npw" name="npw" class="int" maxlength="20" placeholder="새 비밀번호(6~20자의 영문 대소문자 및 숫자 조합)"> 
									<!-- 비밀번호니까 type을 text로안하고 password로 바꿈 -->
								<span class="step_url">
									<i class="fas fa-unlock-alt"></i>
								</span>
							</span>
								<span class="error_next_box">필수정보입니다.</span>
						</div>
						<div class="join_row">
							<span class="ps_box int_pass">
								<input type="password" id="nrpw" name="nrpw" class="int" maxlength="20" placeholder="새 비밀번호 재확인"> 
								<!-- 비밀번호니까 type을 text로안하고 password로 바꿈 -->
								<span class="step_url">
									<i class="fas fa-unlock"></i>
								</span>
							</span>
							<span class="error_next_box">필수정보입니다.</span>
						</div>
						<div class="btn_double_area">
							<span>
								<a href="#" class="btn_type btn_agree">수정하기</a>
							</span>
						</div>
					</div>
				</div>
			</form>
		</section>
	</div>
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