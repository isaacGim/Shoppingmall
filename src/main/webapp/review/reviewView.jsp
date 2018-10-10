<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REVIEW View</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="../font/fonts.css">
<link rel="stylesheet" type="text/css" href="../css/board.css">
<script type="text/javascript">
//commentWrite 버튼 클릭시 이동 
$(function(){
	$(".prev").click(function() {
		var prevNum = ${reviewDTO.prev_review_seq };
		location.href = "/Shoppingmall/review/reviewView?no="+ prevNum +"&pg="+${pg};
	});
	
	$(".next").click(function() {
		var nextNum = ${reviewDTO.next_review_seq };
		location.href = "/Shoppingmall/review/reviewView?no="+ nextNum +"&pg="+${pg};
	});
	
	$(".buttonList").click(function() {
		location.href = "/Shoppingmall/review/reviewList?&pg="+${pg};
	});
	
	$(".buttonDelete").click(function() {
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			location.href = "/Shoppingmall/review/reviewDelete?no="+${reviewDTO.review_num}+"&pg="+${pg};
		}else{   //취소
		    return;
		}
	});
	
	$(".buttonModify").click(function() {
		location.href = "/Shoppingmall/review/reviewModifyForm?no="+${reviewDTO.review_num}+"&pg="+${pg};
	});
	
	$(".commentWrite").click(function() {
		$(".comment_form").submit();
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
			<p>궁금한점이 생기셨나요? 무엇이든 물어보세요. 빠르고 친절한 답변 드리겠습니다.</p>
		</div>
		
		<table class="board_table">
			<tr>
				<th class="subject" style="width: 250px;">SUBJECT</th>
				<td>${reviewDTO.review_subject }</td>
			</tr>
			<tr>
				<th class="name" style="width: 250px;">NAME</th>
				<td>${reviewDTO.review_writer }</td>
			</tr>
			<tr>
				<th class="date" style="width: 250px;">DATE</th>
				<td>${reviewDTO.review_date }</td>
			</tr>
			<tr>
				<td class="textarea" style="margin-top: 25px; margin-bottom: 25px">${reviewDTO.review_content }
				<img src="../storage/${reviewDTO.review_img }" alt=""/></td>
			</tr>
			<tr>
				<th class="password" style="width: 250px;">PASSWORD</th>
				<td><input type="password" id="password" name="password"><img alt="" src="../image/ico_warning.gif">삭제하려면 비밀번호를 입력하세요.</td>
			</tr>
		</table>
		
		<div class="btnArea">
			<a id="link" href="#none"><span class="buttonList">목록</span></a> 
			<a id="link" href="#none"><span class="buttonDelete">삭제</span></a> 
			<a id="link" href="#none"><span class="buttonModify">수정</span></a>
		</div>
		
	<div id="container">
		<ul id="comment_list">
		<!-- 여기에 동적 생성 요소가 들어가게 됩니다. -->
		</ul>
		<%-- <c:if test="${sessionScope.member_id != null}"> --%>
			<!--  댓글 쓰기  FORM 권한 있을시-->
		<div class="comment_write">
				<form id="comment_form" name="comment_form" action="" method="get">
						<div>
							<strong>댓글달기</strong><br>
							<label for="comment_name">이름 : </label><input id="user_name" name="user_name" placeholder="" value="" type="text" />
							<label for="comment_password">비밀번호 : </label><input id="comment_password" name="comment_password" value="" type="password" />
						</div>
						<div class="view" style="margin: 0 auto; padding: 0;">
							<textarea id="comment" name="comment" style="width:1100px; height:50px;"></textarea>
							<input type="submit" value="확인" class="commentWrite" style="background: #000000; padding: 10px; border: 1px solid; color: #ffffff; width:70px; height: 50px;">
						</div>
				</form> 
		</div>
		</div>
		
		<!-- 권한 없을시 -->
		<!-- 댓글권한 없음 -->
		<c:if test="${sessionScope.member_id == null}">
			<div class="displaynone">
				<p>회원 에게만 댓글 작성 권한이 있습니다.</p>
			</div>
		</c:if>

		<div class="movement">
			<ul>
				<c:if test="${reviewDTO.prev_review_subject != null }">
					<li class="prev"><strong>이전글</strong>
					<a href="#none">${reviewDTO.prev_review_subject }</a></li>
				</c:if>
				<c:if test="${reviewDTO.next_review_subject != null }">
					<li class="next"><strong>다음글</strong>
					<a href="#none">${reviewDTO.next_review_subject }</a></li>
				</c:if>
			</ul>
		</div>
		
	</div>

</body>
</html>