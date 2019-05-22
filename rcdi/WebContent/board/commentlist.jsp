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
	<c:if test="${replyList.size() == 0 }">							
		<!-- 댓글이 없을 때 디자인 -->
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
	<div class="comment_list_wrap each_space">
		<div class="top_comment"> 
			<i class="fas fa-comment-dots"></i>
			<span class="comment_cnt">${replyList.size()}</span>
			<span>Comments</span>
		</div>
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
							<a href="${path}/replyDelete.rcdi" class="comment_delete_btn" data_num="${replyview.rno}">삭제</a>
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
</body>
</html>