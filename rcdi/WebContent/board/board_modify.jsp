<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.wrap {
	border-top: 20px solid #333;
	border-left: 1px solid #333;
	border-right: 1px solid #333;
	border-bottom: 1px solid #333;
	width: 800px;
	margin: 120px auto;
	height: 750px;
	padding: 50px;
	border-radius: 10px;
	box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16),
		     	0 2px 10px 0 rgba(0,0,0,0.12);
}

h3 {
	font-size: 35px;
	margin-left: 20px;
}
.name {
	font-size: 20px;
	display: block;
	margin: 5px;
}
.input_box {
	width: 100%;
	height: 50px;
	font-size: 20px;
	padding-left: 10px;
}
.content_box {
	width: 100%;
	height: 200px;
}
.btn {
	margin-right: 20px;
	margin-top: 25px;
	border-radius: 10px;
	color: white;
	background-color: #333;
	border: 3px solid #333;
	padding: 5px;
	outline: none;
	display: inline-block;
	width: 120px;
	height: 40px;
	font-size: 18px;
}
.bottom {
	display: flex;
	justify-content: space-between
}
.file_space {
	display: inline-block;
}


</style>
</head>
<body>
	<div class="wrap">
		<h3>질문 게시판</h3>
		<div class="tit">
			<span class="name">제목</span>
			<input type="text" id="title" class="input_box" name="title">
			
		</div>
		<div>
			<span class="name">내용</span>
			<textarea class="content_box">
			</textarea>
		</div>
		<div>
			<span class="name">작성자</span> 
			<input type="text" id="id" class="input_box" name="id" readonly="readonly" value="작성자">
		</div>
		<div class="bottom">
			<div class="file_up">
				<button class="btn btn_file">파일 등록</button>
				<div class="file_space">첨부파일 없음</div>
			</div>
			<button class="btn btn_up">게시글 수정</button>
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

});
</script>	
</body>
</html>