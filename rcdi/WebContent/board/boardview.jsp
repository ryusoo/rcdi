<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<style type="text/css">
.wrap {
	border-top: 20px solid #333;
	border-left: 1px solid #333;
	border-right: 1px solid #333;
	border-bottom: 1px solid #333;
	width: 800px;
	margin: 120px auto;
	height: auto;
	min-height: 750px;
	padding: 50px;
	border-radius: 10px;
	box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16),
		     	0 2px 10px 0 rgba(0,0,0,0.12);
}
h3 {
	font-size: 35px;
	margin-left: 20px;
}
table {
	border-collapse: collapse;
	border-top: 3px solid #333;
	border-bottom: 3px solid #333;
	width: 100%;
	margin: 0 auto;	
}
tr {
	height: 25px;
}
tr:nth-child(3) {
	border-bottom: 3px solid #333;
}
td {
	padding-left: 10px;
	height: 30px;
}
td:nth-child(1), td:nth-child(3) {
	background-color: lightgray;
	text-align: center;
	color: #333;
	font-weight: bold;
	line-height: 37px;
	
}	
#content {
	height: auto;
	min-height: 150px;
	border-bottom: 3px solid #333;
	background-color: white;
	padding: 10px;
}
.bottom_btn {
	display: flex;
	justify-content: space-between;
}
.btn {
	margin: 15px 10px;
	border-radius: 20px;
	color: white;
	background-color: #333;
	border: 1px solid #333;
	padding: 0 10px;
	outline: none;
	height: 35px;
	line-height: 35px;
	font-size: 18px;
	font-weight: bold;
}
/* 좋아요 영역 */
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
/* 댓글영역 */
.comment_area {
	padding: 10px;
	width: 100%;
	height: auto;
}
.each_space {
	margin: 20px 0;
}
.comment_box {
	display: flex;
	margin: 20px 0;
}
.writer_comment {
	width: 100%;
}
.writer_emo img {
	width: 100%;
}
.top_comment {
	border-bottom: 1px solid #333;
	display: inline-block;
	font-size: 21px;
	font-weight: bold;
	padding: 5px;
	margin-bottom: 10px;
}
.comment_cnt {
	color: tomato;
}
.empty_box {
	border: 1px solid dimgray;
	border-radius: 5px;
	height: 80px;
	text-align: center;
	line-height: 80px;
	background-color: #eaeaea;
}
.writing_box {
	border: 1px solid dimgray;
	border-radius: 5px;
	height: auto;
	background-color: #eaeaea;
	padding: 10px;
}

.reg_date {
	display: inline-block;
	color: dimgray;
	font-size: 15px;
}
.comment_head {
	margin: 5px 10px;
	font-weight: bold;
}
.comment_body {
	width: 90%;
	height: auto;
	margin-top: 10px;
	padding:10px;
	border-bottom: 1px solid #eaeaea;
}
.comment_delete_btn {
	color: tomato;
	cursor: pointer;
}
#login_txt {
	color: tomato;
	font-weight: bold;
}
.writing_area {
	width: 650px;
	border: 1px solid red;
	margin: 20px auto;
	
}
.btn_comment {
	float: right;
	margin-top: 15px;
}
.writer_top {
	font-weight: bold;
}
.btn_comment {
	margin: 5px 10px;
	border-radius: 20px;
	color: white;
	background-color: #333;
	border: 1px solid #333;
	padding: 0 10px;
	outline: none;
	height: 30px;
	line-height: 30px;
	font-size: 13px;
	font-weight: bold;
}





/* 모달창 */
#modal {
	position: fixed;
	z-index: 3;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.6);
	display: flex;
	justify-content: center;
	align-items: center;
	display: none;
}
.modal_title {
	background-color: dimgray;
	color: white;
	border-radius: 5px 5px 0px 0px;
	font-size: 13px;
	width: 350px;
	font-weight: 600;
	height: 30px;
	line-height: 30px;
	padding-left: 10px;
}
.modal_content {
	width: 350px;
	text-align: center;
	color: #363636;
	font-size: 18px;
	font-weight: 600;
	background-color: white;
	height: 150px;
	border-radius: 0px 0px 5px 5px;
	padding: 35px 10px;
}
.modal_content span{
	color: dodgerblue;
}
.no_btn {
	text-decoration: none;
	color: white;
	border-radius: 5px;
	border: 1px solid #363636;
	width: 100px;
	margin: 0px auto;
	display: inline-block;
	font-size: 25px;
	font-weight: 600;
	line-height: 38px;
	background-color: #363636;
}
.yes_btn {
	text-decoration: none;
	color: #363636;
	border-radius: 5px;
	border: 1px solid #363636;
	width: 100px;
	margin: 0px auto;
	display: inline-block;
	font-size: 25px;
	font-weight: 600;
	line-height: 38px;
}


