<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic');

* {
	box-sizing: border-box;
	font-family: sans-serif;
	font-size: 0.8rem;
}

body {
	margin: 10px 100px 100px;
	padding: 0;
	font-family: 'Nanum Gothic', sans-serif;
	/* font-family: sans-serif; */
	user-select: none;
}

ul {
	margin: 0;
	padding: 0;
	list-style-type: none; /* ul 태그의 ●을 없애는 태그 */
}

a:link, a:visited {
	text-decoration: none;
}

section {
	margin-top: 150px;
}

input, select {
	width: 150px;
	height: 30px;
	box-sizing: border-box;
}

#title_join {
	font-size: 16px;
}
/* div를 표로 만드는 방법 */
.bir_wrap {
	/* display: table; */
	width: 100%;
}

.bir_dd, .bir_mm, .bir_yy {
	display: table-cell;
	table-layout: fixed;
	width: 147px;
	vertical-align: middle;
	box-sizing: border-box;
	margin-right: 10px;
}

.int>* {
	margin-right: 10px;
}

.bir_mm+.bir_dd, .bir_yy+.bir_mm {
	/* +는 근접후행 선택자( ~는 후행선택자) 이거 주고나서 표의 셀 사이가 간격이 생김 */
	padding-left: 3px;
}

.join_birthday .ps_box {
	padding: 11px 14px;
}

#is_sms0, #is_sms1 {
	width: 14px;
	height: 14px;
	margin: 0 3px 0 0;
	vertical-align: middle;
}

.style_ck {
	font-size: 0.8em;
	letter-spacing: -1px;
}

.btn_normal {
	border: 1px solid #d1d1d1;
	width: 100px;
}

#wrap_email {
	/* padding: 5px; */
	
}

#wrap_email>* {
	float: left;
	margin-right: 4px;
}

.header {
	width: 768px;
	margin: auto;
	padding-bottom: 20px;
	padding-top: 30px;
	display: flex;
}

.rcdi_join {
	height: 84px;
	margin: 0 auto;
	font-size: 30px;
	line-height: 84px;
}

.required {
	text-align: right;
	margin: -25px 0 10px;
}

table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	text-align: left;
	padding: 8px;
}

/* tr:nth-child(odd) { odd/even 형제에게만 (원하는 것들에게만) 선택해서 효과줄 수 있다
			background-color: #f2f2f2;
		} */
.error_next_box {
	display: none;
}

.entire_wrap {
	width: 900px;
	margin: 0 auto;
	box-sizing: boder-box;
}
.btn_double_area {
	text-align: center;
}
.btn_type {
	display: inline-block;
	border: 1px solid dimgray;
	width: 150px;
	height: 50px;
	color: white!important;
	background-color: dimgray;
	border-radius: 10px;
}


