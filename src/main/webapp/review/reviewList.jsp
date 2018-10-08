<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../font/fonts.css">
<link rel="stylesheet" type="text/css" href="../css/board.css">
<script type="text/javascript">
//subject 버튼 클릭시 이동 
	$(function(){
		$(".reviewSubject").click(function(){
			var review_num = $(this).parents('tr').find(".no").text();
			location.href="/Shoppingmall/review/reviewView?no="+review_num+"&pg="+${pg};
		});
		$(".reviewWrite").click(function(){
			location.href="/Shoppingmall/review/reviewWriteForm";
		});
		
		$('td.grade').each(function(index, item) {
			var star_index = $(this).text();
			$(this).empty();
			$(this).append('<img src=../image/ico_point' + star_index + '.png>');
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
				<c:forEach var="reviewDTO" items="${list }">
					<tr class="boardResult">
						<td class="no" style="width: 5%">${reviewDTO.review_num }</td>
						<td class="item" style="width: 8%">등록되어있는 이미지</td>
						<td class="subject" style="width: 60%"><a href="#none"><span class="reviewSubject">${reviewDTO.review_subject }</span></a></td>
						<td class="name" style="width: 5%">${reviewDTO.review_writer }</td>
						<td class="date" style="width: 7%">${reviewDTO.review_date }</td>
						<td class="like" style="width: 7%">${reviewDTO.review_like }</td>
						<td class="grade" style="width: 8%">${reviewDTO.review_grade }</td>
					</tr>
				</c:forEach>
		</table>
		<!-- 로그인 하여 권한 있을시 -->
		<div class="btnArea ">
			<a id="link" href="#none"><span class="reviewWrite" id="reviewWrite">글쓰기</span></a>
	    </div>
	    
	    <!-- paging -->
		<div id="pageList">
			<c:if test="${pg > 5 }">
				[<a class="paging" href="/Shoppingmall/review/reviewList?pg=${startPage - 1 }">이전</a>]
			</c:if>
			
			<c:forEach var="a" begin="${startPage }" end="${endPage }" step="1">
				<c:if test="${a == pg}">
					[<a class="currentPaging" href="/Shoppingmall/review/reviewList?pg=${a}">${a}</a>]
				</c:if>
				<c:if test="${a != pg}">
					[<a class="paging" href="/Shoppingmall/review/reviewList?pg=${a}">${a}</a>]
				</c:if>	
			</c:forEach>
			
			<c:if test="${endPage < totalPage }">
				[<a class="paging" href="/Shoppingmall/review/reviewList?pg=${startPage + 1 }">다음</a>]
			</c:if>
		</div>
			
	</div>
</body>
</html>