</style>
</head>
<body>
	<div class="wrap">
		<h3>질문 게시판</h3>
		<table>
			<tbody>
				<tr>
					<td class="title"><span>제목</span></td>
					<td><span>안녕하세요</span></td>
					<td class="date"><span>작성일</span></td>
					<td><span>2019-05-17</span></td>
				</tr>
				<tr>
					<td class="writer"><span>작성자</span></td>
					<td><span>유저1</span></td>
					<td class="idx"><span>글번호</span></td>
					<td><span>10</span></td>
				</tr>
				<tr>
					<td class="file"><span>첨부파일</span></td>
					<td><span>없음</span></td>
					<td class="hit"><span>조회수</span></td>
					<td><span>11</span></td>
				</tr>
			</tbody>
		</table>
		<div id="content">
			내용없음
		</div>
		<!--버튼 영역 -->
		<div class="bottom_btn">
			<div class="btn_left">
				<button class="btn btn_list">게시글 목록</button>
				<button class="btn btn_reply">답변</button>
			</div>
			<div class="btn_right">
				<button class="btn btn_delete">삭제</button>
				<button class="btn btn_update">수정</button>
			</div>
		</div>
		<!-- 좋아요 영역 -->
		<div id="wrap_like">
			<button type="button" class="btn_like btn_unlike" id="btn_good">
				<span class="img_emoti">좋아요</span>
				<span class="ani_heart_m"></span>
			</button>		
		</div>		
		<!-- 댓글 영역 -->
		<div class="comment_area">
		<!-- 댓글 리스트 영역 -->						
			<!-- 댓글이 없을 때 디자인 -->
			<div class="noncomment_list_wrap each_space">
				<div class="top_comment"> 
					<i class="far fa-comment"></i>
					<span class="comment_cnt">0</span>
					<span>Comments</span>
				</div>
			</div>						
			<div class="empty_box">
				등록된 댓글이 없습니다. 첫번째 댓글을 남겨주세요:)
			</div>
			<!-- 댓글이 있을 때 디자인 -->
			<div class="comment_list_wrap each_space">
				<div class="top_comment"> 
					<i class="fas fa-comment-dots"></i>
					<span class="comment_cnt">2</span>
					<span>Comments</span>
				</div>
				<div class="comment_box">
					<div class="writer_comment">
						<div class="comment_head">
							<span>유저1</span>
							<div class="reg_date"><i class="far fa-clock"></i>19.05.17 02:21</div>
							<span class="comment_delete_btn">삭제</span>
						</div>
						<div class="comment_body">
							내용 없음
						</div>
					</div>					
				</div>
				<div class="comment_box">
					<div class="writer_comment">
						<div class="comment_head">
							<span>유저2</span>
							<div class="reg_date"><i class="far fa-clock"></i>19.05.17 02:56</div>
							<span class="comment_delete_btn">삭제</span>
						</div>
						<div class="comment_body">
							내용 없음
						</div>
					</div>					
				</div>				
			</div>
			<!-- 비로그인 시, 로그인 시 댓글 작성 영역-->
			<!--비로그인 시 로그인 하라는 경고창 -->
			<div class="writing_logout_wrap each_space">
				<div class="top_comment"> 
					<i class="fas fa-pencil-alt"></i>				
					<span>로그인이 필요합니다</span>
				</div>						
				<div class="empty_box">
					<span id="login_txt">로그인</span>을 하시면 댓글을 등록할 수 있습니다.
				</div>
			</div>
			<!--로그인 시 댓글 작성 창 -->
			<div class="writing_logout_wrap each_space">
				<div class="top_comment"> 
					<i class="fas fa-pencil-alt"></i>				
					<span>댓글 쓰기</span>
				</div>						
				<div class="writing_box">
					<div class="writer_top">
						<span id="writer">작성자: </span><span id="user">유저1</span>
					</div>				
					<div class="writing_area">
						내용없음
					</div>
				</div>
				<button type="button" class="btn_comment">댓글 등록</button>
			</div>					
		</div>
	</div>
	<!-- 삭제버튼 클릭시 모달창 -->
	<div id="modal">
		<div class="modal_page">
			<div class="modal_title">RCDI</div>
			<div class="modal_content">정말 <span>게시물</span>을 삭제하시겠습니까?<br><br>
				<a href="#" class="no_btn">아니오</a>
				<a href="#" class="yes_btn">네</a>
			</div>
		</div>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.btn').hover(function(){
		$(this).css('background-color', 'white').css('color','#333');
	},
	function(){
		$(this).css('background-color', '#333').css('color','white');
	});
	// 모달창
	$('.btn_delete').click(function(){
		$('#modal').css('display', 'flex');
	});
	$('.yes_btn').click(function(){
		location.href="#";
	});
	$('.no_btn').click(function(){
		$('#modal').css('display', 'none');
	});
	// 좋아요 버튼
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
	// 댓글 등록 버튼
	$('.btn_comment').hover(function(){
		$(this).css('background-color', 'white').css('color','#333');
	},
	function(){
		$(this).css('background-color', '#333').css('color','white');
	});
	
	
});
</script>	
	
</body>
</html>