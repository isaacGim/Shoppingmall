<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/bg.css">
<link rel="stylesheet" type="text/css" href="../font/fonts.css">
<script type="text/javascript">
//subject 버튼 클릭시 이동 
	$(function(){
		$(".reviewSubject").click(function(){
			location.href="/Project2/main/index.jsp?req=reviewView";
		});
		$(".reviewWrite").click(function(){
			location.href="/Project2/main/index.jsp?req=reviewWriteForm";
		});
	});
</script>
</head>
<body>
	<div class="example">
		<p style="text-align:right;"><a href="../main/index.jsp">HOME</a> > REVIEW</p>
		<!-- 게시판 제목이 출력될 곳 -->
		<div class="board_title">
			<p>REVIEW</p>
			<hr class="titleHr">
			<p>상품후기를 올려주세요, 한건당 500원씩 적립해드립니다.(구매후 한달이내 작성글에한함)</p>
		</div>
		<table class="board_table">
				<tr class="boardList">
					<th class="no" style="width: 5%">NO</th>
					<th class="item" style="width: 8%">ITEM</th>
					<th class="subject" style="width: 60%">SUBJECT</th>
					<th class="name" style="width: 5%">NAME</th>
					<th class="date" style="width: 7%">DATE</th>
					<th class="like" style="width: 7%">LIKE</th>
					<th class="grade" style="width: 8%">GRADE</th>
				</tr>
				<!-- 목록이 출력될 곳 -->
				<tr class="boardResult">
					<td class="no" style="width: 5%">test</td>
					<td class="item" style="width: 8%">test</td>
					<td class="subject" style="width: 60%"><a href="#"><span class="reviewSubject">test</span></a></td>
					<td class="name" style="width: 5%">test</td>
					<td class="date" style="width: 7%">test</td>
					<td class="like" style="width: 7%">test</td>
					<td class="grade" style="width: 8%">test</td>
				</tr>
		</table>
		<!-- 로그인 하여 권한 있을시 -->
		<div class="btnArea ">
			<a id="link" href="#none"><span class="reviewWrite" id="reviewWrite">글쓰기</span></a>
	    </div>
			
	</div>
</body>
</html>