</style>
</head>
<body>
	<header>
		<div class="header">
			<h1 class="rcdi_join">회원가입</h1>
		</div>
	</header>

	<section>
		<div class="entire_wrap">
			<form action="memberPlay.rcdi" id="frm_mem" method="POST" name="frm_mem">
				<h3 id="title_join">기본정보</h3>
				<p class="required">
					<img src="images/ico_required.gif" alt="필수">필수입력사항
				</p>

				<table>
					<!-- 하나 -->
					<tr>
						<td><b>아이디</b> <img src="images/ico_required.gif" alt="필수">
						</td>
						<td><span class="ps_box int_id"> <input type="text"
								id="id" name="id" class="int" maxlength="20" placeholder="아이디">
						</span></td>
						<td><span id="spanid" class="error_span_box error_next_box">필수정보입니다.
						</span></td>
					</tr>
					<!-- 여기까지 -->

					<tr>
						<td><b>비밀번호</b> <img src="images/ico_required.gif" alt="필수">
						</td>
						<td><span class="ps_box int_pass"> <input
								type="password" id="pswd1" name="pswd1" class="int"
								maxlength="20" placeholder="비밀번호"> <!-- 비밀번호니까 type을 text로안하고 password로 바꿈 -->
								<!-- <span class="step_url"><i class="fas fa-unlock-alt"></i></span> -->
						</span></td>
						<td><span class="error_pw_box error_next_box">필수정보입니다.</span>
						</td>
					</tr>
					<tr>
						<td><b>비밀번호 재확인</b> <img src="images/ico_required.gif"
							alt="필수"></td>
						<td><span class="ps_box int_pass"> <input
								type="password" id="pswd2" name="pswd2" class="int"
								maxlength="20" placeholder="비밀번호 재확인"> <!-- 비밀번호니까 type을 text로안하고 password로 바꿈 -->
								<!-- <span class="step_url"><i class="fas fa-unlock"></i></span> -->
						</span></td>
						<td><span class="error_next_box">필수정보입니다.</span></td>
					</tr>
					<tr>
						<td><b>이름</b><img src="images/ico_required.gif" alt="필수"></td>
						<td><span class="ps_box"> <input type="text" id="name"
								name="name" class="int" maxlength="20" placeholder="이름">
						</span></td>
						<td><span class="error_next_box">필수정보입니다.</span></td>
					</tr>
					<tr>
						<td><b>생년월일</b></td>
						<td>
							<div class="bir_wrap">
								<div class="bir_yy">
									<span class="ps_box"> <input type="text" name="yy" id="yy"
										placeholder="연도(4자)" class="int" maxlength="4">
									</span>
								</div>

								<div class="bir_mm">
									<span class="ps_box"> <select id="mm" name="mm" class="sel">
											<option>월</option>
											<option value="01">1</option>
											<option value="02">2</option>
											<option value="03">3</option>
											<option value="04">4</option>
											<option value="05">5</option>
											<option value="06">6</option>
											<option value="07">7</option>
											<option value="08">8</option>
											<option value="09">9</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option>
									</select>
									</span>
								</div>

								<div class="bir_dd">
									<span class="ps_box"> <input type="text" name="dd" id="dd"
										placeholder="일" class="int" maxlength="2">
									</span>
								</div>
							</div>
						</td>
						<td></td>
					</tr>

					<tr>
						<td><b>주소</b><img src="images/ico_required.gif" alt="필수"></td>
						<td><input type="text" name="postcode" id="sample6_postcode" class="addr_btn"
							readonly="readonly" placeholder="우편번호"> <input
							type="button" id="addr_btn" onclick="sample6_execDaumPostcode()"
							class="btn_normal" value="우편번호 찾기"><br> <input
							type="text" name="addr1" id="sample6_address" placeholder="주소"
							class="addr_btn" readonly="readonly"><br> <input
							type="text" name="addr2" id="sample6_detailAddress" placeholder="상세주소">
							<input type="text" id="sample6_extraAddress" class="addr_btn"
							placeholder="참고항목"> <script
								src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
							<script>
								function sample6_execDaumPostcode() {
									new daum.Postcode(
											{
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
							</script></td>
						<td></td>
					</tr>
					<tr>
						<td><b>휴대전화</b><img src="images/ico_required.gif" alt="필수"></td>
						<td><span class="ps_box"> <input type="text"
								id="phone" name="phone" class="int" maxlength="11"
								placeholder="'-'없이 입력하세요">
						</span></td>
						<td><span class="error_next_box">필수정보입니다.</span></td>
					</tr>


					<tr>
						<td><b>SMS 수신여부</b><img src="images/ico_required.gif"
							alt="필수"></td>
						<td class="style_ck"><label for="is_sms0"> <input
								id="is_sms0" name="is_receive" fw-label="is_sms" fw-msg
								class="ec_base_chk" value="y" type="checkbox" checked>동의함
						</label>
							<p>쇼핑몰에서 제공하는 유익한 이벤트 소식을 SMS로 받으실 수 있습니다.</p></td>
						<td><span class="error_next_box">필수정보입니다.</span></td>
					</tr>


					<tr>
						<td><b>이메일</b><img src="images/ico_required.gif" alt="필수"></td>
						<td>
							<div id="wrap_email">
								<input type="text" name="email_id" id="email_id" placeholder="E-mail"> <span>@</span>
								<input type="text" name="email_url" id="email_url" placeholder="URL"> <select
									id="selmail">
									<option value="">Email 입력</option>
									<option value="directVal">직접입력</option>
									<option value="naver.com">naver.com(네이버)</option>
									<option value="daum.net">daum.net(다음카카오)</option>
									<option value="gmail.com">gmail.com(구글)</option>
									<option value="nate.com">nate.com(네이트)</option>
								</select>
							</div>
						</td>
						<td><span class="error_next_box">필수정보입니다.</span></td>
					</tr>


					<tr>
						<td><b>이메일 수신여부</b><img src="images/ico_required.gif"
							alt="필수"></td>
						<td class="style_ck"><label for="is_sms1"> 
						<input id="is_sms1" name="is_receive" 
								class="ec_base_chk" value="n" type="checkbox" checked>동의함
						</label>
							<p>쇼핑몰에서 제공하는 유익한 이벤트 소식을 이메일로 받으실 수 있습니다.</p></td>
						<td><span class="error_next_box">필수정보입니다.</span></td>
					</tr>


				</table>

				<div class="btn_double_area">
					<span><a href="index.rcdi" id="c_btn" class="btn_type btn_default">취소</a></span>
					<span><a href="#" id="j_btn" class="btn_type btn_agree">회원가입</a></span>
				</div>
				
				<input type="hidden" value="y" name="sms_receive" id="sms_receive">
				<input type="hidden" value="y" name="email_receive" id="email_receive">
			</form>
		</div>
	</section>

	<script type="text/javascript" src="js/validation.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			
			// 수신여부
			$('.ec_base_chk').change(function(){
				var flag = $(this).val();
				alert("1>>" + flag);
				if(flag == "y"){ // Yes -> No
					$(this).val("n");
				} else if(flag == "n") { // No -> Yes
					$(this).val("y");
				}
				var flag2 = $(this).val();
				alert("2>>" + flag2);
				
			});
			
			// 회원가입 버튼을 누르면 
			$('.btn_agree').click(function(){
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
				
				
				
				// alert(checkResult.code);
				// alert(checkResult.desc);
			
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
				return false; // 
			});

			
			// pw 
			$('#pswd1').blur(function() {					
				var memPw = $.trim($('#pswd1').val());
				var memRpw = $.trim($("#pswd2").val());
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
					return true;
				}
				return false;
			});
					
					

					// 비밀번호 재확인(비교)
					$("#pswd2").blur(function() {
						var pw = $.trim($("#pswd1").val());
						var rpw = $.trim($("#pswd2").val());

						var regEmpty = /\s/g; // 공백문자
						var pwReg = RegExp(/^[a-zA-Z0-9]{4,12}$/); // 비밀번호 체크 /^이면 true, false가 반대가 된다

						if (rpw == "" || rpw.length == 0) {
							$(".error_next_box").eq(2).text(
									"필수입력 정보입니다.").css("display",
									"block").css("color", "#FF3636");
							return false;
						} else if (rpw.match(regEmpty)) {
							$(".error_next_box").eq(2).text(
									"공백없이 입력해주세요.").css("display",
									"block").css("color", "#FF3636");
							return false;
						} else if (!pwReg.test(rpw)) { // 위의 정규식에서 /^이기 때문에 true, false가 반대가 되어!를 써야함			
							$(".error_next_box").eq(2).text(
									"올바른 비밀번호(4~12자)를 입력해주세요").css(
									"display", "block").css("color",
									"#FF3636");
							return false;
						} else if (pw != rpw) {
							$(".error_next_box").eq(2).text(
									"입력하신 비밀번호가 일치하지 않습니다.").css(
									"display", "block").css("color",
									"#FF3636");
							return false;
						} else {
							$(".error_next_box").eq(2).text(
									"사용가능한 비밀번호입니다.").css("display",
									"block").css("color", "#0000FF");
							return false;
						}
					});
				});

		// 이름
		// (1) null
		// (2) 중간공백
		// (3) 4자제한
		// (4) 멋진 이름이네요

		$("#name").blur(function() {
			//alert('test');
			var name = $.trim($(this).val());
			//alert(name);

			var regEmpty = /\s/g; // 공백문자
			var regKor = /[^가-힣]/; // 올바른 이름 형식

			if (name == "" || name.length == 0) {
				//alert('공백');
				$(".error_next_box").eq(3).text("필수입력 정보입니다.").css(
						"display", "block").css("color", "#FF3636");
				return false; // 이 이벤트를 빠져나가라는 뜻. blur()
			} else if (name.match(regEmpty)) {
				//alert('사이공백');
				$(".error_next_box").eq(3).text("공백없이 입력해주세요.").css(
						"display", "block").css("color", "#FF3636");
				return false;
			} else if (regKor.test(name)) {
				$(".error_next_box").eq(3).text("이름은 표준 한글만  입력가능합니다.")
						.css("display", "block")
						.css("color", "#FF3636");
				return false;
			} else if (name.length > 4 || name.length < 2) {
				$(".error_next_box").eq(3)
						.text("이름은 2자이상 4자 이하여야 합니다.").css("display",
								"block").css("color", "#FF3636");
				return false;
			} else {
				$(".error_next_box").eq(3).text("멋진 이름이네요.").css(
						"display", "block").css("color", "#0000FF");
			}
		});

		// 전화

		$("#phone").blur(function() {

			var phone = $.trim($(this).val());
			var regEmpty = /\s/g; // 공백문자

			if (phone == "" || phone.length == 0) {
				$(".error_next_box").eq(4).text("필수입력 정보입니다.").css(
						"display", "block").css("color", "#FF3636");
				return false;
			} else if (phone.match(regEmpty)) {
				$(".error_next_box").eq(4).text("공백없이 입력해주세요.").css(
						"display", "block").css("color", "#FF3636");
				return false;
			} else if ($.isNumeric(phone) == false) {
				$(".error_next_box").eq(4).text("숫자만 입력해주세요.").css(
						"display", "block").css("color", "#FF3636");
				return false;
			} else if (phone.indexOf("01") != 0) {

				// indexOf를 쓰면 앞을 제어할 수 있다.
				// lastOf를 쓰면 뒤를 제어할 수 있다.
				// 예를들어 01012341234번호가 있을 때 "01"이 몇번지에 있는지를 센다
				// 01이 0번지이기 때문에 0을 반환
				// != 0 이기 때문에 조건문을 타지 않음
				// 만약에 91012341201번호가 있을 때 "01"이 3번지와 9번지에 있어서 3과 9를 반환한다
				// != 0 이기 때문에 조건문을 탄다
				$(".error_next_box").eq(4).text("휴대폰 번호가 유효하지 않습니다.")
						.css("display", "block")
						.css("color", "#FF3636");
				return false;

			} else if (!(phone.length == 10 || phone.length == 11)) {
				$(".error_next_box").eq(4).text(
						"(-)없이 10자 또는 11자로 입력해주세요.").css("display",
						"block").css("color", "#FF3636");
				return false;
			} else {
				$(".error_next_box").eq(4).text("등록가능한 휴대폰 번호입니다.")
						.css("display", "block")
						.css("color", "#0000FF");
			}

		});

		// email 유효성 체크

		$("#email_id").blur(function() {

			var email = $.trim($(this).val());
			var url = $.trim($('#email_url').val());
			var regEmpty = /\s/g; // 공백문자			
			var regEmail = RegExp(/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i); // 이메일유효성검사

			if (email == "" || email.length == 0) {

				$(".error_next_box").eq(6).text("필수입력 정보입니다.")
						.css("display", "block").css("color",
								"#FF3636");
				return false;
			} else if (email.match(regEmpty)) {

				$(".error_next_box").eq(6).text("공백없이 입력해주세요.")
						.css("display", "block").css("color",
								"#FF3636");
				return false;
			} else if (url != "" || url.length != 0) {

				var fullMail = email + "@" + url;
				if (!regEmail.test(fullMail)) {

					$(".error_next_box").eq(6).text(
							"올바른 email을 입력해주세요.").css(
							"display", "block").css("color",
							"#FF3636");
					return false;
				} else {

					$(".error_next_box").eq(6).text(
							"샤이니한 email이네요.").css("display",
							"block").css("color", "#0000FF");
				}

			}

		});

		$("#email_url").blur(function() {

			var email = $.trim($('#email_id').val());
			var url = $.trim($('#email_url').val());
			var regEmpty = /\s/g; // 공백문자			
			var regEmail = RegExp(/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i); // 이메일유효성검사

			if (url == "" || url.length == 0) {

				$(".error_next_box").eq(6).text("필수입력 정보입니다.")
						.css("display", "block").css("color",
								"#FF3636");
				return false;
			} else if (url.match(regEmpty)) {
				alert('test');
				$(".error_next_box").eq(6).text("공백없이 입력해주세요.")
						.css("display", "block").css("color",
								"#FF3636");
				return false;
			} else if (email != "" || email.length != 0) {

				var fullMail = email + "@" + url;
				if (!regEmail.test(fullMail)) {

					$(".error_next_box").eq(6).text(
							"올바른 email을 입력해주세요.").css(
							"display", "block").css("color",
							"#FF3636");
					return false;
				} else {

					$(".error_next_box").eq(6).text(
							"샤이니한 email이네요.").css("display",
							"block").css("color", "#0000FF");
				}

			}

		});

		// 상세주소 null값 안들어오게하는 유효성 체크
		$('#sample6_detailAddress').blur(function() {
			var dAddr = $.trim($(this).val());
	
			if (dAddr == "" || dAddr.length == 0) {
				$(this).parent().children().last().text("필수정보 입니다.")
						.css("display", "block")
						.css("color", "#FF3636");
	
				return false;
			}
	
		});
		
		


	</script>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>