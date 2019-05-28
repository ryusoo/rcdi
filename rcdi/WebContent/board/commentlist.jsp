<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 댓글 리스트 영역 -->
	<!-- 댓글이 없을 때 디자인 -->
	<c:if test="${replyList.size() == 0 }">							
		<div class="noncomment_list_wrap each_space">
			<div class="top_comment"> 
				<i class="far fa-comment"></i>
				<span class="comment_cnt">${replyList.size()}</span>
				<span>Comments</span>
			</div>
		</div>
		<div class="empty_box">
			등록된 댓글이 없습니다. 첫번째 댓글을 남겨주세요:)
		</div>
	</c:if>
	
	
	<!-- 댓글이 있을 때 디자인 -->
	<!-- forEach에서 목록을 띄움 item안의 list에 값이 없으면 아예 실행을 안함 item안에 들어온 건수만큼 반복을 시켜라라는 뜻이기 때문이다. 범위를 주고싶으면 begin, end를 사용하면 된다-->
	
		<div class="comment_list_wrap each_space">
			<c:if test="${replyList.size() > 0}">
				<div class="top_comment"> 
					<i class="fas fa-comment-dots"></i>
					<span class="comment_cnt">${replyList.size()}</span>
					<span>Comments</span>
				</div>
			</c:if>
			<c:forEach items="${replyList}" var="replyview">
				<div class="comment_box">
					<div class="writer_comment">
						<div class="comment_head">
							<span>${replyview.writer}</span>
							<div class="reg_date">
								<i class="far fa-clock"></i>
								<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${replyview.regdate}" />
							</div>
							<c:if test="${sessionScope.loginUser.id == replyview.writer}">
								<a class="comment_delete_btn reply_del" data_num="${replyview.rno}">삭제</a>
							</c:if>
						</div>
						<div class="comment_body">
							${replyview.content}
						</div>
					</div>					
				</div>
			</c:forEach>
		</div>
	
	
	<!-- 비로그인 시, 로그인 시 댓글 작성 영역-->
	<!--비로그인 시 로그인 하라는 경고창 -->
	<c:choose>
		<c:when test="${empty sessionScope.loginUser}">
			<div class="writing_logout_wrap each_space">
				<div class="top_comment"> 
					<i class="fas fa-pencil-alt"></i>				
					<span>로그인이 필요합니다</span>
				</div>						
				<div class="empty_box">
					<span id="login_txt">로그인</span>을 하시면 댓글을 등록할 수 있습니다.
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<form action="replyAdd.rcdi" method="POST" name="frm_reply" id="frm_reply">
				<div class="writing_logout_wrap each_space">
					<div class="top_comment"> 
						<i class="fas fa-pencil-alt"></i>				
						<span>댓글 쓰기</span>
					</div>						
					<div class="writing_box">
						<div class="writer_top">
							<span id="writer">작성자: </span><span id="user">${sessionScope.loginUser.id}</span>
						</div>				
						<textarea id="replyInsert" name="re_textarea" class="writing_area"></textarea>
						<script type="text/javascript">
							var oEditors = [];
							nhn.husky.EZCreator.createInIFrame({
							 oAppRef: oEditors,
							 elPlaceHolder: "replyInsert",
							 sSkinURI: "<%=request.getContextPath()%>/smarteditor/SmartEditor2Skin.html",
							 fCreator: "createSEditor2"
							});
						</script>
					</div>
					<span id="txt_box" >내용을 입력해 주세요</span>
					<button type="button" id="reply_btn" class="btn_comment">댓글 등록</button>
					
					<!-- input태그 안에 써서 작성자와 게시글번호를 form태그 안으로 보내는 것이다 -->
					<input type="hidden" name="re_writer" value="${sessionScope.loginUser.id}">
					<input type="hidden" id="re_bno" name="re_bno">
				</div>
			</form>
		</c:otherwise>
	</c:choose>	
</body>
</html>