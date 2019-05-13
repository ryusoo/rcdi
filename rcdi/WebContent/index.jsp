<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section>
		<article>
			<div id="main_video">
				<div class="inner">
					<h1>This is Running Motivation</h1>
					<p>YOU CAN DO IT!<br>
						</p>
				</div>
				<video autoplay loop muted> <!-- autoplay 자동재생, loop 무한반복 -->
					<source src="${path}/images/Running_Motivation_2018.mp4" type="video/mp4" /> <!-- / 가 있어야함 -->
				</video>
			</div>
			<div class="main_img">
				<img src="${path}/images/190315_hp_p3_bg.jpg">
			</div>
			<div class="men_shoes_product">
				<div class="men_shoes_wrap">
					<span id="best_men_shoes">BEST SHOES</span><p>
					
					<!-- var="best"는 변수이름, "best"라고만 해도 상관없음 -->
				<c:forEach items="${bestList}" var="best"> 
					<div class="shoes_product">
						<a href=" "><img src="images/item/${best.p_img}" alt="신발 이미지" width="200"></a><p>
						<span>${best.p_name}</span><br>
						
						<span>${best.p_price}원</span>
					</div>
				</c:forEach>
					
				</div>
			</div>

			<div class="men_shoes_product">
				<div class="men_shoes_wrap">
					<span id="best_men_shoes">NEW CLOTHING</span><p>
					
					<c:forEach items="${arrivalList}" var="arrivalDTO"> 
						<div class="shoes_product">
							<a href=" "><img src="images/item/${arrivalDTO.p_img}" alt="의류 이미지" width="200"></a><p>
							<span>${arrivalDTO.p_name}</span><br>
							<span>${arrivalDTO.p_price}원</span>
						</div>
					</c:forEach>
				</div>
			</div>
		</article>
	</section>
<%@ include file="include/footer.jsp" %>
</body>
</html>