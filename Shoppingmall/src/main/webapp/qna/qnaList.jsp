<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA List</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="../font/fonts.css">
<link rel="stylesheet" type="text/css" href="../css/bg.css">
<script type="text/javascript">
	//subject 버튼 클릭시 이동 
	$(function(){
		$(".qnaSubject").click(function(){
			location.href="/Project2/main/index.jsp?req=qnaView";
		});
		
		$(".noticeWrite").click(function(){
			location.href="/Project2/main/index.jsp?req=qnaWriteForm";
		});
		
	});
</script>
</head>
<body>
	<div class="example">
		<p style="text-align:right;"><a href="../main/index.jsp">HOME</a> > Q & A</p>
			<!-- 게시판 제목이 출력될 곳 -->
		<div class="board_title">
			<p>Q & A</p>
			<hr class="titleHr">
			<p>궁금한점이 생기셨나요? 무엇이든 물어보세요. 빠르고 친절한 답변 드리겠습니다.</p>
		</div>
		<table class="board_table">
				<tr class="boardList">
					<th class="no" style="width:10%">NO</th>
					<th class="item" style="width:10%">ITEM</th>
					<th class="subject" style="width:60%">SUBJECT</th>
					<th class="name" style="width:10%">NAME</th>
					<th class="date" style="width:10%">DATE</th>
				</tr>
				<!-- 목록이 출력될 곳 -->
				<tr class="boardResult">
					<td class="no" style="width:10%">NO</td>
					<td class="item" style="width:10%">ITEM</td>
					<td class="subject" style="width:60%"><a href="#"><span class="qnaSubject">SUBJECT</span></a></td>
					<td class="name" style="width:10%">NAME</td>
					<td class="date" style="width:10%">DATE</td>
				</tr>
		</table>
		
		<!-- 로그인 상태 권한  -->
		<div class="btnArea ">
				<a id="link" href="#none"><span class="qnaWrite" id="qnaWrite">글쓰기</span></a>
       	</div>
	</div>
</body>
</html>