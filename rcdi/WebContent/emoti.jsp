<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.btn_like {
	position: relative;
	display: inline-block;
	width: 44px;
	height: 44px;
	border: 1px solid #e8e8e8;
	border-radius: 44px;
	font-family: notokr-bold,sans-serif;
	font-size: 14px;
	line-height: 16px;
	background-color: #fff;
	color: #DD5D54;
	box-shadow: 0 2px 2px 0 rgba(0,0,0,0.03);
	transition: border .2s ease-out, box-shadow .1s ease-out, background-color .4s ease-out;
	cursor: pointer;
	outline: none;
}
.btn_like: hover {
	border: 1px solid rgba(228, 89, 89, 0.3);
	background-color: rgba(228, 89, 89, 0.02);
	box-shadow: 0 2px 4px 0 rgba(228, 89, 89, 0.2);
}
.btn_unlike .img_emoti {
	background-position: -30px -120px;
}
.img_emoti {
	display: inline-block;
	overflow: hidden;
	font-size: 0;
	line-height: 0;
	background: url(https://mk.kakaocdn.net/dn/emoticon/static/images/webstore/img_emoti.png?v=20180410) no-repeat;
	text-indent: -9999px;
	vertical-align: top;
	width: 20px;
	height: 17px;
	margin-top: 1px;
	background-position: 0px -120px;
	text-indent: 0;
}	
.btn_like .ani_heart_m {
	margin: -63px 0 0 -63px;
}
.ani_heart_m {
	display: block;
	position: absolute;
	top: 50%;
	left: 50%;
	width: 125px;
	height: 125px;
	margin: -63px 0 0 -63px;
	pointer-events: none;
}
.ani_heart_m.hi {
	background-image: url(https://mk.kakaocdn.net/dn/emoticon/static/images/webstore/retina/zzim_on_m.png);
	-webkit-background-size: 9000px 125px;
	background-size: 9000px 125px;
	animation: on_m 1.06s steps(72);
}
.ani_heart_m.bye {
	background-image: url(https://mk.kakaocdn.net/dn/emoticon/static/images/webstore/retina/zzim_off_m.png);
	-webkit-background-size: 8250px 125px;
	background-size: 8250px 125px;
	animation: off_m 1.06s steps(66);
}
@keyframes on_m {
	from { background-position: 0 }
	to { background-position: -9000px}
}
@keyframes off_m {
	from { background-position: 0 }
	to { background-position: -8250px}
}
#wrap_like {
	text-align: center;
}
i.fa-heart {
	font-size: 14px;
	padding-right: 5px;
}

</style>
</head>
<body>
	<div id="wrap_like">
		<button type="button" class="btn_like" id="btn_good">
			<span class="img_emoti">좋아요</span>
			<span class="ani_heart_m"></span>
		</button>
	</div>
	
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#btn_good').click(function(){
			if($(this).hasClass('btn_unlike')) {
				$(this).removeClass('btn_unlike');
				$('.ani_heart_m').removeClass('hi');
				$('.ani_heart_m').addClass('bye');
			}
			else {
				$(this).addClass('btn_unlike');
				$('.ani_heart_m').addClass('hi');
				$('.ani_heart_m').removeClass('bye');
			}
		});
	});

</script>	
	
</body>
</html>