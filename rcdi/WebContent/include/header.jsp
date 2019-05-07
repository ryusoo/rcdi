<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- common.jsp의 내용이 이자리에 들어오는 것과 같다 -->
<%@ include file="common.jsp" %>

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

					

					<a href="#"><i class="fab fa-instagram"></i></a>
					<a href="#"><i class="fab fa-facebook"></i></a>
					<a href="#"><i class="fab fa-twitter-square"></i></a>
					<a href="#"><i class="fab fa-google"></i></a>
					<a href="#"><i class="fab fa-line"></i></a>

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
					<ul>
						<li><a id="open_btn">로그인</a></li> <!-- li태그는 구조니까 ul과 li 사이에 a태그 안쓰는 것이다 -->
						<li><a href="#">회원가입</a></li>
						<li><a href="#">고객센터</a></li>
						<li><a href="#"><i class="fas fa-shopping-cart"></i></a></li>
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
							<li>
								<a href="#" class="bmenu">MEN</a>
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
							<li>
								<a href="#" class="bmenu">WOMEN</a>
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
							<li>
								<a href="#" class="bmenu">BOYS</a>
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
							<li>
								<a href="#" class="bmenu">GIRLS</a>
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

		<!-- <div id="rcdy_header"> 
			<h1>
				<a id="rcdy_logo" href="">
					<img src="images/logo2.png" alt="로고 이미지">
					
				</a>
			</h1>
			<div id="rcdy_help">
				<ul class="list_help">
					<li><a href="#">도움말</a></li>
					<li><a href="#">문의하기</a></li>
				</ul>
			</div>
		</div> -->




		<div id="rcdy_content"> 
			<div id="login_content">
				<div id="login_area">

					

					<div id="subtitle">
						Login
					</div>
					<div id="close_btn">
						<i class="fas fa-times"></i>
					</div>
					<div id="container">
						<form name="" action="" method="POST" id="login_form">
							<input type="text" class="idpw" id="login_id" name="" placeholder="이메일 또는 전화번호">
							</input>
							



							<input type="password" class="idpw" id="login_pw" name="" placeholder="비밀번호"></input>
						</form>

						
						<div class="wrap_btn">
							<a href="#" id="btn_join">
								<span>회원가입</span>
								<!-- <img alt="로그인" src="img/login.png"> -->
							</a>
							<a href="#" id="btn_login">
								<span>로그인</span>
								<!-- <img alt="로그인" src="img/login.png"> -->
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

		// 로그인 모달창
		$('#open_btn').click(function(){
			$('#wrap').css('display', 'flex');
		});
		$('#close_btn').click(function(){
			$('#wrap').css('display', 'none');
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

</script>	
</body>
</html>