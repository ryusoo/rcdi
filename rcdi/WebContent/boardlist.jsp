<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.wrap {
	width: 1000px;
	margin: 0 auto;
	margin-top: 150px;
	background-color: #f6f6f6;
	font-family: 'Noto Sans KR', sans-serif; 
	background-color: #ffffff;
}
h3 {
	font-size: 35px;
	margin-left: 20px;
}

.post_array {
	display: inline-block;
	margin: 10px 5px;
	padding-left: 15px;
	height: 50px;
}
.array1 {
	display: inline-block;
	margin-left: 3px;
	cursor: pointer;
	border: 1px solid lightgray;
	border-radius: 20px;
	padding: 5px;
	box-sizing: border-box;
}
.btn_up {
	float: right;
	margin-right: 20px;
	margin-top: 5px;
	border-radius: 10px;
	color: white;
	background-color: #333;
	border: 1px solid dimgray;
	padding: 5px;
	outline: none;
}
/* 게시글 영역 */
table {
	border-collapse: collapse;
	width: 100%;
}
th, td {
	text-align: center;
}
.obj {
	text-align: left;
	cursor: pointer;
}
th {
	background-color: white;
	border-bottom: 2px solid dimgray;
	padding: 3px;
}
tr:nth-child(1){
	box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16),
		     	0 2px 10px 0 rgba(0,0,0,0.12);
}
.tbl_list {
	width: 958px;
	margin: 0 auto;
}
.like i {
	color: red;
}

/* 검색영역 */
.srch_group {
	width: 350px;
	border: 1px solid dimgray;
	background: #ffffff;
	height: 56px;
	display: flex;
	margin: 30px auto;
	border-radius: 5px;
}
select {
	border: 0;
	outline: 0;
}
.slt_box {
	box-sizing: border-box;
	display: inline-block;
	flex: 1;
	margin-left:2px;
}
.slt_style {
	width: 110px;
	height: 50px;
	border: none;
	background: #ffffff;
}
.ipt_box {
	height: 50px;
	margin-left: 10px;	
}
.ipt_style {
	height: 50px;
	outline: none;
	border: none;
}
.icon_srch {
	width : auto;
	height: 56px;
	display: inline-block;
	margin-right: 15px;
	cursor: pointer;
}

