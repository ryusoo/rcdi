<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<title>member_delete.html</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic');

* {
	box-sizing: border-box;
	font-family: 'Nanum Gothic', sans-serif;
}

body, h1, ul, p, h3 {
	margin: 0;
	padding: 0;
}

body {
	background: #f5f6f7;
}

ul {
	list-style: none;
}

a {
	text-decoration: none;
}

.member_wrap {
	width: 960px;
	margin: 49px auto 60px;
	border: none;
	padding: 0;
}

.member_header {
	margin-left: 400px;
	padding-bottom: 28px;
	margin-bottom: 41px;
	position: relative;
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

.step {
	color: #999;
}

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

.withdraw_content {
	width: 650px;
	margin: 0 auto;
	border-radius: 50px;
	border: 5px solid dimgray;
	padding: 20px;
	margin-bottom: 50px;
}

.withdraw_content>h3 {
	text-align: center;
}

.list {
	letter-spacing: -1px;
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
}

.msg_box {
	position: absolute;
	z-index: 10;
	top: 10px;
	right: -28px;
}

.msg_pop {
	display: none;
	width: 340px;
	padding: 24px;
	border: 1px solid #333;
	background: #fff;
	font-size: 13px;
	box-sizing: border-box;
}

.int_id {
	padding-right: 110px;
}
/* input박스 */
.int {
	display: block;
	position: relative;
	width: 100%;
	/* input태그가 가질 수 있는 영역을 다 차지하라고 100%를 줬다. 근데 그 영역을 알려면 부모를 봐야한다 */
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

/* 탈퇴하기 버튼 */
.btn_double_area {
	margin: 30px -5px 0px;
	overflow: hidden;
	display: flex;
}

.btn_double_area>span {
	flex: 1;
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
	color: #fff;
	border: 1px solid #333;
	background-color: #333;
}

/* 모달창 */
#modal_wrap {
	position: fixed;
	z-index: 10;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
	align-items: center;
	justify-content: center;
	display: none;
}

#withdraw_content {
	width: 270px;
	margin: 0 auto;
	position: relative;
	margin: 10px 0px;
	/* width가 있으면 양쪽에 여백을 반토막내서 가운데 정렬해주는것이 margin: 0 auto이다; */
	text-align: center;
}

#withdraw_area {
	width: 100%;
	text-align: left;
	display: inline-block;
	background-color: white;
	border-radius: 5px;
	height: 200px;
}

.square {
	width: 100%;
	height: 25px;
	background-color: #333;
	color: white;
	margin-bottom: 10px;
	border-radius: 2px;
	padding-left: 10px;
	padding-top: 2px;
}

#subtitle {
	position: relative;
	margin: 30px 0;
	font-size: 25px;
	width: 100%;
	padding: 6px 10px 0px 10px;
	text-align: center;
}

#close_btn {
	position: absolute;
	top: 0px;
	right: 0px;
	width: 20px;
	height: 25px;
	border-radius: 5px;
	background-color: #333;
	cursor: pointer;
	transition: .2s linear;
	z-index: 9;
	color: white;
	text-align: center;
	padding-top: 4px;
}

.wrap_btn {
	width: 270px;
	margin: 0 auto;
	display: flex;
}

.wrap_btn>a>span {
	width: 50px;
	height: 30px;
	background-color: #333;
	color: white;
	border: 1px solid #333;
	flex: 1;
	margin-left: 3px;
	justify-content: center;
	align-items: center;
	display: inline-block;
	border-radius: 3px;
	text-align: center;
	line-height: 30px;
}
</style>
</head>
<body>
	<div class="member_wrap">
		<header class="member_header">
			<h1 class="tit">
				<a href="#" class="rcdi_logo">RCDI</a> <span>회원탈퇴</span>
			</h1>
		</header>
		<section>
			<form action="memberPlay.rcdi" class="member_form" id="frm_mem"
				method="POST" name="frm_mem">
				<div class="container">
					<div class="withdraw_content">
						<h3>"님" 회원탈퇴시 아래의 조취가 취해집니다.</h3>
						<ol class="list">
							<li>계정정보는 '개인 정보 보호 정책'에 따라 60일간 보관(잠김)되며, 60일이 경과된 후에는 모든
								개인정보는 완전히 삭제되어 더 이상 복구할 수 없게 됩니다.</li>
							<li>작성된 게시물은 삭제되지 않으며, 익명처리 후 RCDI로 소유권이 귀속됩니다.</li>
							<li>게시물 삭제가 필요한 경우에는 관리자(ryusoo0610@rcdi.co.kr)로 문의해 주시기
								바랍니다.</li>
						</ol>


					</div>

					<div class="join_content">




						<div class="join_row">
							<span class="ps_box int_pass"> <input type="password"
								id="pswd1" name="pswd1" class="int" maxlength="20"
								placeholder="비밀번호"> <!-- 비밀번호니까 type을 text로안하고 password로 바꿈 -->
								<span class="step_url"> </span>
							</span> <span class="error_next_box">필수정보입니다.</span>
						</div>


						<div class="btn_double_area">
							<span>
								<div id="c_btn" class="btn_type btn_default">취소</div>
							</span> <span>
								<div id="j_btn" class="btn_type btn_agree">예,탈퇴하겠습니다.</div>
							</span>
						</div>
					</div>
				</div>
			</form>
			<!-- 모달창 -->
			<div id="modal_wrap">
				<div id="withdraw_content">
					<div id="withdraw_area">
						<div class="square">RCDI</div>
						<div id="subtitle">
							정말 RCDI를 <br>탈퇴하시겠습니까?
						</div>
						<div id="close_btn">
							<i class="fas fa-times"></i>
						</div>
						<div id="modal_container">
							<div class="wrap_btn">
								<a href="index.rcdi" id="btn_cancel"> <span>아니오</span>
								</a> <a href="#" id="btn_withdraw"> <span>네</span>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){


		// 회원탈퇴 모달창
		$('#j_btn').click(function(){
			$('#modal_wrap').css('display','block');
		});
		$('#close_btn').click(function(){
			$('#modal_wrap').css('display','none');
		});
		
	




	});


</script>
</body>
</html>