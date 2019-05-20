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
li {
	list-style: none;
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
	border-radius: 20px;
	color: white;
	background-color: #333;
	border: 1px solid dimgray;
	padding: 0 10px;
	outline: none;
	font-weight: bold;
	height: 35px;
	line-height: 35px;
	font-size: 18px;
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
.new_time {
	background-color: tomato;/* #FF8224 */
	font-size: 11px;
	color:white;
	border-radius: 25px;
	padding: 2px 5px;
	animation-name: twinkle;
	animation-duration: 1.2s;
	animation-iteration-count:infinite;
}
@keyframes twinkle {
	0% {opacity: 0;}
	100% {opacity: 1;}
}
.replyCnt_Color {
	background-color: white;/* rgb(231, 29, 54) */
	font-size: 15px; /* 11px */
	color: rgb(231, 29, 54); /* white */
	border-radius: 25px;
	padding: 2px 5px;
	font-weight: bold;
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
#active a {
	background-color: #2C3E50;
	color: white;
	
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
						<c:forEach items="${list}" var="bDto">
							<!-- 현재시간 구하기 now에 현재 시간을 시분초로 나타내준다. now는 방금가져온 값을 년월일 형식으로 바꿔서 today변수에 담음.-->
							<jsp:useBean id="now" class="java.util.Date"/>
							<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
							<fmt:formatDate value="${bDto.regdate}" pattern="yyyy-MM-dd" var="regdate" />
							<tr>
								<td class="idx">${bDto.bno}</td>
								<td class="obj"><a href="#">${bDto.title}
								<c:if test="${bDto.replycnt > 0}">
									<span class="replyCnt_Color">(${bDto.replycnt})</span>
								</c:if>
								<!-- if 단건으로 쓸 때, choose는 이거아니면 저거 이렇게 여러조건일 때 사용한다 --> 
								<c:if test="${today == regdate }">
									<span class="new_time">N</span>
								</c:if>
								</a></td>
								<td class="writer">${bDto.writer}</td>
								<td class="date">
								<c:choose>
									<c:when test="${today == regdate }">
										<fmt:formatDate pattern="hh:mm:ss" value="${bDto.regdate}" />
									</c:when>
									<c:otherwise>
										<fmt:formatDate pattern="yyyy-MM-dd" value="${bDto.regdate}" />
									</c:otherwise>
								</c:choose>
								</td>
								<td class="like"><i class="fas fa-heart"></i>${bDto.goodcnt}</td>
								<td class="hit">${bDto.viewcnt}</td>
								<td class="attach"><i class="far fa-file-alt"></i></td>
							</tr>
						</c:forEach>
						  <%-- value="${bDto.regdate} => 이 형식으로 뜨게 해준다. 년월일, 시분초pattern="yyy-MM-dd hh:mm:ss" --%>
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
				<ul>
					<c:if test="${pageMaker.prev}">
						<li>
							<a href="boardList.rcdi?page=${pageMaker.startPage -1}">&laquo;</a>
						</li>
						<li>
							<a href="${path}/boardList.rcdi?page=1">1</a>
						</li>
						<li>
							<a>...</a>
						</li>
					</c:if>
					
					<!-- idx는 for문의 i++같음 -->
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					<!-- syso = c:out 출력 -->
						<li <c:out value="${pageMaker.criDto.page == idx ? 'id=active':'' }"/>>
							<a href="${path}/boardList.rcdi?page=${idx}&flag=${flag}&keyword=${keyword}&key=${code}">${idx}</a>
						</li>
					</c:forEach>
					
					
					<c:if test="${pageMaker.next}">
						<li>
							<a>...</a>
						</li>
						<li>
							<a href="${path}/boardList.rcdi?page=${pageMaker.finalPage}">${pageMaker.finalPage}</a>
						</li>
						<li>
							<a href="${path}/boardList.rcdi?page=${pageMaker.endPage +1}">&raquo;</a>
						</li>
					</c:if>
				</ul>
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