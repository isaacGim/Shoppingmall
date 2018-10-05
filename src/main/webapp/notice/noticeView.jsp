<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		// 이전 글
		$(".prev").click(function() {
			var num = ${prevNoticeDTO.notice_num };
			location.href = "/Shoppingmall/notice/noticeView?no="+ num +"&pg=1";
		});
		// 다음 글
		$(".next").click(function() {
			var num = ${nextNoticeDTO.notice_num };
			location.href = "/Shoppingmall/notice/noticeView?no="+ num +"&pg=1";
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
				<td>${noticeDTO.notice_subject }</td>
			</tr>
			<tr>
				<th class="name" style="width: 250px;">NAME</th>
				<td>${noticeDTO.notice_writer }</td>
			</tr>
			<tr>
				<th class="date" style="width: 250px;">DATE</th>
				<td>${noticeDTO.notice_date }</td>
			</tr>
			<tr>
				<th class="hit" style="width: 250px;">HIT</th>
				<td>${noticeDTO.notice_hit }</td>
			</tr>
			<tr>
				<td class="textarea" style="margin-top: 25px; margin-bottom: 25px">
				${noticeDTO.notice_content }
				</td>
			</tr>
		</table>
		<div class="btnArea">
			<a id="link" href="/Shoppingmall/notice/noticeList?pg=1"><span class="buttonList">목록</span></a>
			<!-- 관리자 권한 있는 상태 -->
			<a id="link" href="#"><span class="buttonDelete">삭제</span></a> 
			<a id="link" href="#"><span class="buttonModify">수정</span></a>
		</div>
		
		<div class="movement">
			<ul>
				<c:if test="${prevNoticeDTO.notice_subject != null }">
					<li class="prev"><strong>이전글</strong>
					<a href="#none">${prevNoticeDTO.notice_subject }</a></li>
				</c:if>
				
				<c:if test="${nextNoticeDTO.notice_subject != null }">
					<li class="next"><strong>다음글</strong>
					<a class="next">${nextNoticeDTO.notice_subject}</a></li>
				</c:if>
				
			</ul>
		</div>
	</div>

</body>
</html>