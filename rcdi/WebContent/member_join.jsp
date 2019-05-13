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
		border: 1px solid blue;
		height: auto;
	}
	.section_inline {
		/* border: 1px solid red; */
		height: auto;
		width: 400px;
		margin: 0 auto;
	}
	.title {
		/* border: 1px solid black; */
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
	}
	.error_msg {
		color: tomato;
		font-size: 12px;
		text-align: center;
		padding: 5px;
		letter-spacing: -1;
		display: inline-block;
		margin-bottom: 10px;
	}
	.email_box {
		width: 400px;
		display: flex;
		justify-content: space-between;
	}
	.email_style {
		width: 125px;
		color: #363636;
		line-height: 40px;
		letter-spacing: -1;
		font-size: 16px;
		border: 1px solid #dadada;
		outline-color: black;
	}
	.email_box span {
		line-height: 40px;
		color: #363636;
	}
	.addr_box {
		display: flex;
		justify-content: space-between;
	}
	.addr_box input {
		line-height: 40px;
		width: 99%;
		margin-bottom: 3px;
		border: 1px solid #dadada;
	}
	.addr_box input:nth-child(2) {
		border: none;
		color: white;
	}
	.addr_style {
		width: 100%;
		line-height: 40px;
		margin-bottom: 3px;
		border: 1px solid #dadada;
	}


</style>
</head>
<body>
	<section>
		<div class="section_outline">
			<div class="section_inline">
				<div class="title">회원 가입</div>
				<form action="memberPlay.rcdi" id="frm_mem" method="POST" name="frm_mem">
				
					<input type="text" id="id" name="id" class="input_box" maxlength="20" placeholder="아이디">
					<span class="error_msg">필수입력 정보입니다.</span>
					
					<input type="password" id="pw" name="pw" class="input_box" maxlength="20" placeholder="비밀번호">
					<span class="error_msg">필수입력 정보입니다.</span>
					
					<input type="password" id="rpw" name="rpw" class="input_box" maxlength="20" placeholder="비밀번호 재확인">
					<span class="error_msg">필수입력 정보입니다.</span>
					
					<input type="text" id="name" name="name" class="input_box" maxlength="4" placeholder="이름">
					<span class="error_msg">필수입력 정보입니다.</span>
					
					<input type="text" id="phone" name="phone" class="input_box" maxlength="11" placeholder="핸드폰번호">
					<span class="error_msg">필수입력 정보입니다.</span>
					
					<div class="email_box">
						<input type="text" id="email_id" name="email_id" class="email_style" placeholder="이메일"> 
						<span>@</span>
						<input type="text" id="email_url" name="email_url" class="email_style" placeholder="URL">
						<select id="selmail" class="email_style">
							<option value="">Email 입력</option>
							<option value="directVal">직접입력</option>
							<option value="naver.com">naver.com(네이버)</option>
							<option value="daum.net">daum.net(다음카카오)</option>
							<option value="gmail.com">gmail.com(구글)</option>
							<option value="nate.com">nate.com(네이트)</option>
						</select>
					</div>
					<span class="error_msg">필수입력 정보입니다.</span>
					<div class="addr_box">
						<input type="text" name="postcode" id="sample6_postcode" class="addr_btn" readonly="readonly" placeholder="우편번호"> 
						<input type="button" id="addr_btn" onclick="sample6_execDaumPostcode()" class="btn_normal" value="우편번호 찾기"><br>
					</div> 
					<input type="text" name="addr1" id="sample6_address" placeholder="주소" class="addr_btn addr_style" readonly="readonly"><br> 
					<input type="text" id="sample6_extraAddress" class="addr_btn addr_style" placeholder="참고항목">
					<span class="error_msg">필수입력 정보입니다.</span>
				</form>
			</div>
		</div>
	</section>
	<%@ include file="include/footer.jsp"%>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
		function sample6_execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수
		
					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}
		
					// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					if (data.userSelectedType === 'R') {
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== ''
								&& /[동|로|가]$/g
										.test(data.bname)) {
							extraAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== ''
								&& data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName
									: data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraAddr !== '') {
							extraAddr = ' ('
									+ extraAddr
									+ ')';
						}
						// 조합된 참고항목을 해당 필드에 넣는다.
						document
								.getElementById("sample6_detailAddress").value = extraAddr;
		
					} else {
						document
								.getElementById("sample6_detailAddress").value = '';
					}
		
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document
							.getElementById('sample6_postcode').value = data.zonecode;
					document
							.getElementById("sample6_address").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document
							.getElementById(
									"sample6_detailAddress")
							.focus();
				}
			}).open();
		}
	</script>
</body>
</html>