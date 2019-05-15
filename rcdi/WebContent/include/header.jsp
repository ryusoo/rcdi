<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- common.jsp의 내용이 이자리에 들어오는 것과 같다 -->
<%@ include file="common.jsp"%>

<!-- url정보를 가지고 다니는 코드 referer가 바로 앞의 이전페이지 정보를 알려준다. 여기서 사용하면 login이 모달이 아니라
새로운 페이지이어야 사용한다. -->
<%-- <%
	String referer = request.getHeader("referer");
%> --%>

<%-- 프로젝트 이름(=컨텍스트루트)/CSS/header.css
=<%=path%>/CSS/header.css
항상 시작을 프로젝트 경로부터 시작해라 --%>
<%-- <%
	String path = request.getContextPath(); 
%> 

<%=path%>를 사용했었음
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/css/common.css?v=1">
<link rel="stylesheet" href="${path}/css/header.css?v=1">
<title>Insert title here</title>
</head>
<body>
	<button id="topBtn">
		<i class="fas fa-arrow-up"></i>
	</button>
	<header>
		<div class="header_menu">
			<div class="inner_header inner_header_menu">
				<div class="header_sns">
					<a href="#"><i class="fab fa-instagram"></i></a> <a href="#"><i
						class="fab fa-facebook"></i></a> <a href="#"><i
						class="fab fa-twitter-square"></i></a> <a href="#"><i
						class="fab fa-google"></i></a> <a href="#"><i class="fab fa-line"></i></a>
				</div>
				<div class="header_i">
					<div class="header_i1">
						<a href="#"><i class="fas fa-running"></i></a>
					</div>
					<!-- <div class="header_i2">
						<a href="#"><i class="fas fa-grip-lines-vertical"></i></a>
					</div> -->
				</div>
				<div class="header_member">
					<!-- li태그는 구조니까 ul과 li 사이에 a태그 안쓰는 것이다 -->
					<%-- href="${path}/login.bizpoll"  --%>

					<!-- c:choose = if문을 사용하겠다 -->
					<!-- c:when이 if다. test에 조건이 들어간다 -->
					<!-- sessionScope의 뜻은 Session에 가서 loginUser를 가져와라 라는 뜻이다 -->
					<%-- ${empty sessionScope.loginUser} = ${sessionScope.loginUser == null} --%>
					<!-- 왼쪽의 코드가 더 좋은 코드이다. 세션에 로긴유저가 비어있으면(empty) c:when을 타라 -->
					<!-- c:otherwise = else문 -->
					<!-- 아래의 span사이에 있는 코드는 Session에서 값 가져오는 코드. 반드시 sessionScope를 써야함 
									<span>${sessionScope.loginUser.name}</span>
											(${sessionScope.loginUser.id}) -->
					<ul>
						<c:choose>
							<c:when test="${empty sessionScope.loginUser}">
								<li><a id="open_btn">로그인</a></li>
								<li><a href="${path}/constract.rcdi">회원가입</a></li>
							</c:when>
							<c:otherwise>
								<li id="loginInfo"><span>${sessionScope.loginUser.name}</span>
									(${sessionScope.loginUser.id})</li>
								<li><a href="#" class="logout_btn">로그아웃</a></li>
							</c:otherwise>
						</c:choose>

						<!-- 아래의 코드를 쓰는 경우에는 referer을 사용하는 방법이다. ajax이전의 방법 -->
						<%-- 	<li><a href="${path}/loginOut.rcdi">로그아웃</a></li> --%>

						<li><a href="#" id="mypage">마이페이지</a>
							<div class="mypage_dropdown">
								<ul>
									<li><div class="mypage_check">주문/배송 조회</div></li>
									<li><div class="mypage_wishlist">위시리스트</div></li>
									<li><div class="mypage_mem_update">내정보 수정</div></li>
									<li><div class="mypage_pw_update">비밀번호 재설정</div></li>
									<li><div class="mypage_mem_delete">회원탈퇴</div></li>
								</ul>
							</div>
						</li>
						<li><a href="#">고객센터</a></li>
						<li id="cart_icon"><a href="#"><i class="fas fa-shopping-cart"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="two_wrap">
			<div class="header_logo">
				<div class="inner_header_wrap">
					<div class="inner_header_logo">
						<a href="#"><img src="${path}/images/logo2.png" alt="logo"></a>
					</div>
					<div class="inner_header_center">
						<a href="#"></a>
					</div>
					<div class="inner_header_search">
						<a href="#"></a>
					</div>
				</div>
			</div>
			<div class="header_nav">
				<div class="inner_header">
					<ul>
						<li><a href="#" class="bmenu">MEN</a>
							<div class="men_dropdown">
								<div class="men_dropdown1">
									<ul>
										<li><a href="#">NEW ARRIVALS</a></li>
										<li><a href="#">THE BEST</a></li>
										<li><a href="#">COLLECTION</a></li>
										<li><a href="#">SALE</a></li>
									</ul>
								</div>
								<div class="men_dropdown2">
									<ul>
										<li><a href="#">CLOTHING</a></li>
										<li><a href="menshoes.html" target="_blank">SHOES</a></li>
										<li><a href="#">COLLECTION</a></li>
										<li><a href="#">SALE</a></li>
									</ul>
								</div>
							</div></li>
						<li><a href="#" class="bmenu">WOMEN</a>
							<div class="men_dropdown">
								<div class="men_dropdown1">
									<ul>
										<li><a href="#">NEW ARRIVALS</a></li>
										<li><a href="#">THE BEST</a></li>
										<li><a href="#">COLLECTION</a></li>
										<li><a href="#">SALE</a></li>
									</ul>
								</div>
								<div class="men_dropdown2">
									<ul>
										<li><a href="#">CLOTHING</a></li>
										<li><a href="menshoes.html" target="_blank">SHOES</a></li>
										<li><a href="#">COLLECTION</a></li>
										<li><a href="#">SALE</a></li>
									</ul>
								</div>
							</div>
						</li>
						<li><a href="#" class="bmenu">BOYS</a>
							<div class="men_dropdown">
								<div class="men_dropdown1">
									<ul>
										<li><a href="#">NEW ARRIVALS</a></li>
										<li><a href="#">THE BEST</a></li>
										<li><a href="#">COLLECTION</a></li>
										<li><a href="#">SALE</a></li>
									</ul>
								</div>
								<div class="men_dropdown2">
									<ul>
										<li><a href="#">CLOTHING</a></li>
										<li><a href="menshoes.html" target="_blank">SHOES</a></li>
										<li><a href="#">COLLECTION</a></li>
										<li><a href="#">SALE</a></li>
									</ul>
								</div>
							</div>
						</li>
						<li><a href="#" class="bmenu">GIRLS</a>
							<div class="men_dropdown">
								<div class="men_dropdown1">
									<ul>
										<li><a href="#">NEW ARRIVALS</a></li>
										<li><a href="#">THE BEST</a></li>
										<li><a href="#">COLLECTION</a></li>
										<li><a href="#">SALE</a></li>

									</ul>
								</div>
								<div class="men_dropdown2">
									<ul>
										<li><a href="#">CLOTHING</a></li>
										<li><a href="menshoes.html" target="_blank">SHOES</a></li>
										<li><a href="#">COLLECTION</a></li>
										<li><a href="#">SALE</a></li>
									</ul>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<!-- 로그인 modal창 -->

		<div id="wrap">
			<div id="rcdy_content">
				<div id="login_content">
					<div id="login_area">
						<div id="subtitle">Login</div>
						<div id="close_btn">
							<i class="fas fa-times"></i>
						</div>
						<div id="container">
							<form name="" action="" method="POST" id="login_form">
								<input type="text" class="idpw" id="login_id" name="" placeholder="아이디"></input> 
								<input type="password" class="idpw" id="login_pw" name="" placeholder="비밀번호"></input> 
								<span class="err_msg">필수정보입니다.</span>
							</form>
							<div class="wrap_btn">
								<a href="#" id="btn_join"> 
									<span>회원가입</span> <!-- <img alt="로그인" src="img/login.png"> -->
								</a> 
								<a href="#" id="btn_login"> 
									<span>로그인</span> <!-- <img alt="로그인" src="img/login.png"> -->
								</a>
							</div>
						</div>
						<div id="login_help">
							<!-- <a href="#">회원가입</a> -->
							<div class="right">
								<a href="#">계정 찾기</a> 
								<span class="right_bar">｜</span> 
								<a href="#">비밀번호 찾기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
	</header>

	<script type="text/javascript">
	
	
	$(function(){
		
		var flag = 0;
		$('#mypage').click(function(){
			if(flag == 0){
				$('.mypage_dropdown').css('display','block');
				flag = 1;
			} else {
				$('.mypage_dropdown').css('display','none');
				flag = 0;
			}
		});

		// 로그인 모달창 열고, 닫기
		$('#open_btn').click(function(){
			$('#wrap').css('display', 'flex');
			$('#login_id').focus();
		});
		$('#close_btn').click(function(){
			$('#login_id').val("");
			$('#login_pw').val("");
			$('#wrap').css('display', 'none');
			$('.err_msg').css('display', 'none');
		});
		
		$('#login_id').blur(function(){
			var id = $.trim($('#login_id').val());
			var regEmpty = /\s/g;
			
			if(id == null || id.length == 0){
				$('.err_msg').text('필수정보 입니다.').css('display', 'block');
				return false;
			} else if(id.match(regEmpty)){
				$('.err_msg').text('공백없이 입력해주세요.').css('display', 'block');
				return false;
			} else {
				$('.err_msg').css('display', 'none');
			}
		});
		
		$('#login_pw').blur(function(){
			var pw = $.trim($('#login_pw').val());
			var regEmpty = /\s/g;
			
			if(pw == null || pw.length == 0){
				$('.err_msg').text('필수정보 입니다.').css('display', 'block');
				return false;
			} else if(pw.match(regEmpty)){
				$('.err_msg').text('공백없이 입력해주세요.').css('display', 'block');
				return false;
			} else {
				$('.err_msg').css('display', 'none');
			}
		});
		

		// 모달에서 로그인버튼 누름
		// on이 이어주는 것
		$('#btn_login').on('click', function(){
			var id = $.trim($('#login_id').val());
			var pw = $.trim($('#login_pw').val());
			var flag = true;
			
			var regEmpty = /\s/g; // 공백문자
			
			//1.null값 체크
			//2.공백체크
			if(id == null || id.length == 0){
				flag = false;
			} else if(id.match(regEmpty)){
				flag = false;
			}
			
			if(pw == null || pw.length == 0){
				flag = false;
			} else if(pw.match(regEmpty)){
				flag = false;
			}
			
			// 동작 Ajax
			if(flag) {
				$.ajax({
					url: "login.rcdi",
					type: "POST",
					dataType: "json",
					data: "id="+id+"&pw="+pw,
					success: function(data){
						if(data.message == "1"){
							location.reload();
							// alert(data.message);
						} else if(data.message == "-1"){
							$('#id').select();
							$('.err_msg').text('회원 아이디 또는 비밀번호가 일치하지 않습니다.').css('display','block');
						}
					},
					error: function(){
						// alert("System Error(♨_♨)/")
					}
				});
			}
			
			
			
			
			
			
		});
		
		
		// 내정보 수정
		$('.mypage_mem_update').click(function(){
			location.href="infoUpdate.rcdi";
		});
		
		// 비밀번호 재설정
		$('.mypage_pw_update').click(function(){
			location.href="pwUpdate.rcdi";
		});
		// 회원탈퇴
		$('.mypage_mem_delete').click(function(){
			location.href="dropMember.rcdi";
		});
		
		

		// 스크롤 끝에서 탑으로 올라가는 버튼이 생김 & 스크롤 내리면 헤더에 숨겨진 로고가 뜸
		$(window).scroll(function(){

			var scrollValue = $(this).scrollTop();
			if(scrollValue > 40) {
				$('#topBtn').fadeIn();
				$('.two_wrap').css('top', '34px');
				
			} else {
				$('#topBtn').fadeOut();
				$('.two_wrap').css('top', '-50px');

			}
		});

		$('#topBtn').click(function(){
			$('html, body').animate({scrollTop : 0}, 100);
		});


		// 호버했을 때 드롭다운창에 마우스 옮겨가도 계속 언더라인 유지하는 것

		$('.bmenu').hover(function(){
			$(this).css('border-bottom', '3px solid black');
		}, function(){
			$(this).css('border-bottom', 'none');
		});


		$('.men_dropdown').hover(function(){
			$(this).prev().css('border-bottom', '3px solid black');
		}, function(){
			$(this).prev().css('border-bottom', 'none');
		});

		// 마우스 올렸을 때 아이콘 이동
		/*$('.btn_mouseenter').mouseenter(function(){
				$('.content').text("마우스 올렸음");
			});*/


	});
	
	// 로그아웃
	$(document).on('click', '.logout_btn', function(){
		$.ajax({
			url: "logoutAjax.rcdi",
			type: "POST",
			dataType: "json",
			success: function(data){
				location.reload(); // 새로고침
			},
			error: function(){
				alert("System Error(♨_♨)/")
			}
		});
	});
	
	
	
	
	
	

</script>
</body>
</html>