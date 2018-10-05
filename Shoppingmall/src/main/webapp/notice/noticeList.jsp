<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice list</title>
<link rel="stylesheet" type="text/css" href="../css/bg.css">
<link rel="stylesheet" type="text/css" href="../font/fonts.css">
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	//subject 버튼 클릭시 이동 
	$(function(){
		$(".noticeSubject").click(function(){
			var notice_num = $(this).parents('tr').find(".no").text();
			location.href="/Shoppingmall/notice/noticeView?no="+notice_num +"&pg=1";
		});
		
		$(".noticeWrite").click(function(){
			location.href="/Shoppingmall/notice/noticeWriteForm";
		});
	});
</script>
</head>
<body>
	<div class="example">
		<p style="text-align:right;"><a href="../main/index.jsp">HOME</a> > NOTICE</p>
			<!-- 게시판 제목이 출력될 곳 -->
		<div class="board_title">
			<p>NOTICE</p>
			<hr class="titleHr">
			<p>리멤버클릭 공지사항</p>
		</div>
		<table class="board_table">
				<tr class="boardList">
					<th class="no" style="width:10%">NO</th>
					<th class="subject" style="width:60%">SUBJECT</th>
					<th class="name" style="width:10%">NAME</th>
					<th class="date" style="width:10%">DATE</th>
					<th class="hit" style="width:10%">HIT</th>
				</tr>
				<!-- 목록이 출력될 곳 -->
			<c:forEach var="noticeDTO" items="${list }">
				<tr class="boardResult">
					<td class="no" style="width:10%">${noticeDTO.notice_num }</td>
					<td class="subject" style="width:60%"><a href="#"><span class="noticeSubject">${noticeDTO.notice_subject }</span></a></td>
					<td class="name" style="width:10%">${noticeDTO.notice_writer }</td>
					<td class="date" style="width:10%">${noticeDTO.notice_date }</td>
					<td class="hit" style="width:10%">${noticeDTO.notice_hit }</td>
				</tr>
			</c:forEach>
		</table>
		
		<!-- 관리자 계정으로 로그인 했을때만   -->
		<div class="btnArea ">
			<c:if test="${sessionScope.member_id == 'hong'}">
				<a id="link" href="#none"><span class="noticeWrite" id="noticeWrite">글쓰기</span></a>
       		</c:if>
       	</div>
       	
       	
		<!-- paging -->
		<div id="pageList">
			<c:if test="${pg > 5 }">
				[<a class="paging" href="/Shoppingmall/notice/noticeList?pg=${startPage - 1 }">이전</a>]
			</c:if>
			
			<c:forEach var="a" begin="${startPage }" end="${endPage }" step="1">
				<c:if test="${a == pg}">
					[<a class="currentPaging" href="/Shoppingmall/notice/noticeList?pg=${a}">${a}</a>]
				</c:if>
				<c:if test="${a != pg}">
					[<a class="paging" href="/Shoppingmall/notice/noticeList?pg=${a}">${a}</a>]
				</c:if>	
			</c:forEach>
			
			<c:if test="${endPage < totalPage }">
				[<a class="paging" href="/Shoppingmall/notice/noticeList?pg=${startPage + 1 }">다음</a>]
			</c:if>
		</div>
</div>
    	
       	

</body>
</html>