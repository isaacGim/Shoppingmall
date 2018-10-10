<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../font/fonts.css">
<link rel="stylesheet" type="text/css" href="../css/board.css">

<script type="text/javascript">
	$(function() {
		// 글쓰기 화면
		$("#qnaWrite").click(function() {
			location.href="/Shoppingmall/qna/qnaWriteForm";
		});
		
		// 글 상세보기 화면
		$(".qnaSubject").click(function() {
			var no = $(this).parents("tr.boardResult").find(".no").text();
			location.href="/Shoppingmall/qna/qnaView?no="+ no + "&pg=" + ${pg};
		});
	});
</script>
</head>
<body>
<div class="example">
		<p style="text-align:right;"><a href="../main/index">HOME</a> > Q & A</p>
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
				<c:forEach var="board_qnaDTO" items="${list}">
					<tr class="boardResult" >
						<td class="no" style="width:10%; margin-top: 23px;" >${board_qnaDTO.board_qna_num}</td>
						<td class="item" style="width:10%;"></td> <!-- <img src="../storage/${board_qnaDTO.board_qna_img }" width="50" height="50"> -->
						<td class="subject" style="width:60%; margin-top: 23px;"><a href="#none"><span class="qnaSubject">${board_qnaDTO.board_qna_subject }</span></a></td>
						<td class="name" style="width:10%; margin-top: 23px;">${board_qnaDTO.board_qna_writer}</td>
						<td class="date" style="width:10%; margin-top: 23px;">${board_qnaDTO.board_qna_date}</td>
					</tr>
				</c:forEach>
		</table>
		
		<!-- 로그인 상태 권한  --> 
		<div class="btnArea ">
			<a id="link" href="#none"><span class="qnaWrite" id="qnaWrite">글쓰기</span></a>
       	</div>
       	
       	<!-- paging -->
		<div id="pageList">
		<c:if test="${pg > 5 }">
			[<a class="paging" href="/Shoppingmall/qna/qnaList?pg=${startPage - 1 }">이전</a>]
		</c:if>
		
		<c:forEach var="a" begin="${startPage }" end="${endPage }" step="1">
			<c:if test="${a == pg}">
				[<a class="currentPaging" href="/Shoppingmall/qna/qnaList?pg=${a}">${a}</a>]
			</c:if>
			<c:if test="${a != pg}">
				[<a class="paging" href="/Shoppingmall/qna/qnaList?pg=${a}">${a}</a>]
			</c:if>	
		</c:forEach>
		
		<c:if test="${endPage < totalPage }">
			[<a class="paging" href="/Shoppingmall/qna/qnaList?pg=${startPage + 1 }">다음</a>]
		</c:if>
		</div>
	</div>
</body>
</html>