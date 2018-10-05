<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 리스트</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		var indexArray = new Array();
		
		$("#checkboxAll").click(function() {
			if($("#checkboxAll").prop("checked")){
				// 해당화면에 전체 checkbox들을 체크해준다.
				$("input[type=checkbox].checkbox").prop("checked",true);
			// 전체선택 체크박스가 해제된 경우
			} else {
				// 해당 화면에 모든 checkbox들의 체크를 해제시킨다.
				$("input[type=checkbox].checkbox").prop("checked",false);
			}
		});
		
		$('#delete').click(function() {
			$('.checkbox:checked').each(function(index, item) {
				var index = $(item).parents('tr').find('.index').text();
				indexArray.push(index);
			});	
			
			$.ajax({
				url : '/Shoppingmall/admin/deleteItem',
		        type : 'POST',
		        data : JSON.stringify(indexArray),
		        dataType : 'json',
		        contentType : 'application/json; charset=UTF-8',
		        complete : function() {
		        	location.reload();	
		        }
			});
			
			indexArray.splice(0, indexArray.length);
		});
	});
</script>
</head>
<body>


<div class="example">
<input type="button" value="등록" onclick="location.href='/Shoppingmall/admin/insertForm'">
<input type="button" id="delete" value="삭제" onclick="itemDelete()">
<form name="itemList">
<table id="admin_table" class="board_table">
	<tr id="tr_top" align="center">
		<td><input type="checkbox" id="checkboxAll"></td>
		<td width="3%">No</td>
		<td width="8%">상품코드</td>
		<td width="8%">상품분류</td>
		<td width="10%">상세상품분류</td>
		<td width="8%">상품명</td>
		<td width="12%">상품이미지</td>
		<td width="6%">브랜드명</td>
		<td width="8%">가격</td>
		<td width="6%">재고량</td>
		<td width="6%">color</td>
		<td width="6%">size</td>
		<td width="13%">등록일</td>
	</tr>
	
	
<c:forEach var="itemDTO" items="${list }">
	<tr align="center">
		<td ><input type="checkbox" class="checkbox"></td>
		<td class="index" width="3%">${itemDTO.item_index }</td>
		<td width="8%">${itemDTO.item_code }</td>
		<td width="8%">${itemDTO.item_category }</td>
		<td width="10%">${itemDTO.item_detail_category }</td>
		<td width="8%">${itemDTO.item_name }</td>
		<td width="12%">${itemDTO.item_img }</td>
		<td width="6%">${itemDTO.item_brand }</td>
		<td width="8%">${itemDTO.item_price }</td>
		<td width="6%">${itemDTO.item_quantity }</td>
		<td width="6%">${itemDTO.item_color }</td>
		<td width="6%">${itemDTO.item_size }</td>
		<td width="13%">${itemDTO.item_date }</td>
	</tr>
</c:forEach>	
</table>
</form>

<!-- paging -->
<div id="pageList">
<c:if test="${pg > 5 }">
	[<a class="paging" href="/Shoppingmall/admin/adminList?pg=${startPage - 1 }">이전</a>]
</c:if>

<c:forEach var="a" begin="${startPage }" end="${endPage }" step="1">
	<c:if test="${a == pg}">
		[<a class="currentPaging" href="/Shoppingmall/admin/adminList?pg=${a}">${a}</a>]
	</c:if>
	<c:if test="${a != pg}">
		[<a class="paging" href="/Shoppingmall/admin/adminList?pg=${a}">${a}</a>]
	</c:if>	
</c:forEach>

<c:if test="${endPage < totalPage }">
	[<a class="paging" href="/Shoppingmall/admin/adminList?pg=${startPage + 1 }">다음</a>]
</c:if>
</div>

</div>

	


</body>
</html>