<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOTICE View</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/bg.css">
<link rel="stylesheet" type="text/css" href="../font/fonts.css">
<script type="text/javascript">
	//commentWrite 버튼 클릭시 이동 
	$(function() {
		$(".commentWrite").click(function() {
			location.href = "/Project2/main/index.jsp?req=qnaView";
		});
	});
</script>
</head>
<body>

	<div class="example">
		<p style="text-align:right;"><a href="../main/index.jsp">HOME</a> > NOTICE</p>
		<!-- 게시판 제목이 출력될 곳 -->
		<div class="title">
			<p>NOTICE</p>
			<hr class="titleHr">
			<p>리멤버클릭 공지사항</p>
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
				<th class="hit" style="width: 250px;">HIT</th>
				<td>test</td>
			</tr>
			<tr>
				<td class="textarea" style="margin-top: 25px; margin-bottom: 25px">test</td>
			</tr>
		</table>
		<div class="btnArea">
			<a id="link" href="#"><span class="buttonList">목록</span></a>
			<!-- 관리자 권한 있는 상태 -->
			<a id="link" href="#"><span class="buttonDelete">삭제</span></a> 
			<a id="link" href="#"><span class="buttonModify">수정</span></a>
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