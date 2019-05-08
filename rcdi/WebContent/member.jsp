<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="include/common.jsp" %>
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
	color: inherit; /* 상속받은 색 그대로 물려받겠다 */
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
</style>
</head>
<body>
	<header>
		<div class="header">

			<h1 class="rcdi_join">회원가입</h1>
		</div>

	</header>




	<section>

		<h3 id="title_join">기본정보</h3>
		<p class="required">
			<img src="images/ico_required.gif" alt="필수">필수입력사항
		</p>


		<table>
			<!-- 하나 -->
			<tr>
				<td><b>아이디</b><img src="images/ico_required.gif" alt="필수"></td>
				<td><span class="ps_box int_id"> <input type="text"
						id="id" name="id" class="int" maxlength="20" placeholder="아이디">
				</span> <input type="button" class="btn_normal btn_idck" value="중복확인"><br>
				</td>
				<td><span class="error_next_box">필수정보입니다.</span></td>
			</tr>
			<!-- 여기까지 -->

			<tr>
				<td><b>비밀번호</b><img src="images/ico_required.gif" alt="필수"></td>
				<td><span class="ps_box int_pass"> <input
						type="password" id="pswd1" name="pswd1" class="int" maxlength="20"
						placeholder="비밀번호"> <!-- 비밀번호니까 type을 text로안하고 password로 바꿈 -->
						<!-- <span class="step_url"><i class="fas fa-unlock-alt"></i></span> -->
				</span></td>
				<td><span class="error_next_box">필수정보입니다.</span></td>
			</tr>
			<tr>
				<td><b>비밀번호 재확인</b><img src="images/ico_required.gif" alt="필수"></td>
				<td><span class="ps_box int_pass"> <input
						type="password" id="pswd2" name="pswd2" class="int" maxlength="20"
						placeholder="비밀번호 재확인"> <!-- 비밀번호니까 type을 text로안하고 password로 바꿈 -->
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
							<span class="ps_box"> <input type="text" id="yy"
								placeholder="연도(4자)" class="int" maxlength="4">
							</span>
						</div>

						<div class="bir_mm">
							<span class="ps_box"> <select id="mm" class="sel">
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
							<span class="ps_box"> <input type="text" id="dd"
								placeholder="일" class="int" maxlength="2">
							</span>
						</div>
					</div>
				</td>
				<td></td>
			</tr>

			<tr>
				<td><b>주소</b><img src="images/ico_required.gif" alt="필수"></td>
				<td><input type="text" id="sample6_postcode" placeholder="우편번호">
					<input type="button" onclick="sample6_execDaumPostcode()"
					class="btn_normal" value="우편번호 찾기"><br> <input
					type="text" id="sample6_address" placeholder="주소"><br>
					<input type="text" id="sample6_detailAddress" placeholder="상세주소">
					<input type="text" id="sample6_extraAddress" placeholder="참고항목">

					<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
					<script>
						    function sample6_execDaumPostcode() {
						        new daum.Postcode({
						            oncomplete: function(data) {
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
						                if(data.userSelectedType === 'R'){
						                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
						                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						                        extraAddr += data.bname;
						                    }
						                    // 건물명이 있고, 공동주택일 경우 추가한다.
						                    if(data.buildingName !== '' && data.apartment === 'Y'){
						                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						                    }
						                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						                    if(extraAddr !== ''){
						                        extraAddr = ' (' + extraAddr + ')';
						                    }
						                    // 조합된 참고항목을 해당 필드에 넣는다.
						                    document.getElementById("sample6_extraAddress").value = extraAddr;
						                
						                } else {
						                    document.getElementById("sample6_extraAddress").value = '';
						                }

						                // 우편번호와 주소 정보를 해당 필드에 넣는다.
						                document.getElementById('sample6_postcode').value = data.zonecode;
						                document.getElementById("sample6_address").value = addr;
						                // 커서를 상세주소 필드로 이동한다.
						                document.getElementById("sample6_detailAddress").focus();
						            }
						        }).open();
						    }
						</script></td>
				<td></td>
			</tr>
			<tr>
				<td><b>휴대전화</b><img src="images/ico_required.gif" alt="필수"></td>
				<td><span class="ps_box"> <input type="text" id="phone"
						name="phone" class="int" maxlength="11" placeholder="'-'없이 입력하세요">
				</span></td>
				<td><span class="error_next_box">필수정보입니다.</span></td>
			</tr>


			<tr>
				<td><b>SMS 수신여부</b><img src="images/ico_required.gif" alt="필수"></td>
				<td class="style_ck"><label for="is_sms0"> <input
						id="is_sms0" name="is_sms" fw-label="is_sms" fw-msg
						class="ec_base_chk" value="T" type="checkbox" checked>동의함
				</label>
					<p>쇼핑몰에서 제공하는 유익한 이벤트 소식을 SMS로 받으실 수 있습니다.</p></td>
				<td><span class="error_next_box">필수정보입니다.</span></td>
			</tr>


			<tr>
				<td><b>이메일</b><img src="images/ico_required.gif" alt="필수"></td>
				<td>
					<div id="wrap_email">
						<input type="text" id="email_id" placeholder="E-mail"> <span>@</span>
						<input type="text" id="email_url" placeholder="URL"> <select
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
				<td><b>이메일 수신여부</b><img src="images/ico_required.gif" alt="필수">
				</td>
				<td class="style_ck"><label for="is_sms1"> <input
						id="is_sms1" name="is_sms" fw-label="is_sms" fw-msg
						class="ec_base_chk" value="T" type="checkbox" checked>동의함
				</label>
					<p>쇼핑몰에서 제공하는 유익한 이벤트 소식을 이메일로 받으실 수 있습니다.</p></td>
				<td><span class="error_next_box">필수정보입니다.</span></td>
			</tr>


		</table>
	</section>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){

/* 
			var
			form = $('#join_frm'),
			uid = $('#id'),
			upw = $('#pw'),
			urepw = $('#repw'),
			uname = $('#name'),
			umail = $('#email'),
			uurl = $('#url'),
			uphone = $('#phone');

			// 정규식
			// ID: 영문 대문자 또는 소문자 또는 숫자로 시작하는 아이디, 길이는 5~15자, 끝날 때 제한 없음=특정 조건이 없음.
			var idReg = RegExp(/^[a-zA-Z0-9]{5,15}$/); 
			// pw
			var pwReg = RegExp(/^[a-zA-Z0-9]{4,12}$/); 
			// 이름 정규식
			var name = $.trim($('#name').val()); 
			// $.trim(uname.val())->$.trim($('#name').val())으로 바꿈
			var nameReg = RegExp(/^[가-힣]{2,4}$/); 
			// 이름 유효성 (한글이름만, 2자에서 4자까지)
			var emailReg = RegExp(/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i); 
			// email 유효성
			var phoneReg = RegExp(/^[0-9]{8,11}$/); 
			// 전화번호 유효성 검사


			// 유효성체크

			// ID 중복확인

		if(name == '' || name.length == 0) {
			$('.error_next_box').eq(3).css('display', 'block').text('필수입력 정보입니다.').css('color', 'tomato');
			$('#name').val(''); // uname -> $('#name')으로 바꿈.
				return false;
			}  else if (!nameReg.test(name)) {
			$('.error_next_box').eq(3).css('display', 'block').css('color', 'tomato').text('올바른 값을 입력하세요.');
				return false;
			} else {
				$('.error_next_box').eq(3).css('display', 'block').css('color', 'dodgerblue').text('예쁜 이름이네요.');
			}
		
			// 비밀번호 

			// 이름 

			// 휴대전화 

			// 이메일

			$('#selmail').change(function(){ // select에서 선택되었을 때 값이 변했을 때 change()함수를 쓴다.
				var selmail = $(this).val(); // input과 select는 val로 가지고 온다. 인풋은 키보드로 입력된 값을 가져와라, select는 value라고 적힌 값을 가져온다. 나머지는 text로 가져옴

				if(selmail == 'directVal'){ // 직접입력을 선택한 경우
					$('#email_url').val(""); // val()만 쓰면 값을 가져오고, 값을 넣으면 그 값을 넣어줌.
					$('#email_url').focus(); // 이메일 주소창에 포커스 가게 함.
				} else {
					$('#email_url').val(selmail); 
				}
			});
			 */
			
			
			
			// Ajax
			$("#id").blur(function(){
				alert('test');
				var id = $.trim($(this).val());
				alert(id);
				
				// id에 값이 있는 경우에만 ajax 동작!
				if(id != "" || id.length != 0){
					$.ajax({
						// "idCheck.rcdi?id="+id 이렇게 쿼리스트링 처럼 보내는 것을 나눠서 적음
						url: "idCheck.rcdi",
						type: "POST", // 목적지로 보낼 때 방법
						dataType: "json", // 목적지로 보낼 때 어떤 포장으로 보내는지 예를들어 캐리어가방, 백팩가방
						data: "id=" + id, // 
						success: function(data){
							
						},
						error: function(){
							alert:("System Error!!!");
						}
					});
					
				}
				
				
			});
			
			
			
			
			
			
			
			
			
			
			
		});
	</script>
	<%@ include file="include/footer.jsp"%>
</body>
</html>