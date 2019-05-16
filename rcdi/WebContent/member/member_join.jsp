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
	.email_box {
		width: 400px;
		display: flex;
		justify-content: space-between;
		margin-bottom: 13px;
	}
	.email_style {
		width: 125px;
		color: #363636;
		line-height: 40px;
		letter-spacing: -1;
		font-size: 16px;
		border: 1px solid #dadada;
		outline-color: black;
		padding: 0 10px;
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
		font-size: 16px;
		padding: 0 10px;
		letter-spacing: -1;
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
		font-size: 16px;
		padding: 0 10px;
		letter-spacing: -1;
	}
	.addr_btn {
		margin-right: 2px;
	}
	#sample6_detailAddress {
		margin-bottom: 13px;
	
	}
	.btn_member_join {
		width: 100%;
		line-height: 40px;
		border: 1px solid #363636;
		background-color: #363636;
		font-size: 16px;
		color: white;
		letter-spacing: -1;
		text-align: center;
		margin: 10px 0 100px;
		
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
					<span class="error_next_box">필수입력 정보입니다.</span>
					
					<input type="password" id="pw" name="pw" class="input_box" maxlength="20" placeholder="비밀번호">
					<span class="error_next_box">필수입력 정보입니다.</span>
					
					<input type="password" id="rpw" name="rpw" class="input_box" maxlength="20" placeholder="비밀번호 재확인">
					<span class="error_next_box">필수입력 정보입니다.</span>
					
					<input type="text" id="name" name="name" class="input_box" maxlength="4" placeholder="이름">
					<span class="error_next_box">필수입력 정보입니다.</span>
					
					<input type="text" id="phone" name="phone" class="input_box" maxlength="11" placeholder="핸드폰번호">
					<span class="error_next_box">필수입력 정보입니다.</span>
					
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
					<span class="error_next_box">필수입력 정보입니다.</span>
					<div class="addr_box">
						<input type="text" name="zipcode" id="sample6_postcode" class="addr_btn" readonly="readonly" placeholder="우편번호"> 
						<input type="button" id="addr_btn" onclick="sample6_execDaumPostcode()" class="btn_normal" value="우편번호 찾기"><br>
					</div> 
					<input type="text" name="addr1" id="sample6_address" placeholder="주소" class="addr_btn addr_style" readonly="readonly"><br> 
					<input type="text" name="addr2" id="sample6_detailAddress" class="addr_btn addr_style" placeholder="상세항목">
					<span class="error_next_box">필수입력 정보입니다.</span>
					
					<div class="btn_member_join">가입하기</div>
					
				</form>
			</div>
		</div>
	</section>
	<%@ include file="include/footer.jsp"%>
	<script type="text/javascript" src="js/validation.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
	<script type="text/javascript">
		$(document).ready(function() {
			// 회원가입 버튼을 누르면 
			$('.btn_member_join').click(function(){
				$('#frm_mem').submit();
			});
			
			// 우편번호, 주소 클릭시 다음주소 API 창 출력
			$('.addr_btn').click(function() {
				var zipcode = $('.addr_btn').eq(0).val();
				var addr = $('.addr_btn').eq(1).val();
				if (zipcode = "" || addr == "") {
					$('#addr_btn').click();
				}
			});

			// email 관련 설정 (직접입력)
			$('#selmail').change(function() {
				var eUrl = $(this).val();
				if (eUrl == "directVal") {
					$('#email_url').val('');
					$('#email_url').focus();
					$('#email_url').removeAttr('readonly');
				} else {
					$('#email_url').val(eUrl);
					$('#email_url').prop('readonly', true);
					$("#email_url").focus(); // 선생님은 blur()를 해야한다고 하심.
				}
			});

			// id 
			// (1) null
			// (2) 정규식
			// (3) 중복체크
		
			// 1. input(#id)에 값을 입력 후 blur()하면 이벤트 발생
			$('#id').blur(function() {
				// 2. input(#id) value값을 가져와 memId에 담음
				var memId = $.trim($('#id').val());
				// 3. joinValidate의 checkId() 함수를 실행, memId를 매개변수로 보냄
				// 7. checkId() 함수를 실행 후 결과값(code, desc)을 변수 checkResult에 담음
				var checkResult = joinValidate.checkId(memId);
				
				if(checkResult.code != 0) {
					// 8-1(실패). code값이 0이 아닌경우 => 유효한 값 아님
					// 			  경고메시지 출력!
					$('.error_next_box').eq(0).text(checkResult.desc).css('display', 'block').css('color', '#FF3636');
					return false;
				} else {
					// 8-2(성공). code값이 0인 경우 => 유효한 값
					//			 중복값인지 Ajax로 검증 시작!
					if(ajaxCheck(memId) == "1"){
						// 9. ajaxCheck() 메서드 실행, memId를 매개변수로 보냄
						// 31. ajaxCheck(memId)의 return값이 1이면 return true;
						return true; // 유효성체크 다끝나고 사용가능한 아이디
					}
				}
				return false;
			});

			
			// pw 
			$('#pw').blur(function() {					
				var memPw = $.trim($('#pw').val());
				var memRpw = $.trim($("#rpw").val());
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
			$("#rpw").blur(function() {
				var memPw = $.trim($('#pw').val());
				var memRpw = $.trim($("#rpw").val());
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
							$('.error_next_box').eq(2).text('비밀번호가 일치합니다.').css("display", "block").css("color", "#0000FF");
						} else {
							$('.error_next_box').eq(2).text('입력하신 비밀번호가 일치하지 않습니다.').css("display", "block").css("color", "#FF3636");
							return false;
						}
					} // if끝
					return true;
				}
				return false;
			});
			
			// 이름
			// (1) null
			// (2) 중간공백
			// (3) 4자제한
			// (4) 멋진 이름이네요

			$("#name").blur(function() {
				var name = $.trim($(this).val());

				var regEmpty = /\s/g; // 공백문자
				var regKor = /[^가-힣]/; // 올바른 이름 형식

				if (name == "" || name.length == 0) {
					$(".error_next_box").eq(3).text("필수입력 정보입니다.").css("display", "block").css("color", "#FF3636");
					return false; 
				} else if (name.match(regEmpty)) {
					$(".error_next_box").eq(3).text("공백없이 입력해주세요.").css("display", "block").css("color", "#FF3636");
					return false;
				} else if (regKor.test(name)) {
					$(".error_next_box").eq(3).text("이름은 표준 한글만  입력가능합니다.").css("display", "block").css("color", "#FF3636");
					return false;
				} else if (name.length > 4 || name.length < 2) {
					$(".error_next_box").eq(3).text("이름은 2자이상 4자 이하여야 합니다.").css("display","block").css("color", "#FF3636");
					return false;
				} else {
					$(".error_next_box").eq(3).text("멋진 이름이네요.").css("display", "block").css("color", "#0000FF");
				}
			});

			// 전화
			$("#phone").blur(function() {
				var phone = $.trim($(this).val());
				var regEmpty = /\s/g; // 공백문자

				if (phone == "" || phone.length == 0) {
					$(".error_next_box").eq(4).text("필수입력 정보입니다.").css("display", "block").css("color", "#FF3636");
					return false;
				} else if (phone.match(regEmpty)) {
					$(".error_next_box").eq(4).text("공백없이 입력해주세요.").css("display", "block").css("color", "#FF3636");
					return false;
				} else if ($.isNumeric(phone) == false) {
					$(".error_next_box").eq(4).text("숫자만 입력해주세요.").css("display", "block").css("color", "#FF3636");
					return false;
				} else if (phone.indexOf("01") != 0) {

					// indexOf를 쓰면 앞을 제어할 수 있다.
					// lastOf를 쓰면 뒤를 제어할 수 있다.
					// 예를들어 01012341234번호가 있을 때 "01"이 몇번지에 있는지를 센다
					// 01이 0번지이기 때문에 0을 반환
					// != 0 이기 때문에 조건문을 타지 않음
					// 만약에 91012341201번호가 있을 때 "01"이 3번지와 9번지에 있어서 3과 9를 반환한다
					// != 0 이기 때문에 조건문을 탄다
					$(".error_next_box").eq(4).text("휴대폰 번호가 유효하지 않습니다.").css("display", "block").css("color", "#FF3636");
					return false;
				} else if (!(phone.length == 10 || phone.length == 11)) {
					$(".error_next_box").eq(4).text("(-)없이 10자 또는 11자로 입력해주세요.").css("display","block").css("color", "#FF3636");
					return false;
				} else {
					$(".error_next_box").eq(4).text("등록가능한 휴대폰 번호입니다.").css("display", "block").css("color", "#0000FF");
				}
			});

			// email 유효성 체크
			$("#email_id").blur(function() {
				var email = $.trim($(this).val());
				var url = $.trim($('#email_url').val());
				
				var regEmpty = /\s/g; // 공백문자			
				var regEmail = RegExp(/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i); // 이메일유효성검사

				if (email == "" || email.length == 0) {
					$(".error_next_box").eq(5).text("필수입력 정보입니다.").css("display", "block").css("color","#FF3636");
					return false;
				} else if (email.match(regEmpty)) {
					$(".error_next_box").eq(5).text("공백없이 입력해주세요.").css("display", "block").css("color","#FF3636");
					return false;
				} else if (url != "" || url.length != 0) {
					
					var fullMail = email + "@" + url;
					if (!regEmail.test(fullMail)) {
						$(".error_next_box").eq(5).text("올바른 email을 입력해주세요.").css("display", "block").css("color","#FF3636");
						return false;
					} else {
						$(".error_next_box").eq(5).text("샤이니한 email이네요.").css("display","block").css("color", "#0000FF");
					}
				}
			});

			$("#email_url").blur(function() {
				var email = $.trim($('#email_id').val());
				var url = $.trim($('#email_url').val());
				var regEmpty = /\s/g; // 공백문자			
				var regEmail = RegExp(/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i); // 이메일유효성검사

				if (url == "" || url.length == 0) {
					$(".error_next_box").eq(5).text("필수입력 정보입니다.").css("display", "block").css("color",	"#FF3636");
					return false;
				} else if (url.match(regEmpty)) {
					$(".error_next_box").eq(5).text("공백없이 입력해주세요.").css("display", "block").css("color","#FF3636");
					return false;
				} else if (email != "" || email.length != 0) {
					var fullMail = email + "@" + url;
					if (!regEmail.test(fullMail)) {
						$(".error_next_box").eq(5).text("올바른 email을 입력해주세요.").css("display", "block").css("color","#FF3636");
						return false;
					} else {
						$(".error_next_box").eq(5).text("샤이니한 email이네요.").css("display","block").css("color", "#0000FF");
					}
				}
			});
			
			
		});

		// 상세주소 null값 안들어오게하는 유효성 체크
		$('#sample6_detailAddress').blur(function() {
			var dAddr = $.trim($(this).val());
			if (dAddr == "" || dAddr.length == 0) {
				$(this).next().text("필수정보 입니다.").css("display", "block").css("color", "#FF3636");
				return false;
			}
		});
	</script>
</body>
</html>