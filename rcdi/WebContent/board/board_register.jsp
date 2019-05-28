<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>    
<c:if test="${sessionScope.loginUser == null}">
	<script>
		alert("로그인 하신 후 사용하세요.");
		location.href="${path}/boardList.rcdi?message=nologin";
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<script type="text/javascript" src="${path}/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
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
	cursor: pointer;
}
.bottom {
	display: flex;
	justify-content: space-between;
}
.file_space {
	display: inline-block;
}
#txt_box {
	color: tomato;
	font-size: 13px;
	display: none;
	margin: 6px 5px;
}
.file_up {
	width: 600px;
	/* border: 1px solid #333; */
	
}
#close_file_btn {
	
}


</style>
</head>
<body>
	<div class="wrap">
		<h3>질문 게시판</h3> <!--  form태그로 보낸값을 requset로 못받고 전부다 multipart로 받아야함 + POST방식만 가능-->
		<form name="frm_register" method="POST" action="registerPlay.rcdi" id="frm_register" enctype="multipart/form-data">
			<div class="tit">
				<span class="name">제목</span>
				<input type="text" id="title" class="input_box" name="title">
				
			</div>
			<div>
				<span class="name">내용</span>
				<textarea id="register_box" class="content_box" style="width: 695px" name="register_box"></textarea>
				<script type="text/javascript">
					var oEditors = [];
					nhn.husky.EZCreator.createInIFrame({
				    oAppRef: oEditors,
				    elPlaceHolder: "register_box",
				    sSkinURI: "<%=request.getContextPath()%>/smarteditor/SmartEditor2Skin.html",
				    fCreator: "createSEditor2"
				});
				</script>
			</div>
			
			<div>
				<span class="name">작성자</span>
				<input type="text" id="writer" class="input_box" name="writer" value="${sessionScope.loginUser.id}">
			</div>
			<div class="bottom">
				<span id="txt_box"> 내용을 입력해 주세요</span>
				<div class="file_up">
					<input type="file" name="uploadfile" id="uploadfile" style="display:none;"> 
					<input type="button" class="btn btn_file" value="파일 선택">
					<span class="files" id="file_name" style="height: 29px; border:none;">선택된 파일 없음</span>
					<span id="now_file_size"></span>
					<i class="fas fa-times" id="close_file_btn" style="display: none;"></i>
					<!-- <div class="file_space">첨부파일 없음</div> -->
				</div>
				<button id="sbm_btn"class="btn btn_up">게시글 등록</button>
			</div>
		</form>	
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
	
	
	$('#sbm_btn').click(function(){
		oEditors.getById["register_box"].exec("UPDATE_CONTENTS_FIELD", []);
		
		var title = $.trim($("#title").val());
		var content = $("#register_box").val();
		
		if(content == "<p><br></p>") { 
			$("#register_box").focus();
			$("#txt_box").css("display", "inline-block");
			return false;
		} else if(title == null || title.length == 0) { 
			$("#title").focus();
			$("#txt_box").css("display", "inline-block");
			return false;
		} else {
			$('#frm_register').submit();
		}
	});
});
	$(document).on("click", ".btn_file", function(){
		$("#uploadfile").click();
	});
	$(document).on("change", "#uploadfile", function(){
		// 첨부파일은 배열로 담아 둠
		var filesize = $(this)[0].files;
		if(filesize.length < 1){ // 배열에서 1보다 작다는 뜻은 파일이 없다는 뜻
			$("#file_name").text("선택된 파일 없음");
			$("#close_file_btn").css("display", "none");
		} else {
			var filename = this.files[0].name; 
			var size = this.files[0].size; // size는 단위가 byte이다
			var maxSize = 10 * 1024 * 1024; // 10mb
			
			if(size > maxSize){ // 초기화 시킴
				alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다.");
				$("#file_name").text("선택된 파일 없음");
				$("#uploadfile").val("");
				$("#now_file_size").text("");
				$("#now_file_size").val("0mb");
			} else {
				$("#file_name").text(filename);
				var formSize = size/(1024*1024);
				$("#now_file_size").text("("+formSize.toFixed(2)+"mb)"); // toFixed 소수점버림 
				$("#close_file_btn").css("display","inline-block").css("cursor","pointer");
			}
		}
	});
	$(document).on("click","#close_file_btn", function(){
		$("#uploadfile").replaceWith($("#uploadfile")).clone(true);
		$("#uploadfile").val();
		$("#now_file_size").text("");
		$("#file_name").text("선택된 파일 없음");
		$("#close_file_btn").css("display","none");
	});


</script>	
</body>
</html>