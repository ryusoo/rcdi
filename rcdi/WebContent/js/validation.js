var joinValidate = {
	// 결과 메세지를 출력시 사용하는 Text
	resultCode : {
		// 공통
		empty_val : {
			code : 1,
			desc : '필수입력 정보입니다.'
		},
		space_length_val : {
			code : 2,
			desc : '공백없이 입력해주세요.'
		},
		// ID
		success_id : {
			code : 0,
			desc : '멋진 ID입니다.'
		},
		invalid_id : {
			code : 3,
			desc : '올바른 ID를 입력해주세요.'
		},
		length_id : {
			code : 4,
			desc : 'ID는 공백없이 6자 이상~ 50자 이하여야 합니다.'
		},
		overlap_id : {
			code : 5,
			desc : '이미 사용 중인 ID 입니다.'
		},
		// PW
		success_pw : {
			code : 0,
			desc : '사용가능한 비밀번호입니다.'
		},
		invalid_pw : {
			code : 3,
			desc : '올바른 비밀번호(4~12자)를 입력해주세요.'
		},
		other_pw : {
			code : 4,
			desc : '입력하신 비밀번호가 일치하지 않습니다.'
		},

		// name
		success_name : {
			code : 0,
			desc : '멋진 이름이네요.'
		},
		invalid_name : {
			code : 3,
			desc : '이름은 표준한글만 입력가능합니다.'
		},
		length_name : {
			code : 4,
			desc : '이름은 2자 이상~4자 이하만 가능합니다.'
		},
		// phone
		success_phone : {
			code : 0,
			desc : '사용가능한 번호입니다.'
		},
		invalid_phone : {
			code : 3,
			desc : '휴대폰 번호가 유효하지 않습니다.'
		},
		number_phone : {
			code : 4,
			desc : '숫자만 입력해주세요.'
		},
		length_phone : {
			code : 5,
			desc : '(-)없이 10, 11자로 입력해주세요.'
		},
		// email
		success_email : {
			code : 0,
			desc : '사용가능한 이메일입니다.'
		},
		invalid_email : {
			code : 3,
			desc : '올바른 이메일을 입력해주세요.'
		}
	// 여기는 마지막이라 ,가 없다
	},

	checkId : function(memId) {
		// ID
		var regEmpty = /\s/g; // 공백문자
		var reg = /[^a-z0-9-_.]+/g; // 올바른 아이디 형식				
		
		// 4. member.jsp에서 전달한 매개변수 memId로 유효성체크 시작
		// 1) null값 체크						if
		// 2) 값 사이의 공백값 체크				else if
		// 3) 유효한 값인지 체크(정규식)			else if
		// 4) 6자~50자 이내 길이 체크			else if
		// 5) 성공: 유효한 값(아직 중복유무X)		else
		
		if (memId == "" || memId.length == 0) {
			// joinValidation과 같은 레벨이라서 this
			return this.resultCode.empty_val;
		} else if (memId.match(regEmpty)) {
			return this.resultCode.space_length_val;
		} else if (reg.test(memId)) {
			return this.resultCode.invalid_id;
		} else if (memId.length < 6 || memId.length > 50) {
			return this.resultCode.length_id;
		} else {
			// 5. 입력받은 값이 rsj6611로
			//	   위의 유효성체크 4단계를 통과
			// 	   하지만 중복된 ID인지 검정 필요함
			// 6. return 결과값으로 success_id(code, desc)를 호출한 곳으로 전송
			//	  >>> code: 0, desc : '멋진 아이디네요.'
			return this.resultCode.success_id;
		}
	}, // checkId
	
	checkPw : function(memPw, memRpw){
		var regEmpty = /\s/g; // 공백문자
		var pwReg = RegExp(/^[a-zA-Z0-9]{4,12}$/); // 비밀번호 체크 /^이면 true, false가 반대가 된다

		if (memPw == "" || memPw.length == 0) {
			return this.resultCode.empty_val;
		} else if (memPw.match(regEmpty)) {
			return this.resultCode.space_length_val;
		} else if (!pwReg.test(memPw)) { // 위의 정규식에서 /^이기 때문에 true, false가 반대가 되어!를 써야함			
			return this.resultCode.invalid_pw;
		} else {			
			return this.resultCode.success_pw;
		} // else끝
	}, // checkPw 끝
	
	checkRpw : function(memPw, memRpw){
		var regEmpty = /\s/g; // 공백문자
		var pwReg = RegExp(/^[a-zA-Z0-9]{4,12}$/); // 비밀번호 체크 /^이면 true, false가 반대가 된다
		
		if (memRpw == "" || memRpw.length == 0) {
			return this.resultCode.empty_val;
		} else if (memRpw.match(regEmpty)) {
			return this.resultCode.space_length_val;
		} else if (!pwReg.test(memRpw)) { // 위의 정규식에서 /^이기 때문에 true, false가 반대가 되어!를 써야함			
			return this.resultCode.invalid_pw;
		} else {			
			return this.resultCode.success_pw;
		} // else끝
		
	}
	

} // joinValidation 끝



// ID 중복체크 Ajax
function ajaxCheck(memId) {// memId 에 값이 있는 경우에만 ajax 동작!
	// 10. ajax 시작!
	//	 목적지: idCheck, rcdi
	//	 전달데이터: memId 데이터를 id변수에 담아 전달
	//	 데이터포장방법: json
	//	 데이터 전달방법: POST방식
	//   결론: web.xml로 이동
	$.ajax({
		// "idCheck.rcdi?id="+id 이렇게 쿼리스트링 처럼 보내는 것을 나눠서 적음
		url : "idCheck.rcdi",
		type : "POST", // 목적지로 보낼 때 방법
		dataType : "json", // 목적지로 보낼 때 어떤 포장으로 보내는지 예를들어 캐리어가방, 백팩가방
		data : "id=" + memId, // 
		success : function(data) { // 여기 데이터는 무조건 String 타입으로만 받을 수 있다. (보낼 때 json이나, xml타입으로 보내는데 json을 많이 쓴다)
			// 29. Action단에서 전송한 message, id를 data 매개변수로 담음
			// 30. data.message의 값이 -1이면 => 중복메시지 출력
			//     data.message의 값이 1이면 => 사용가능메시지 출력
			alert(data.message);
			if (data.message == "-1") {
				$('.error_next_box').eq(0).text('중복된 아이디입니다.').css('display', 'block').css('color', '#FF3636');
				return "-1";
			} else {
				$('.error_next_box').eq(0).text('사용가능한 아이디입니다.').css('display', 'block').css('color', '#0000FF');
				return "1";
			}
		},
		error : function() { // success나 error 둘중에 하나만 경로를 탄다.
			alert: ("System Error!!!");
		}

	}); // Ajax를 호출했던 곳으로 돌아간다.

}



function ajaxPwCheck(nowId, nowPw){
	var return_val = false;
	$.ajax({
		url: 'pwCheck.rcdi',
		type: 'POST',
		dataType: 'json',
		async: false,
		data: 'id='+nowId+'&pw='+nowPw,
		success: function(data){
			if(data.flag) {
				$(".pwAjax").text("입력하신 비밀번호와 현재 비밀번호가 일치합니다.").css("display","block").css("color", "#0000FF");
				return_val = true;
			} else {
				
				$(".pwAjax").text("입력하신 비밀번호와 현재 비밀번호가 일치하지 않습니다.").css("display","block").css("color", "#FF3636");
				return_val = false;
			}
		},
		error: function(){
			alert("System Error!!!");
		}
	});
	return return_val;
	
}