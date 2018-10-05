<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REVIEW View</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/bg.css">
<link rel="stylesheet" type="text/css" href="../font/fonts.css">
<script type="text/javascript">
//commentWrite 버튼 클릭시 이동 
$(function(){
	$(".commentWrite").click(function(){
		location.href="/Project2/main/index.jsp?req=qnaView";
	});
});

</script>
</head>
<body>

	<div class="example">
		<p style="text-align:right;"><a href="../main/index.jsp">HOME</a> > REVIEW</p>
		<!-- 게시판 제목이 출력될 곳 -->
		<div class="title">
			<p>REVIEW</p>
			<hr class="titleHr">
			<p>궁금한점이 생기셨나요? 무엇이든 물어보세요. 빠르고 친절한 답변 드리겠습니다.</p>
		</div>
		
		<table class="board_table">
			<tr>
				<th class="subject" style="width: 250px;">SUBJECT</th>
				<td>test</td>
			</tr>
			<tr>
				<th class="name" style="width: 250px;">NAME</th>
				<td>test</td>
			</tr>
			<tr>
				<th class="date" style="width: 250px;">DATE</th>
				<td>test</td>
			</tr>
			<tr>
				<td class="textarea" style="margin-top: 25px; margin-bottom: 25px">test</td>
			</tr>
			<tr>
				<th class="password" style="width: 250px;">PASSWORD</th>
				<td><input type="password" id="password" name="password"><img alt="" src="../image/ico_warning.gif">삭제하려면 비밀번호를 입력하세요.</td>
			</tr>
		</table>
		
		<div class="btnArea">
			<a id="link" href="#"><span class="buttonList">목록</span></a> 
			<a id="link" href="#"><span class="buttonDelete">삭제</span></a> 
			<a id="link" href="#"><span class="buttonModify">수정</span></a>
		</div>
		
		<!--  댓글 쓰기  FORM 권한 있을시-->
		<form id="commentWriteForm" name="" action="" method="get">
			<div class="comment">
				<fieldset>
					<legend style="display: none;">댓글 입력</legend>
					<p>
						<strong>댓글달기</strong><br>
						<!-- 로그인 상태 이름   -->
						이름 : <input id="comment_name" name="comment_name" placeholder="" value="" type="text" />
						비밀번호 : <input id="comment_password" name="comment_password" value="" type="password" />
					</p>
					<div class="view" style="margin: 0 auto;">
						<textarea id="comment" name="comment" style="width:1400px; height:50px;"></textarea>
						<a href="#none" class="submit"><span class="commentWrite" style="background: #000000; padding: 10px; border: 1px solid; color: #ffffff; width:70px; height: 50px;">확인</span></a>
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
			<ul>
				<li class="prev"><strong>이전글</strong>
				<a href="">test</a></li>
				<li class="next "><strong>다음글</strong>
				<a href="">test</a></li>
			</ul>
		</div>
		
	</div>

</body>
</html>