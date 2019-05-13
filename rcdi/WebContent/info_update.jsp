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
<title>modify_member.html</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic');

.member_wrap {
	width: 960px;
	margin: 49px auto 60px;
	border: none;
	padding: 0;
}

.member_header {
	padding-bottom: 28px;
	margin-bottom: 41px;
	border-bottom: 1px solid #333;
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

.postcode_wrap {
	display: flex;
}

#postcode {
	display: inline-block;
	width: 49.5%;
	margin-right: 5px;
}

#addr_btn {
	background-color: lightgray;
}

.addr_wrap {
	display: flex;
	text-align: center;
}

#addr1 {
	display: inline-block;
	margin-right: 5px;
}

#addr2 {
	display: inline-block;
}

.email_wrap {
	display: inline-block;
}

.email_wrap>input, select {
	width: 150px;
	height: 30px;
	box-sizing: border-box;
}

.email_wrap>* {
	float: left;
	margin-right: 10px;
	padding: 5px;
}

.email_box {
	display: inline-block;
	width: 30%;
}

.email_a {
	display: inline-block;
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

/* 수정하기 버튼 */
.btn_double_area {
	margin: 30px -5px 0px;
	overflow: hidden;
}

.btn_double_area>span {
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
	color: #fff;
	border: 1px solid #333;
	background-color: #333;
}
</style>
</head>
<body>
	<div class="member_wrap">
		<header class="member_header">
			<h1 class="tit">
				<a href="#" class="rcdi_logo">RCDI</a> <span>회원정보 수정</span>
			</h1>
		</header>
		<section>
			<form action="memberPlay.rcdi" class="member_form" id="frm_mem"
				method="POST" name="frm_mem">
				<div class="container">
					<div class="join_content">
						<!-- 하나 -->
						<div class="join_row">
							<span class="ps_box int_id"> <input type="text" id="id"
								name="id" class="int" maxlength="20" readonly="readonly"
								placeholder="아이디"> <span class="step_url"></span>
							</span>
						</div>
						<span class="error_next_box">필수정보입니다.</span>
						<div class="msg_box">
							<i class="far fa-question-circle"></i>
							<!-- 모달창 -->
							<div class="msg_pop">
								<h3 class="tit">아이디 조합 유의사항</h3>
								<ul class="list">
									<li>6~50자의 영문 소문자, 숫자, 특수기호 일부만 사용할 수 있습니다.</li>
									<li>사용 가능한 특수기호 : -, _ (공백입력 불가)</li>
									<li>일반 문자열로만 입력이 가능합니다 (이메일 형식 불가)</li>
									<li>첫글자는 특수문자 불가능, 숫자는 가능합니다.</li>
								</ul>
							</div>
						</div>

						<!-- 여기까지 -->

						<div class="join_row">
							<span class="ps_box"> <input type="text" id="name"
								name="name" class="int" maxlength="20" placeholder="이름">
							</span> <span class="error_next_box">필수정보입니다.</span>
						</div>


						<!-- 주소 -->

						<!-- input안에다 class="" 사용하면 된다 -->
						<!-- 이 코드들은 순수 script라서 제이쿼리가 없음 -->
						<div class="join_row">
							<div class="postcode_wrap">
								<span class="ps_box" id="postcode"> <input type="text"
									id="sample6_postcode" name="postcod" class="int addr_btn"
									readonly="readonly" placeholder="우편번호">
								</span> <span> <input type="button" id="addr_btn"
									class="ps_box btn_normal" onclick="sample6_execDaumPostcode()"
									value="우편번호 찾기"><br>
								</span>
							</div>
							<div class="addr_wrap">
								<span class="ps_box" id="addr1"> <input type="text"
									name="addr1" id="sample6_address" class="int addr_btn"
									readonly="readonly" placeholder="주소"><br>
								</span> <span class="ps_box" id="addr2"> <input type="text"
									id="sample6_detailAddress" name="addr2" class="int addr_btn"
									placeholder="상세주소">
								</span>
							</div>
							<span class="error_next_box">필수정보입니다.</span>
						</div>

						<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
															.getElementById("sample6_extraAddress").value = extraAddr;

												} else {
													document
															.getElementById("sample6_extraAddress").value = '';
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

						<div class="join_row">
							<span class="ps_box"> <input type="text" id="phone"
								name="phone" class="int" maxlength="11" placeholder="휴대전화">
							</span> <span class="error_next_box">필수정보입니다.</span>
						</div>


						<div class="join_row">
							<div class="email_wrap">
								<span class="ps_box email_box"> <input type="text"
									id="email_id" name="email_id" class="int" placeholder="E-mail">
									<div class="email_a">
										<span>@</span>
									</div>
								</span> <span class="ps_box email_box"> <input type="text"
									id="email_url" name="email_url" class="int" placeholder="URL">
								</span> <select id="selmail" class="ps_box email_box">
									<option value="">Email 입력</option>
									<option value="directVal">직접입력</option>
									<option value="naver.com">naver.com(네이버)</option>
									<option value="daum.net">daum.net(다음카카오)</option>
									<option value="gmail.com">gmail.com(구글)</option>
									<option value="nate.com">nate.com(네이트)</option>
								</select> <span class="error_next_box">필수정보입니다.</span>
							</div>
						</div>



						<div class="btn_double_area">
							<span> <a href="#" class="btn_type btn_agree">수정하기</a>
							</span>
						</div>
					</div>
				</div>
			</form>
		</section>
	</div>
	<script type="text/javascript" src="js/validation.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							// 회원가입 버튼을 누르면
							$('.btn_agree').click(function() {
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
							$('#id').blur(
									function() {
										// 2. input(#id) value값을 가져와 memId에 담음
										var memId = $.trim($('#id').val());
										// 3. joinValidate의 checkId() 함수를 실행, memId를 매개변수로 보냄
										// 7. checkId() 함수를 실행 후 결과값(code, desc)을 변수 checkResult에 담음
										var checkResult = joinValidate
												.checkId(memId);

										// alert(checkResult.code);
										// alert(checkResult.desc);

										if (checkResult.code != 0) {
											// 8-1(실패). code값이 0이 아닌경우 => 유효한 값 아님
											// 			  경고메시지 출력!
											$('.error_next_box').eq(0).text(
													checkResult.desc).css(
													'display', 'block').css(
													'color', '#FF3636');
											return false;
										} else {
											// 8-2(성공). code값이 0인 경우 => 유효한 값
											//			 중복값인지 Ajax로 검증 시작!
											if (ajaxCheck(memId) == "1") {
												// 9. ajaxCheck() 메서드 실행, memId를 매개변수로 보냄
												// 31. ajaxCheck(memId)의 return값이 1이면 return true;
												return true; // 유효성체크 다끝나고 사용가능한 아이디
											}
										}
										return false;
									});

							
							// 이름
							// (1) null
							// (2) 중간공백
							// (3) 4자제한
							// (4) 멋진 이름이네요

							$("#name").blur(
									function() {
										//alert('test');
										var name = $.trim($(this).val());
										//alert(name);

										var regEmpty = /\s/g; // 공백문자
										var regKor = /[^가-힣]/; // 올바른 이름 형식

										if (name == "" || name.length == 0) {
											//alert('공백');
											$(".error_next_box").eq(3).text(
													"필수입력 정보입니다.").css(
													"display", "block").css(
													"color", "#FF3636");
											return false; // 이 이벤트를 빠져나가라는 뜻. blur()
										} else if (name.match(regEmpty)) {
											//alert('사이공백');
											$(".error_next_box").eq(3).text(
													"공백없이 입력해주세요.").css(
													"display", "block").css(
													"color", "#FF3636");
											return false;
										} else if (regKor.test(name)) {
											$(".error_next_box").eq(3).text(
													"이름은 표준 한글만  입력가능합니다.")
													.css("display", "block")
													.css("color", "#FF3636");
											return false;
										} else if (name.length > 4
												|| name.length < 2) {
											$(".error_next_box").eq(3).text(
													"이름은 2자이상 4자 이하여야 합니다.")
													.css("display", "block")
													.css("color", "#FF3636");
											return false;
										} else {
											$(".error_next_box").eq(3).text(
													"멋진 이름이네요.").css("display",
													"block").css("color",
													"#0000FF");
										}
									});

							// 전화

							$("#phone")
									.blur(
											function() {

												var phone = $.trim($(this)
														.val());
												var regEmpty = /\s/g; // 공백문자

												if (phone == ""
														|| phone.length == 0) {
													$(".error_next_box")
															.eq(4)
															.text("필수입력 정보입니다.")
															.css("display",
																	"block")
															.css("color",
																	"#FF3636");
													return false;
												} else if (phone
														.match(regEmpty)) {
													$(".error_next_box")
															.eq(4)
															.text(
																	"공백없이 입력해주세요.")
															.css("display",
																	"block")
															.css("color",
																	"#FF3636");
													return false;
												} else if ($.isNumeric(phone) == false) {
													$(".error_next_box")
															.eq(4)
															.text("숫자만 입력해주세요.")
															.css("display",
																	"block")
															.css("color",
																	"#FF3636");
													return false;
												} else if (phone.indexOf("01") != 0) {

													// indexOf를 쓰면 앞을 제어할 수 있다.
													// lastOf를 쓰면 뒤를 제어할 수 있다.
													// 예를들어 01012341234번호가 있을 때 "01"이 몇번지에 있는지를 센다
													// 01이 0번지이기 때문에 0을 반환
													// != 0 이기 때문에 조건문을 타지 않음
													// 만약에 91012341201번호가 있을 때 "01"이 3번지와 9번지에 있어서 3과 9를 반환한다
													// != 0 이기 때문에 조건문을 탄다
													$(".error_next_box")
															.eq(4)
															.text(
																	"휴대폰 번호가 유효하지 않습니다.")
															.css("display",
																	"block")
															.css("color",
																	"#FF3636");
													return false;

												} else if (!(phone.length == 10 || phone.length == 11)) {
													$(".error_next_box")
															.eq(4)
															.text(
																	"(-)없이 10자 또는 11자로 입력해주세요.")
															.css("display",
																	"block")
															.css("color",
																	"#FF3636");
													return false;
												} else {
													$(".error_next_box")
															.eq(4)
															.text(
																	"등록가능한 휴대폰 번호입니다.")
															.css("display",
																	"block")
															.css("color",
																	"#0000FF");
												}

											});

							// email 유효성 체크

							$("#email_id")
									.blur(
											function() {

												var email = $.trim($(this)
														.val());
												var url = $
														.trim($('#email_url')
																.val());
												var regEmpty = /\s/g; // 공백문자			
												var regEmail = RegExp(/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i); // 이메일유효성검사

												if (email == ""
														|| email.length == 0) {
													$(".error_next_box")
															.eq(6)
															.text("필수입력 정보입니다.")
															.css("display",
																	"block")
															.css("color",
																	"#FF3636");
													return false;
												} else if (email
														.match(regEmpty)) {
													$(".error_next_box")
															.eq(6)
															.text(
																	"공백없이 입력해주세요.")
															.css("display",
																	"block")
															.css("color",
																	"#FF3636");
													return false;
												} else if (url != ""
														|| url.length != 0) {
													var fullMail = email + "@"
															+ url;
													if (!regEmail
															.test(fullMail)) {
														$(".error_next_box")
																.eq(6)
																.text(
																		"올바른 email을 입력해주세요.")
																.css("display",
																		"block")
																.css("color",
																		"#FF3636");
														return false;
													} else {
														$(".error_next_box")
																.eq(6)
																.text(
																		"샤이니한 email이네요.")
																.css("display",
																		"block")
																.css("color",
																		"#0000FF");
													}
												}

											});

							$("#email_url")
									.blur(
											function() {

												var email = $.trim($(
														'#email_id').val());
												var url = $
														.trim($('#email_url')
																.val());
												var regEmpty = /\s/g; // 공백문자			
												var regEmail = RegExp(/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i); // 이메일유효성검사

												if (url == ""
														|| url.length == 0) {
													$(".error_next_box")
															.eq(6)
															.text("필수입력 정보입니다.")
															.css("display",
																	"block")
															.css("color",
																	"#FF3636");
													return false;
												} else if (url.match(regEmpty)) {
													alert('test');
													$(".error_next_box")
															.eq(6)
															.text(
																	"공백없이 입력해주세요.")
															.css("display",
																	"block")
															.css("color",
																	"#FF3636");
													return false;
												} else if (email != ""
														|| email.length != 0) {
													var fullMail = email + "@"
															+ url;
													if (!regEmail
															.test(fullMail)) {
														$(".error_next_box")
																.eq(6)
																.text(
																		"올바른 email을 입력해주세요.")
																.css("display",
																		"block")
																.css("color",
																		"#FF3636");
														return false;
													} else {
														$(".error_next_box")
																.eq(6)
																.text(
																		"샤이니한 email이네요.")
																.css("display",
																		"block")
																.css("color",
																		"#0000FF");
													}
												}

											});

							// 상세주소 null값 안들어오게하는 유효성 체크
							$('#sample6_detailAddress').blur(
									function() {
										var dAddr = $.trim($(this).val());
										if (dAddr == "" || dAddr.length == 0) {
											$(this).parent().children().last()
													.text("필수정보 입니다.").css(
															"display", "block")
													.css("color", "#FF3636");
											return false;
										}

									});

						});
	</script>
</body>
</html>