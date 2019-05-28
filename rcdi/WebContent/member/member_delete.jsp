<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
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
    width: 100%;
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
    width: 460px;
    margin: 0 auto;
    letter-spacing: -1;
    border: 1px solid #dadada;
    outline-color: black;
}
.delete_title {
	font-size: 30px;
	font-weight: 700;
	margin: 35px 0;
	color: dimgray;
	letter-spacing: -1;
}
.delete_content {
	width: 800px;
	border-radius: 5px;
	border: 3px solid black;
	margin: 0 auto;
	height: auto;
}
.delete_content span {
	color: dodgerblue;
}
.content_title {
	text-align: center;
	font-size: 18px;
	font-weight: 700;
	color: #363636;
	margin: 40px 0;
}
.content {
	width: 720px;
	margin: 25px auto;
	font-size: 13px;
	font-weight: 600;
	text-align: left;
	color: #5A5A5A;
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
	height: 50px;
}
.frm_wrap {
	width: 460px;
	margin: 0 auto;
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
.delete_btn {
    flex: 1;
    color: white;
    background-color: #363636;
    font-weight: 700;
    font-size: 18px;
    cursor: pointer;
}
/* 모달창 */
#modal {
	position: fixed;
	z-index: 3;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.6);
	display: flex;
	justify-content: center;
	align-items: center;
	display: none;
}
.modal_title {
	background-color: #363636;
	color: white;
	border-radius: 5px 5px 0px 0px;
	font-size: 13px;
	width: 350px;
	font-weight: 600;
	height: 30px;
	line-height: 30px;
	padding-left: 10px;
}
.modal_content {
	width: 350px;
	text-align: center;
	color: #363636;
	font-size: 18px;
	font-weight: 600;
	background-color: white;
	height: 150px;
	border-radius: 0px 0px 5px 5px;
	padding: 35px 10px;
}
.modal_content span{
	color: dodgerblue;
}
.no_btn {
	text-decoration: none;
	color: white;
	border-radius: 5px;
	border: 1px solid #363636;
	width: 100px;
	margin: 0px auto;
	display: inline-block;
	font-size: 25px;
	font-weight: 600;
	line-height: 38px;
	background-color: #363636;
}
.yes_btn {
	text-decoration: none;
	color: #363636;
	border-radius: 5px;
	border: 1px solid #363636;
	width: 100px;
	margin: 0px auto;
	display: inline-block;
	font-size: 25px;
	font-weight: 600;
	line-height: 38px;
}
</style>
</head>
<body>
	<div id="modal">
		<div class="modal_page">
			<div class="modal_title">RCDI</div>
			<div class="modal_content">정말 <span>RCDI</span>를 탈퇴하시겠습니까?<br><br>
				<a href="#" class="no_btn">아니오</a>
				<a href="#" class="yes_btn">네</a>
			</div>
		</div>
	</div>
	<section>
		<div class="section_outline">
			<div class="section_inline">
				<div class="title">회원탈퇴</div>
				<div class="delete_content">
					<div class="content_title"><span>"${sessionScope.loginUser.name}님"</span> 회원 탈퇴 시 아래의 조치가 취해집니다.</div>
					<div class="content">1. 계정 정보는 <span>'개인 정보 보호 정책'에 따라 60일간 보관(잠김) 되며,</span> 60일이 경과된 후 모든 개인 정보는 완전히 삭제되며 더 이상 복구할 수 없게 됩니다.</div>
					<div class="content">2. 작성된 게시물은 삭제되지 않으며, 익명 처리 후 <span>RCDI로 소유권이 귀속</span>됩니다.</div>
					<div class="content">3. 게시물 삭제가 필요한 경우에는 <span>관리자(ryusoo0610@rcdi.co.kr)</span>로 문의해 주시기 바랍니다.</div>
				</div>
				<div class="space"></div>
				<form action="memberPlay.rcdi" id="frm_mem" class="frm_wrap" method="POST" name="frm_mem">
					
					<input type="password" id="pw" name="pw" class="input_box" maxlength="20" placeholder="비밀번호">
					<span class="error_next_box pwAjax">필수입력 정보입니다.</span>
						
					<div class="btn_update">
						<div class="cancel_btn">취소</div>
						<div class="delete_btn">예,탈퇴하겠습니다</div>
					</div>
				</form>
			</div>
		</div>
	</section>
<%@ include file="../include/footer.jsp"%>
<script type="text/javascript" src="js/validation.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var state = false;
		$('#pw').blur(function(){
			var nowId = "${sessionScope.loginUser.id}";
			var nowPw = $(this).val();
			state = ajaxPwCheck(nowId, nowPw);
		});
		$('.delete_btn').click(function(){
			if(state){
				$('#modal').css('display', 'flex');
			} else {
				$('#pw').focus();
			}
		});
		$('.yes_btn').click(function(){
			// 이렇게도 할 수 있다.
			/* var id = "${sessionScope.loginUser.id}";
			location.href="dropMemberPlay.rcdi?id="+id; */
			
			location.href="dropMemberPlay.rcdi";
		});
		$('.no_btn').click(function(){
			$('#modal').css('display', 'none');
		});
	});
</script>
</body>
</html>
