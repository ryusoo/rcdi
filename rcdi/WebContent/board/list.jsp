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
.post_array a {
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
	cursor: pointer;
}
/* 게시글 영역 */
table {
	border-collapse: collapse;
	width: 100%;
	box-sizing: border-box;
}
th, td {
	text-align: center;
	height: 30px;
	line-height: 30px;
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
	box-sizing: border-box;
	height: auto;
}
.like i {
	color: red;
}
.new_time {
	background-color: white;/* #FF8224 */
	border: 1px solid red;
	font-size: 11px;
	color: red;
	/* border-radius: 25px; */
	padding: 1px 3px;
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
.idx, .hit, .attach {
	width: 60px;
}
.tb_title {
	width: 280px;
}
.writer, .like {
	width: 80px;
}
.date {
	width: 120px;
}
.search_result {
	float: right;
	font-weight: bold;
	color: #333;
	margin: 10px;
	margin-right: 30px;
}
.search_span {
	color: tomato;
}

/* 검색영역 */
.srch_group {
	width: 323px;
	background: #ffffff;
	height: 56px;
	display: flex;
	margin: 55px auto 0;
	border-radius: 5px;
}
select {
	border: 0;
	outline: 0;
}
.slt_box {
	box-sizing: border-box;
	display: inline-block;
	margin-right: 3px;
}
.slt_style {
	width: 110px;
	height: 30px;
	border: 1px solid #dadada;
	background: #ffffff;
}
.ipt_box {
	height: 50px;
}
.ipt_style {
	height: 30px;
	outline: none;
	border: 1px solid #dadada;
}
.icon_srch {
	width : auto;
	height: 56px;
	display: inline-block;
	margin-right: 15px;
	cursor: pointer;
}

/* pagination */
.pagination {
	text-align: center;
	width: 100%;
	height: 50px;
}
.pagination_flex {
	width: 500px;
	margin: 0 auto;
	text-align: center;
	height: 50px;
	display: flex;
	justify-content: center;
	align-items: center;
}
.pagination_flex li {
	float:left;
}
.pagination a {
	border: 1px solid #333;
	display: inline-block;
	width: 30px;
	height: 30px;
	line-height: 29px;
	border-radius: 5px;
	margin-right: 3px;
}
.pagination i {
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
			<!-- 제목과 게시글 정렬 영역 -->
			<div class="top_group">
				<h3 class="tit">질문 게시판</h3>
				<div class="post_array">
					<!-- sort_type: 최신순 new(default), 추천순 good, 댓글순 reply, 조회순 view // 주로 a 태그를 사용해서 만든다 -->
					<span class="array1"><a href="${path}/boardList.rcdi?sort_type=new&keyword=${keyword}&search_option=${search_option}" id="orderNew">최신순</a></span>
					<span class="array1"><a href="${path}/boardList.rcdi?sort_type=good&keyword=${keyword}&search_option=${search_option}" id="orderGood">추천순</a></span>
					<span class="array1"><a href="${path}/boardList.rcdi?sort_type=reply&keyword=${keyword}&search_option=${search_option}" id="orderReply">댓글순</a></span>
					<span class="array1"><a href="${path}/boardList.rcdi?sort_type=view&keyword=${keyword}&search_option=${search_option}" id="orderCnt">조회순</a></span>
				</div>
				<button class="btn btn_up" id="boardAdd">게시글 등록</button>
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
						<%-- ${list}에 리스트가 담겨있는데 var=bDto에 한건씩 넣어서 forEach로 해서 리스트를 하나씩 목록을 뽑는다 반복하면서 --%>
						<!-- 제어문과 포맷팅은 jstl태그, 변수담는 것은 el태그 혼용해서 같이 사용하고 있다 -->
						<c:forEach items="${list}" var="bDto">
							<!-- 현재시간 구하기 now에 현재 시간을 시분초로 나타내준다. now는 방금가져온 값을 년월일 형식으로 바꿔서 today변수에 담음.-->
							<jsp:useBean id="now" class="java.util.Date"/>
							<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
							<fmt:formatDate value="${bDto.regdate}" pattern="yyyy-MM-dd" var="regdate" />
							<tr>
								<td class="idx">${bDto.bno}</td>
								<td class="obj">
									<a href="${path}/boardView.rcdi?bno=${bDto.bno}">${bDto.title}</a>
								<c:if test="${bDto.replycnt > 0}">
									<span class="replyCnt_Color">(${bDto.replycnt})</span>
								</c:if>
								<!-- if 단건으로 쓸 때, choose는 이거아니면 저거 이렇게 여러조건일 때 사용한다 --> 
								<c:if test="${today == regdate }">
									<span class="new_time">N</span>
								</c:if>
								</td>
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
								<td class="like"><i class="fas fa-heart"></i><span> ${bDto.goodcnt}</span></td>
								<td class="hit">${bDto.viewcnt}</td>
								<td class="attach">
								<c:if test="${bDto.filesize > 0}">
									<i class="far fa-file-alt"></i>
								</c:if>
								</td>
							</tr>
						</c:forEach>
						  <%-- value="${bDto.regdate} => 이 형식으로 뜨게 해준다. 년월일, 시분초pattern="yyyy-MM-dd hh:mm:ss" --%>
					</tbody>
				</table>
			</div>
			
			
			<c:if test="${!empty keyword}">			
				<div class="search_result">
					<span class="search_span">"${keyword}"</span>로 검색한 결과는 총
					<span class="search_span">${totalCount}</span>건입니다.
					</div>
			</c:if>
			
			
			<!-- 검색영역 -->
			<div class="srch_group">
				<div class="slt_box">
					<select name="srch_key" class="slt_style" id="selsearch">
						<div class="chevron-down"><i class="fas fa-chevron-down"></i></div>
						<option value="1" selected="selected">제목+내용</option>
						<option value="2">제목</option>
						<option value="3">내용</option>
						<option value="4">작성자</option>
					</select>
				</div>
				<div class="ipt_box">
					<input type="text" id="srchWord" name="srchWord" class="ipt ipt_style" placeholder="검색어를 입력해 주세요.">
					<div class="icon_srch" id="search_btn_icon"><i class="fas fa-search"></i></div>
					<button class="search_btn" id="search_btn" style="display: none;">검색</button>
				</div>
			</div>
			<!-- 페이지 네이션 -->
			
			<div class="pagination">
				<ul class="pagination_flex">
					<c:if test="${pageMaker.prev}">
						<li>
							<a href="boardList.rcdi?page=${pageMaker.criDto.page -5}&sort_type=${sort_type}&keyword=${keyword}&search_option=${search_option}">&laquo;</a>
						</li>
						<li>
							<a href="${path}/boardList.rcdi?page=1&sort_type=${sort_type}&keyword=${keyword}&search_option=${search_option}">1</a>
						</li>
						<li>
							<a>...</a>
						</li>
					</c:if>
					
					<!-- idx는 for문의 i++같음 -->
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					<!-- syso = c:out 출력문 -->
						<li <c:out value="${pageMaker.criDto.page == idx ? 'id=active':'' }"/>>
							<a href="${path}/boardList.rcdi?page=${idx}&sort_type=${sort_type}&keyword=${keyword}&search_option=${search_option}">${idx}</a>
						</li>
					</c:forEach>
					
					
					<c:if test="${pageMaker.next}">
						<li>
							<a>...</a>
						</li>
						<li>
							<a href="${path}/boardList.rcdi?page=${pageMaker.finalPage}&sort_type=${sort_type}&keyword=${keyword}&search_option=${search_option}">${pageMaker.finalPage}</a>
						</li>
						<li>
							<a href="${path}/boardList.rcdi?page=${pageMaker.criDto.page +5}&sort_type=${sort_type}&keyword=${keyword}&search_option=${search_option}">&raquo;</a>
						</li>
					</c:if>
				</ul>
			</div>
			
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){	
	var sort_type = "${sort_type}";
	if(sort_type =="new"){
		$('#orderNew').css('color', 'white').css('font-weight', 'bold').css('background-color', '#333');
	} else if(sort_type == "good"){
		$('#orderGood').css('color', 'white').css('font-weight', 'bold').css('background-color', '#333');
	} else if(sort_type == "reply"){
		$('#orderReply').css('color', 'white').css('font-weight', 'bold').css('background-color', '#333');
	} else if(sort_type == "view"){
		$('#orderCnt').css('color', 'white').css('font-weight', 'bold').css('background-color', '#333');
	}
	
	$('#search_btn_icon').click(function(){
		$('#search_btn').click();
	});
	
	
	
	
	$('#search_btn').click(function(){
		var search_option = $('#selsearch').val();
		var keyword = $.trim($('#srchWord').val());
		// alert(search_option + ", "+ keyword);
		if(keyword == null || keyword.length == 0){
			$('#srchWord').focus();
			$('#srchWord').css('border-bottom', '1px solid rgb(231, 29, 54)');
			return false;
		}
		// alert('location');
		location.href="${path}/boardList.rcdi?search_option="+search_option+"&keyword="+keyword;
	});
	
	/* $('.array1').click(function(){
		$('.array1').css('background-color', "white").css('color', '#333');
		$(this).css('background-color', "#333").css('color','white');
	});	 */
	
	// 게시글 등록 버튼 클릭시 이벤트 처리
	$("#boardAdd").on("click", function(){
		$.ajax({
			type:"post",
			dataType: "json",
			url: "registerAjax.rcdi",
			success: function(data){
				if(data.message == "login"){
					location.href = "registerView.rcdi";
				} else if(data.message == "nologin") {
					$('#wrap').css('display', 'flex');
					$('#login_id').focus();
					$('.err_msg').text('로그인이 필요한 시스템입니다.').css('display', 'block');
				}				
			}
		});
	});
	
});
</script>	
</body>
</html>
</body>
</html>