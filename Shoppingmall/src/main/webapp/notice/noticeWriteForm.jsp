<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice write form</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/bg.css">
<link rel="stylesheet" type="text/css" href="../font/fonts.css">
<script type="text/javascript">
	//저장버튼 클릭시 form 전송
	$(function(){
		$("#save").click(function(){
			$("#frm").submit();
		});
	});
</script>
</head>
<body>
	<form action="" name="">
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
					<th class="subject" style="width: 150px;">SUBJECT
					<td><input type="text" name="subject" value="text">
				</tr>
				<tr>
					<th class="name" style="width: 150px;">NAME 
					<td><input type="text" name="name" value="관리자 이름 고정"> <!-- value값에 관리자 이름  고정 -->
				</tr>
				<tr>
					<td width="1000">
						<textarea rows="10" cols="50" id="editor" class="smart_editor" name="content" style="width:1400px; height:400px;">
						</textarea>
					</td>
				</tr>
			</table>
			<div class="btnArea">
	            <a id="link" href="#"><span class="list">목록</span></a>
				<a id="link" href="#"><span class="">등록</span></a> 
				<a id="link" href="#"><span class="">취소</span></a>
       		</div>
		</div>
	</form>
</body>

</html>