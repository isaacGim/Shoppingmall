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

/* comment------------------------------------------------------------------------------------------   */
 
 
/** 새로운 글을 화면에 추가하기 위한 함수
	 *  - num: 글 번호
	 *  - writer : 작성자 이름
	 *  - contnet : 덧글 내용
	 *  - datetime : 작성일시 */
	 function addNewItem(num, writer, content, datetime) {
		// 새로운 글이 추가될 li태그 객체
		var new_li = $("<li>");
		new_li.attr("data-num", num);
		new_li.addClass("comment_item");
		// 작성자 정보가 지정될 <p>태그
		var writer_p = $("<p>");
		writer_p.addClass("writer");
		// 작성자 정보의 이름
		var name_span = $("<span>");
		name_span.addClass("name");
		name_span.html(writer + "님");
		// 작성일시
		var date_span = $("<span>");
		date_span.html(" / " + datetime + " ")
		// 삭제하기 버튼
		var del_input = $("<input>");
		del_input.attr({"type": "button", "value": "삭제하기"});
		del_input.addClass("delete_btn");
		// 대댓글 버튼
		var comment_input = $("<input>");
		comment_input.attr({"type":"button", "value":"댓글"});
		comment_input.addClass("comment_btn");
		// 내용
		var content_p = $("<p>");
		content_p.html(content);
		// 조립하기
		writer_p.append(name_span).append(date_span).append(del_input).append(comment_input);
		new_li.append(writer_p).append(content_p);
		$("#comment_list").append(new_li);
	}
	
	$(function() {
		/** 기본 덧글 목록 불러오기 */
		$.get("../ajax/comment/comment_list.xml", {}, function(data) {
			// 읽어들인 XML에서 "item"태그를 찾아 반복처리
			$(data).find("item").each(function() {
				var num = $(this).find("num").text();
				var writer = $(this).find("writer").text();
				var content = $(this).find("content").text();
				var datetime = $(this).find("datetime").text();
				addNewItem(num, writer, content, datetime);
			});
		}).fail(function() {
			alert("덧글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.")
		});
		
		/** 덧글 내용 저장 이벤트 */
		$("#comment_form").submit(function() {
			// 작성자 이름에 대한 입력여부 검사
			if(!$("#user_name").val()) {
				alert("이름을 입력하세요.");
				$("#user_name").focus();
				return false;
			}
			// 내용에 대한 입력여부 검사
			if(!$("#comment").val()) {
				alert("내용을 입력하세요.");
				$("#comment").focus();
				return false;
			}
			/** 덧글쓰기에 대한 JSP예시 */
			var url = "../ajax/comment/comment_write.jsp";
			/** 글 저장을 위한 Post 방식의 Ajax 연동 처리 */
			$.post(url, $(this).serialize(), function(xml) {
				// XML에서 "result"태그의 값을 추출해서 식으로 변환 
				// --> true or false
				var result = eval($(xml).find("result").text());
				// 결과가 저장 실패를 의미한다면 에러 메시지 출력 후, 처리 중단.
				if(!result) {
					alert($(xml).find("message").text());
					return;
				}
				// 위의 if문을 지나친다면 저장 성공이므로, 저장된 결과를 추출
				var num = $(xml).find("num").text();
				var writer = $(xml).find("writer").text();
				var content = $(xml).find("content").text();
				var datetime = $(xml).find("datetime").text();
				// 저장 결과를 새로운 목록으로 출력하기 위해서 함수 호출
				addNewItem(num, writer, content, datetime);
			}).fail(function(){
				alert("덧글 작성에 실패했습니다. 잠시 후에 다시 시도해 주세요.");
			});
			return false;
		});
		
		/** 삭제 버튼 클릭시에 항목 삭제하도록 "미리" 지정 */
		$(document).on("click", ".delete_btn", function() {
			if(confirm("정말 선택하신 항목을 삭제하시겠습니까?")) {
				// 덧글 삭제를 가정한 JSP파일
				var url = "../ajax/comment/comment_delete.jsp";
				// 글번호 얻기
				var num = $(this).parents("li").attr("data-num");
				// 삭제 제거 대상 
				// --> 클릭된 버튼을 기준으로 "comment_item"이라는 클래스를 갖는 상위 요소
				var target = $(this).parents(".comment_item");
				/** 글 번호를 통하여 삭제를 요청함 */
				$.post(url, {"num":num}, function(xml) {
					// XML에서 "result"태그의 값을 추출해 식으로 변환 --> true, false
					var result = eval($(xml).find("result").text());
					// 결과 메시지
					var message = $(xml).find("message").text();
					// 메시지 출력
					alert(message);
					// 삭제 성공을 의미할 경우, 삭제 대상 요소를 화면에서 제거
					if(result) {
						target.remove();
					}
				}).fail(function() {
					alert("덧글 삭제에 실패했습니다. 잠시 후에 다시 시도해 주세요.");
				});
			}
		});
		
		/** 삭제 버튼 클릭시에 항목 삭제하도록 "미리" 지정 */
		$(document).on("click", ".comment_btn", function() {
			alert("test");
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