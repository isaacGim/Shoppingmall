<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA View</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/bg.css">
<link rel="stylesheet" type="text/css" href="../font/fonts.css">
<style type="text/css">
.replyBox {
	width: 760px;
	height: 50px;
	margin: 0 auto;
	border: 1px solid black;
}
.replyWriter {
	text-align: left;
	float: left;
	margin-bottom: 10px;
}
.replyButtonBox {
	text-align: right;
}
.reply {
	text-align: left;
}
.space {
	clear:both;
	padding-left: 10px;
}
</style>
<script type="text/javascript">
//commentWrite 버튼 클릭시 이동 
$(function(){
	// 댓글 등록
	$(".commentWrite").click(function(){
		$("#commentWriteForm").submit();
	});
	
	// 게시글 삭제 버튼
	$(".buttonDelete").click(function(){
		var taken_pwd = ${board_qnaDTO.board_qna_pwd};
		var input_pwd = $('#password').val();
		
		if(taken_pwd != input_pwd) alert('비밀번호가 맞지 않습니다.');
		else location.href='/Shoppingmall/qna/qnaDelete?pg=' + ${pg} + '&num=' + ${board_qnaDTO.board_qna_num};
	});
	
	// 게시글 목록으로 이동
	$(".buttonList").click(function() {
		location.href="/Shoppingmall/qna/qnaList?pg="+${pg} ;
	});
	
	// 이전 글
	/*	
 	$(".prev").click(function() {
		var no = ${prevBoard_qnaDTO.board_qna_num };
		location.href = "/Shoppingmall/qna/qnaView?no="+ no +"&pg="+ ${pg};
	});  
	*/
	// 다음 글
	/*
	$(".next").click(function() {
		var no = ${nextBoard_qnaDTO.board_qna_num };
		location.href = "/Shoppingmall/qna/qnaView?no="+ no +"&pg="+ ${pg};
	});
	*/
	
	
	$('.replyWindow').hide();
	$('.replyButton').click(function() {
		$(this).parents('#format').find('.replyWindow').toggle();
	});
	
	// 대댓글등록
	$('#replyForm').on('click', '.rere_btn', function() {
		$('.rere_btn').submit();
	});
}); 


</script>
</head>
<body>

	<div class="example">
		<p style="text-align:right;"><a href="../main/index.jsp">HOME</a> > Q & A</p>
		<!-- 게시판 제목이 출력될 곳 -->
		<div class="title">
			<p>Q & A</p>
			<hr class="titleHr">
			<p>궁금한점이 생기셨나요? 무엇이든 물어보세요. 빠르고 친절한 답변 드리겠습니다.</p>
		</div>
		<table class="board_table">
			<tr>
				<th class="subject" style="width: 250px;">SUBJECT</th>
				<td>${board_qnaDTO.board_qna_subject}</td>
			</tr>
			<tr>
				<th class="name" style="width: 250px;">NAME</th>
				<td>${board_qnaDTO.board_qna_writer}</td>
			</tr>
			<tr>
				<th class="date" style="width: 250px;">DATE</th>
				<td>${board_qnaDTO.board_qna_date}</td>
			</tr>
			<tr>
				<td class="textarea" style="margin-top: 25px; margin-bottom: 25px">${board_qnaDTO.board_qna_content}</td>
			</tr>
			<tr>
				<th class="password" style="width: 250px;">PASSWORD</th>
				<td><input type="password" id="password" name="password"><img alt="" src="../image/ico_warning.gif">삭제하려면 비밀번호를 입력하세요.</td><span id="pwdChecker"></span>
			</tr>
		</table>
		<div class="btnArea">
			<a id="link" ><span class="buttonList">목록</span></a> 
			<a id="link" ><span class="buttonDelete">삭제</span></a> 
			<a id="link" href="#"><span class="buttonModify">수정</span></a>
		</div>
		
		<!-- 댓글 등록된 리스트 -->
				<div id="replyForm">
					<c:forEach var="board_qnaDTO" items="${list }">
						<form method="post" action="/Shoppingmall/qna/qnaComment" class="rere_Form">						
							<div id="format">
								<!-- 레벨을 참조해서 뛰어쓰기 넣어주세요!! -->		
								<div class="replyBox">
									
									<div class="replyWriter">
										<c:if test="${board_qnaDTO.board_qna_lev >= 2}">
										└─
										</c:if>
										<span>${board_qnaDTO.board_qna_writer }</span>				
									</div>
									<div class="replyButtonBox">
										<c:if test="${board_qnaDTO.board_qna_lev <= 1}">
											<span><a class="replyButton">댓글</a></span>
										</c:if>
										&nbsp;								
									</div>
									<div class="reply">
										<span>${board_qnaDTO.board_qna_content }</span>	
									</div>
								</div>	
								<div class="replyWindow">
									<textarea style="width: 700px; height: 50px; margin: 0;" class="replyTextArea" name="comment"></textarea><br>
									<input type="hidden" name="no1" value="${board_qnaDTO.board_qna_num }"> 
									<input type="hidden" name="board_qna_writer" value="${board_qnaDTO.board_qna_writer }">
									<input type="hidden" name="pg" value="${pg }">
									<input type="button" class="rere_btn" value="등록" style="width: 701px; margin: 0;">
								</div>
							</div>
						</form>
					</c:forEach>
				</div>
		<!--  댓글 쓰기  form 권한 있을시 -->
		<form id="commentWriteForm" name="commentWriteForm" action="/Shoppingmall/qna/qnaComment" method="post">
			<div class="comment">
				<fieldset>
					<legend style="display: none;">댓글 입력</legend>
					<p>
						<strong>댓글달기</strong><br>
						<!-- 로그인 상태 이름   -->
						<input id="comment_name" name="comment_name" placeholder="" value="" type="hidden" />
						<input id="comment_password" name="comment_password" value="" type="hidden" />
						<input name="board_qna_writer" value="${sessionScope.member_name }" type="hidden">
						<input name="pg" value="${pg }" type="hidden">
						<input name="no" value="${no }" type="hidden">
					</p>
					<div class="view" style="margin: 0 auto;">
						<textarea id="comment" name="comment" style="width:1400px; height:50px; resize: none;"></textarea>
						<a href="#none" class="submit"><span class="commentWrite" style="background: #000000;
						 padding: 10px; border: 1px solid; color: #ffffff; width:70px; height: 50px;">확인</span></a>
					</div>
				</fieldset>
			</div>
		</form>
		
		<!-- 권한 없을시 -->
		<!-- 댓글권한 없음 -->
		<div class="displaynone">
			<p>회원 에게만 댓글 작성 권한이 있습니다.</p>
		</div>
		
		<div class="movement">
		<!-- 
			<ul>
				<c:if test="${prevBoard_qnaDTO.board_qna_subject != null }">
					<li class="prev"><strong>이전글</strong>
					<a href="#none">${prevBoard_qnaDTO.board_qna_subject }</a></li>
				</c:if>
				
				<c:if test="${nextBoard_qnaDTO.board_qna_subject != null }">
					<li class="next"><strong>다음글</strong>
					<a>${nextBoard_qnaDTO.board_qna_subject}</a></li>
				</c:if>
			</ul>
		-->
		</div>
	</div>

</body>
</html>