/* pagination */
.board_pagination {
    width: 528px;
	margin: 20px auto 0;
	text-align: center;
	height: 30px;
}
.board_pagination a {
	border: 1px solid #333;
	display: inline-block;
	width: 30px;
	height: 30px;
	line-height: 29px;
	border-radius: 5px;
	float: left;
	margin-right: 3px;
}
.board_pagination i {
	width: 30px;
	height: 30px;
	display: block;
	line-height: 30px;
}
</style>
</head>
<body>
	<div class="wrap">
		<form name="bForm" id="nForm" method="POST">
			<!-- 제목과 게시글 정렬 영역 -->
			<div class="top_group">
				<h3 class="tit">질문 게시판</h3>
				<div class="post_array">
					<span class="array1">최신순</span>
					<span class="array1">추천순</span>
					<span class="array1">댓글순</span>
					<span class="array1">조회순</span>
				</div>
				<button class="btn btn_up">게시글 등록</button>
			</div>
			<!-- 게시글 영역 -->
			<div class="tbl_list">
				<table>
					<tbody>
						<tr>
							<th class="idx">No.</th>
							<th class="tb_title">제목</th>
							<th class="writer">작성자</th>
							<th class="date">작성일</th>
							<th class="like">좋아요</th>
							<th class="hit">조회수</th>
							<th class="attach">첨부</th>
						</tr>
						<tr>
							<td class="idx">10</td>
							<td class="obj">안녕하세요</td>
							<td class="writer">유저1</td>
							<td class="date">2019.05.16</td>
							<td class="like"><i class="fas fa-heart"></i>10</td>
							<td class="hit">11</td>
							<td class="attach"><i class="far fa-file-alt"></i></td>
						</tr>
						<tr>
							<td class="idx">9</td>
							<td class="obj">안녕하세요</td>
							<td class="writer">유저1</td>
							<td class="date">2019.05.16</td>
							<td class="like"><i class="fas fa-heart"></i>10</td>
							<td class="hit">11</td>
							<td class="attach"><i class="far fa-file-alt"></i></td>
						</tr>
						<tr>
							<td class="idx">8</td>
							<td class="obj">안녕하세요</td>
							<td class="writer">유저1</td>
							<td class="date">2019.05.16</td>
							<td class="like"><i class="fas fa-heart"></i>10</td>
							<td class="hit">11</td>
							<td class="attach"><i class="far fa-file-alt"></i></td>
						</tr>
						<tr>
							<td class="idx">7</td>
							<td class="obj">안녕하세요</td>
							<td class="writer">유저1</td>
							<td class="date">2019.05.16</td>
							<td class="like"><i class="fas fa-heart"></i>10</td>
							<td class="hit">11</td>
							<td class="attach"><i class="far fa-file-alt"></i></td>
						</tr>
						<tr>
							<td class="idx">6</td>
							<td class="obj">안녕하세요</td>
							<td class="writer">유저1</td>
							<td class="date">2019.05.16</td>
							<td class="like"><i class="fas fa-heart"></i>10</td>
							<td class="hit">11</td>
							<td class="attach"><i class="far fa-file-alt"></i></td>
						</tr>
						<tr>
							<td class="idx">5</td>
							<td class="obj">안녕하세요</td>
							<td class="writer">유저1</td>
							<td class="date">2019.05.16</td>
							<td class="like"><i class="fas fa-heart"></i>10</td>
							<td class="hit">11</td>
							<td class="attach"><i class="far fa-file-alt"></i></td>
						</tr>
						<tr>
							<td class="idx">4</td>
							<td class="obj">안녕하세요</td>
							<td class="writer">유저1</td>
							<td class="date">2019.05.16</td>
							<td class="like"><i class="fas fa-heart"></i>10</td>
							<td class="hit">11</td>
							<td class="attach"><i class="far fa-file-alt"></i></td>
						</tr>
						<tr>
							<td class="idx">3</td>
							<td class="obj">안녕하세요</td>
							<td class="writer">유저1</td>
							<td class="date">2019.05.16</td>
							<td class="like"><i class="fas fa-heart"></i>10</td>
							<td class="hit">11</td>
							<td class="attach"><i class="far fa-file-alt"></i></td>
						</tr>
						<tr>
							<td class="idx">2</td>
							<td class="obj">안녕하세요</td>
							<td class="writer">유저1</td>
							<td class="date">2019.05.16</td>
							<td class="like"><i class="fas fa-heart"></i>10</td>
							<td class="hit">11</td>
							<td class="attach"><i class="far fa-file-alt"></i></td>
						</tr>
						<tr>
							<td class="idx">1</td>
							<td class="obj">안녕하세요</td>
							<td class="writer">유저1</td>
							<td class="date">2019.05.16</td>
							<td class="like"><i class="fas fa-heart"></i>10</td>
							<td class="hit">11</td>
							<td class="attach"><i class="far fa-file-alt"></i></td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- 검색영역 -->
			<div class="srch_group">
				<div class="slt_box">
					<select name="srch_key" class="slt_style">
						<div class="chevron-down"><i class="fas fa-chevron-down"></i></div>
						<option value selected>조건 검색</option>
						<option value="cont_nm">제목</option>
						<option value="cont_contents">내용</option>
						<option value="cont_nm_con">제목+내용</option>
						<option value="cont_mem">작성자</option>
					</select>
				</div>
				<div class="ipt_box">
					<input type="text" id="srchWord" name="srchWord" class="ipt ipt_style" placeholder="검색어를 입력해 주세요.">
					<div class="icon_srch"><i class="fas fa-search"></i></div>
				</div>
			</div>
			<!-- 페이지 네이션 -->
			<div class="board_pagination">
				<a href="#" class="bp_icon"><i class="fas fa-angle-double-left"></i></a>
				<a href="#" class="bp_icon"><i class="fas fa-angle-left"></i></a>
				<a href="#">1</a>
				<a href="#">2</a>
				<a href="#">3</a>
				<a href="#">4</a>
				<a href="#">5</a>
				<a href="#">6</a>
				<a href="#">7</a>
				<a href="#">8</a>
				<a href="#">9</a>
				<a href="#">10</a>
				<a href="#">...</a>
				<a href="#">27</a>
				<a href="#" class="bp_icon"><i class="fas fa-angle-right"></i></a>
				<a href="#" class="bp_icon"><i class="fas fa-angle-double-right"></i></a>
			</div>
		</form>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.array1').hover(function(){
		$(this).css('background-color', "#333").css('color','white');
	},
	function(){
		$(this).css('background-color', "white").css('color','#333');

	});
	
	$('.btn_up').click(function(){
		$(this).css('background-color', "#333").css('color','white');
	}, 
	function(){
		$(this).css('background-color', "white").css('color','#333');
	});
});
</script>	
</body>
</html>
</body>
</html>