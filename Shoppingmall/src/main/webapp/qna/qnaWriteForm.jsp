<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna write form</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/bg.css">
<link rel="stylesheet" type="text/css" href="../font/fonts.css">

<script type="text/javascript" src="../editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	
	var oEditors = [];
	$(function() {
		nhn.husky.EZCreator.createInIFrame({
					oAppRef : oEditors,
					elPlaceHolder : "editor", //textarea에서 지정한 id와 일치해야 합니다. 
					//SmartEditor2Skin.html 파일이 존재하는 경로
					sSkinURI : "../editor/SmartEditor2Skin.html",
					htParams : {
						// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseToolbar : true,
						// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseVerticalResizer : true,
						// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
						bUseModeChanger : true,
						fOnBeforeUnload : function() {

						}
					},
					fOnAppLoad : function() {
						//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
						oEditors.getById["editor"]
								.exec(
										"PASTE_HTML",
										[ "사무실에 재고가 있는경우 5시이전 결제시 당일배송 가능하며, 재고가없을시 오후8시이후 주문건에 대해서는 익익일 배송, 오후8시이전건에 대해서는 익일출고됩니다-<br />\n<br />\n궁금하신사항은 고객센터 1688-9856으로 연락주세요^^<br>" ]);
					},
					fCreator : "createSEditor2"
				});

		//저장버튼 클릭시 form 전송
		$("#save").click(
			function() {
				oEditors.getById["editor"].exec(
						"UPDATE_CONTENTS_FIELD", []);
				$("#frm").submit();
			});
	});
</script>
</head>
<body>

	
	<form action="/Shoppingmall/qna/qnaWrite" name="qnaWriteForm" id="frm">
		<div class="example" align="center">
			<p style="text-align:right;"><a href="../main/index.jsp">HOME</a> > Q & A</p>
				<!-- 게시판 제목이 출력될 곳 -->
			<div class="board_title">
				<p>Q & A</p>
				<hr class="titleHr">
				<p>궁금한점이 생기셨나요? 무엇이든 물어보세요. 빠르고 친절한 답변 드리겠습니다.</p>
			</div>
			<table class="board_table">
				<tr>
					<th class="subject">SUBJECT <select name="subject">
							<option value="리멤버클릭에 문의드립니다^^">리멤버클릭에 문의드립니다^^</option>
					</select>
				</tr>
				<tr>
					<td width="1000">
						<textarea rows="10" cols="50" id="editor" class="smart_editor"
						name="content" style="width:100%; height:400px;"></textarea>
					</td>
				</tr>
				<tr class="ucc">
					<th scope="row">UCC URL</th>
					<td><input id="ucc" name="ucc" size="35" fw-filter=""
						fw-label="UCC URL" value="" type="text" />&nbsp;&nbsp;&nbsp;<label
						class="size" for="ucc_width">넓이</label><input id="ucc_width"
						name="ucc_width" size="2" value="400" type="text" />&nbsp;&nbsp;&nbsp;<label
						class="size" for="ucc_height">높이</label><input id="ucc_height"
						name="ucc_height" size="2" value="300" type="text" /></td>
				</tr>
				<tbody class="">
					<tr>
						<th scope="row">file 1</th>
						<td>&nbsp;&nbsp;&nbsp;<input name="attach_file[]" type="file" /></td>
					</tr>
					<tr>
						<th scope="row">file 2</th>
						<td>&nbsp;&nbsp;&nbsp;<input name="attach_file[]" type="file" /></td>
					</tr>
					<tr>
						<th scope="row">file 3</th>
						<td>&nbsp;&nbsp;&nbsp;<input name="attach_file[]" type="file" /></td>
					</tr>
					<tr>
						<th scope="row">file 4</th>
						<td>&nbsp;&nbsp;&nbsp;<input name="attach_file[]" type="file" /></td>
					</tr>
					<tr>
						<th scope="row">file 5</th>
						<td>&nbsp;&nbsp;&nbsp;<input name="attach_file[]" type="file" /></td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<th scope="row">password</th>
						<td><input id="password" name="password" fw-filter="isFill"
							fw-label="비밀번호" fw-msg="" value="" type="password" /></td>
					</tr>
					<tr class="">
						<th scope="row">secret</th>
						<td><input id="secure0" name="secure" fw-filter="isFill"
							fw-label="비밀글설정" fw-msg="" value="F" type="radio"
							checked="checked" /><label for="secure0">공개글</label> <input
							id="secure1" name="secure" fw-filter="isFill" fw-label="비밀글설정"
							fw-msg="" value="T" type="radio" /><label for="secure1">비밀글</label></td>
					</tr>
				</tbody>
			</table>
			<div class="btnArea">
	            <a id="link" href="#none"><span class="button s list">목록</span></a>
				<a id="link" href="#none"><span id="save" class="button s white">등록</span></a> 
				<a id="link" href="#none"><span class="button s cancel">취소</span></a>
       		</div>
		</div>
	</form>
</body>

</html>