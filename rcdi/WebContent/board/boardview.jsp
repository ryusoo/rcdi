<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!-- 뒤로가기 했을 때 그 처음으로 돌아가지 않고 바로 전 페이지를 띄우는 코드 -->
<% 
	String referer = request.getHeader("referer");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${path}/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
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
	cursor: pointer;
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
	background: url(images/img_emoti.png) no-repeat;
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
	background-image: url(images/zzim_on_m.png);
	-webkit-background-size: 9000px 125px;
	background-size: 9000px 125px;
	animation: on_m 1.06s steps(72);
}
.ani_heart_m.bye {
	background-image: url(images/zzim_off_m.png);
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
#txt_box {
	color: tomato;
	font-size: 13px;
	display: none;
	margin: 6px 5px;
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
	background-color: #333;
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
			<jsp:useBean id="now" class="java.util.Date"/>
			<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
			<fmt:formatDate value="${one.regdate}" pattern="yyyy-MM-dd" var="regdate" />
				<tr>
					<td class="title"><span>제목</span></td>
					<td><span>${one.title}</span></td>
					<td class="date"><span>작성일</span></td>
					<td>
						<span>
							<c:choose>
								<c:when test="${today == regdate }">
									<fmt:formatDate pattern="hh:mm:ss" value="${one.regdate}" />
								</c:when>
								<c:otherwise>
									<fmt:formatDate pattern="yyyy-MM-dd" value="${one.regdate}" />
								</c:otherwise>
							</c:choose>	
						</span>
						
					</td>
				</tr>
				<tr>
					<td class="writer"><span>작성자</span></td>
					<td><span>${one.writer}</span></td>
					<td class="idx"><span>글번호</span></td>
					<td><span>${one.bno}</span></td>
				</tr>
				<tr>
					<td class="file"><span>첨부파일</span></td>
					<td>
						<c:if test="${one.filesize > 0 }">
							<div id="download">
								<a href="download.rcdi?file=${one.filename}">
								${one.filename}(<fmt:formatNumber type="number" pattern="0.00" value="${one.filesize / 1024 / 1024}"></fmt:formatNumber>mb)
								
								</a>
							</div>
						</c:if>
						<!--choose : when, otherwise filesize > 1mb
								<  1mb : kb --> 
					</td>
					<td class="hit"><span>조회수/좋아요</span></td>
					<td><span>${one.viewcnt}/<span id="goodcnt">${one.goodcnt}</span></span></td>
				</tr>
			</tbody>
		</table>
		<div id="content">
			${one.content}
		</div>
		<!--버튼 영역 -->
		<div class="bottom_btn">
			<div class="btn_left">
				<button class="btn btn_list" id="return_go">게시글 목록</button>
				<button class="btn btn_reply">답변</button>
			</div>
			
			<div class="btn_right">
				<c:if test="${sessionScope.loginUser.id == one.writer}">
					<button class="btn btn_delete">삭제</button>
					<button class="btn btn_update">수정</button>
				</c:if>
			</div>
		</div>
		<!-- 좋아요 영역 -->
		<c:if test="${!empty sessionScope.loginUser.id}">
			<div id="wrap_like">
				<button type="button" class="btn_like" id="btn_good">
					<span class="img_emoti">좋아요</span>
					<span class="ani_heart_m"></span>
				</button>		
			</div>
		</c:if>
		<!-- 댓글 영역 -->
		<div class="comment_area">
			<div id="commentList">
				<!-- 여기에 commentlist.jsp를 띄운다 -->
			</div>
		</div>
	</div>
	<!-- 삭제버튼 클릭시 모달창 -->
	<div id="modal">
		<div class="modal_page">
			<div class="modal_title">RCDI</div>
			<div class="modal_content">정말 <span>게시물</span>을 삭제하시겠습니까?<br><br>
				<a class="no_btn">아니오</a>
				<a class="yes_btn">네</a>
			</div>
		</div>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

	// 뒤로가기 막기(아예 동작을 안하게함)
	/* history.pushState(null, null, location.href);
	window.onpopstate = function(){
		history.go(1);
	}; */

	// 뒤로가기 눌렀을 때 새로 리프레쉬 (내가 원하는 페이지로 이동하게 함)
	history.pushState(null, document.title, location.href);
	window.addEventListener('popstate', function(event){
		history.pushState(null, document.title, '<%=referer%>');
		location.reload(); // 리프레쉬
	});


$(document).ready(function(){
	// 좋아요 실시간 현황
	good_check(0);
	// 문서가 준비되면 댓글 목록을 조회하는 AJAX실행
	comment_list();
	
	// 좋아요
	$('#btn_good').click(function(){
		var id = "${sessionScope.loginUser.id}";
		var bno = "${one.bno}"; // forward방식에서 setattribute
			$.ajax({
				type:"post",
				url: "goodSwitch.rcdi",
				dataType: "json",
				data: "id=" + id + "&bno=" + bno,
				async: false,
				success: function(data){
					good_check(1);
				},
				error: function(){
					
				}
			});
		
		
	});
	
	// result =commentlist.jsp 통으로 리턴됨
	// 선택자가 commentList인것을 찾아서 commentlist.jsp를 html로 실행해라라는 뜻
	
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
		location.href="removePlay.rcdi?bno=${one.bno}&filename=${one.filename}";
	});
	$('.no_btn').click(function(){
		$('#modal').css('display', 'none');
	});
	
	// 수정 버튼
	$('.btn_update').click(function(){
		var bno = "${one.bno}";
		location.href="${path}/boardModify.rcdi?bno="+bno;
	});

	// 댓글 등록 버튼
	$('.btn_comment').hover(function(){
		$(this).css('background-color', 'white').css('color','#333');
	},
	function(){
		$(this).css('background-color', '#333').css('color','white');
	});
});
	// 뒤로가기 했을 때 그 처음으로 돌아가지 않고 바로 전 페이지를 띄우는 코드(이전페이지 url을 그대로 갖고옴) 
	// location.href="<%=referer%>"; 
	
	$(document).on("click", "#return_go", function(){
		location.href="boardList.rcdi"; <%-- <%=referer%> --%>
	});
	
	
	// 댓글 등록
	$(document).on("click", "#reply_btn", function(){
		oEditors.getById["replyInsert"].exec("UPDATE_CONTENTS_FIELD", []);
		
		var content = $("#replyInsert").val();
		
		if(content == "<p><br></p>") { 
			// content == null || content.length == 0 => <p><br></p> 스마트에디터는 내용이 없을 때 이 태그를 가지고있기 때문에 바꿔야함
			// 유효성체크(Null 체크)
			$("#replyInsert").focus();
			$("#txt_box").css("display", "inline-block");
			return false;
		} else {
			// 게시글번호 담아서 보냄
			var bno = '${one.bno}';
			$('#re_bno').val(bno);
			// ajax로 form태그 안의 데이터 보내는 방법
			// 직렬화 데이터가 많으니까 byte코드로 바꿔서 쪼개서 보내고 다시 받을 때 합쳐서 받는다. 데이터가 단건이 아니고 한번에 데이터를 싹보내니까 한번에 싹받기 힘드니까 직렬화시켜서 바이트화코드화시켜서 이걸로 전송을 한다
			// comment_list(); // 댓글목록 최신화하려고 재실행 해줌
			//$('#replyInsert').val(""); // 댓글 최신화 하고나서 작성창을 공백값으로 초기화 시켜줌
			$.ajax({ 
				type:"POST",
				url: "replyAdd.rcdi",
				data: $("#frm_reply").serialize(),  
				contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
				success: function(){ 
					comment_list(); 
					$('#replyInsert').val(""); 
				},
				error: function(){
					alert("System Error!!!");
				}
			});
		}
		
	});
	
	// 댓글 띄우는 함수
	// 단독으로 밖에 빠져있어야 함. document안에있으면 메서드안에 메서드가 있는 모양이다.
	function comment_list(){		
		$.ajax({
			type:"post",
			url: "commentlist.rcdi",
			data: "bno=${one.bno}",
			success: function(result){ 
				$('#commentList').html(result); 
			}
		});
	}
	
	// 좋아요 확인 함수
	function good_check(ani){
		var id = "${sessionScope.loginUser.id}";
		var bno = "${one.bno}";
		$.ajax({
			type:"post",
			url: "goodCheck.rcdi",
			dataType: "json",
			data: "bno=" + bno + "&id="+ id,
			success: function(result){ 
				if(result.goodcheck == "0"){
					$("#btn_good").removeClass('btn_unlike');
					 if (ani == 1){
					$('.ani_heart_m').removeClass('hi');
					$('.ani_heart_m').addClass('bye');
					 }
				} else {
					$("#btn_good").addClass('btn_unlike');
					if(ani == 1){
					$('.ani_heart_m').addClass('hi');
					$('.ani_heart_m').removeClass('bye');
					}
				}
				$("#goodcnt").text(result.goodcurrent);
			}
		});
		
	}
	
	$(document).on("click", ".reply_del", function(){
		var rno = $(this).attr("data_num");
		var bno = '${one.bno}';
		
		$.ajax({
			url: "replyRemove.rcdi",
			data: "rno=" + rno + "&bno=" + bno,
			success: function(result){
				comment_list();
			},
			error: function(){
				alert("System Error!!!");
			}
		});
	});
	
	


</script>	
	
</body>
</html>