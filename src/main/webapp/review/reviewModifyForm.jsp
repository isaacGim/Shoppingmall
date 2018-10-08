<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review write form</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="../font/fonts.css">
<link rel="stylesheet" type="text/css" href="../css/board.css">

<script type="text/javascript" src="../editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
					var oEditors = [];
					var content = '${reviewDTO.review_content }';
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
														[ content ]);
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

	<form action="/Shoppingmall/review/reviewModify" name="frm" id="frm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="review_num" value="${reviewDTO.review_num}">
		<input type="hidden" name="pg" value="${pg}">
		<div class="example">
			<p style="text-align:right;"><a href="../main/index.jsp">HOME</a> > REVIEW</p>
				<!-- 게시판 제목이 출력될 곳 -->
			<div class="board_title">
				<p>REVIEW</p>
				<hr class="titleHr">
				<p>상품후기를 올려주세요, 한건당 500원씩 적립해드립니다.(구매후 한달이내 작성글에한함)</p>
			</div>
			<table class="board_table">
				<tr>
					<th class="subject" style="width: 150px;">SUBJECT
					<td><input type="text" name="subject" class="inputTypeText" style="width: 550px;" maxLength="125" value="${reviewDTO.review_subject }">
				</tr>
				
				<tr>
					<th scope="row" style="width: 150px;">GRADE
                    <td><input id="point0" name="point" value="5" type="radio" checked="checked"  /><label for="point0" ><span class="point5"><em>★★★★★</em></span></label>
						<input id="point1" name="point" value="4" type="radio"  /><label for="point1" ><span class="point4"><em>★★★★</em></span></label>
						<input id="point2" name="point" value="3" type="radio"  /><label for="point2" ><span class="point3"><em>★★★</em></span></label>
						<input id="point3" name="point" value="2" type="radio"  /><label for="point3" ><span class="point2"><em>★★</em></span></label>
						<input id="point4" name="point" value="1" type="radio"  /><label for="point4" ><span class="point1"><em>★</em></span></label></td>
											
				</tr>
				<tr>
					<td width="1000">
						<textarea rows="10" cols="50" id="editor" class="smart_editor" name="content" style="width:100%; height:400px;">
						</textarea>
					</td>
				</tr>
				<tbody class="">
					<tr>
						<th scope="row" style="width: 150px;">file</th>
						<td><input name="image" type="file"/>
							<c:if test="${reviewDTO.review_img != null}">${reviewDTO.review_img }<input type="checkbox" class="imgDelete" name="imgDelete" value="1">삭제</c:if>
						</td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<th scope="row" style="width: 150px;">password</th>
						<td><input id="password" name="password" value="" type="password" /></td>
					</tr>
				</tbody>
			</table>
			<div class="btnArea">
				<a id="link" href="#none"><span class="buttonModify" id="save">수정</span></a>
				<a id="link" href="#"><span class="">취소</span></a>
       		</div>
		</div>
	</form>
	
</body>

</html>