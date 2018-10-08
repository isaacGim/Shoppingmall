<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/bg.css" />
<style type="text/css">

.insert_list {
	width:120px;
	text-align: center;
}

</style>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function () {
		$('#cate1').load("../text/category.jsp #category1", function () {
			$(this).show();
		});
		
		$(document).on('change', '#cate1>select', function () {
			$('#cate2').empty().hide();
			
			var target = $(this).find('option:selected').attr('data-target');
			var selector="../text/category.jsp "+ target;
	
			$('#cate2').load(selector, function () {
				$(this).show();
			});
		});
		
		$('#insertItemCheck').click(function() {
			if(document.insertForm.item_code.value == "") {
				alert("[상품코드]를 입력하세요.");
				document.insertForm.item_code.focus();
			} else if(document.insertForm.item_name.value == "") {
				alert("[상품명]을 입력해주세요.");
				document.insertForm.item_name.focus();
			} else if(document.insertForm.item_img1.value == "") {
				alert("[배너이미지]를 등록해주세요.");
				document.insertForm.item_img1.focus();
			} else if(document.insertForm.item_detail_img1.value == "") {
				alert("[상세이미지]를 등록해주세요.");
				document.insertForm.item_detail_img1.focus();
			} else if(document.insertForm.item_content.value == "") {
				alert("[상품설명]을 입력하세요.");
				document.insertForm.item_content.focus();
			} else if(document.insertForm.item_brand.value == "") {
				alert("[브랜드명]을 입력하세요.");
				document.insertForm.item_brand.focus();
			} else if(document.insertForm.item_price.value == "") {
				alert("[가격]을 입력하세요.");
				document.insertForm.item_price.focus();
			} else if(document.insertForm.item_quantity.value == "") {
				alert("[재고량(수량)]을 입력하세요.");
				document.insertForm.item_quantity.focus();
			} else if(document.insertForm.item_color.value == "") {
				alert("[상품(color)]를 입력하세요.");
				document.insertForm.item_color.focus();
			} else if(document.insertForm.item_size.value == "") {
				alert("[상품(size)]를 입력하세요.");
				document.insertForm.item_size.focus();
			} else {
				document.insertForm.submit();
			}
		});
	});
	
	
</script>
</head>
<body>
<form action="/Shoppingmall/admin/insertItem" method="post"
 enctype="multipart/form-data" name="insertForm">
<h2 style="text-align: center;">상품 등록</h2>
<hr width="100px">
 <fieldset>
<legend>상품 등록</legend>
	<table id="inserttable" >
		<tr>
			<td class="insert_list">상품코드</td>
			<td width="80%;"><input type="text" name="item_code"></td>
		</tr>
		<!-- 
		<tr>
			<td class="insert_list">상품분류</td>		
			<td>대분류 : <span id="cate1" >

					 <select name="item_category">
						<option value="item_acc">악세사리</option>
						<option value="item_bag">가방</option>
						<option value="item_outwear">아웃웨어</option>
						<option value="item_pants">팬츠</option>
						<option value="item_shirts">셔츠</option>
						<option value="item_shoes">슈즈</option>
						<option value="item_tee">티</option>
					</select> 	
				</span>
			</td>
			<td>소분류 : <span id="cate2" >

					<select name="item_detail_category">
						<option value="a">1</option>
						<option value="b">2</option>
						<option value="c">3</option>
						<option value="d">4</option>
						<option value="e">5</option>
						<option value="f">6</option>
						<option value="g">7</option>
					</select> 
				</span>
			</td>			
		</tr>
		 -->
		<!-- 은정씨 코드 -->
		<tr>
         <td class="insert_list" >상품분류명</td>
         
         <td>대분류 : <span id="cate1" ></span>
         	 소분류 : <span id="cate2" ></span>
         </td>
   
      </tr>
		
		<tr>
			<td class="insert_list">상품명</td>
			<td width="80%;"><input type="text" name="item_name"></td>
		</tr>
		<tr>
			<td class="insert_list">배너 이미지</td>
			<td><input type="file" name="item_img1" size="50"></td>
		</tr>
		<tr>
			<td class="insert_list">상세 이미지</td>
			<td><input type="file" name="item_detail_img1" size="50"></td>
		</tr>		
		<tr>
			<td class="insert_list">상품설명</td>
			<td>
				<textarea rows="25" cols="70" name="item_content"></textarea>
			</td>
		</tr>
		<tr>
			<td class="insert_list">브랜드명</td>
			<td><input type="text" name="item_brand"></td>
		</tr>
		<tr>
			<td class="insert_list">가격</td>
			<td><input type="text" name="item_price">원</td>
		</tr>
		<tr>
			<td class="insert_list">재고량(수량)</td>
			<td><input type="text" name="item_quantity">개</td>
		</tr>
		<tr>
			<td class="insert_list">상품COLOR</td>
			<td><input type="text" name="item_color"></td>
		</tr>
		<tr>
			<td class="insert_list">상품Size</td>
			<td ><input type="text" name="item_size"></td>
		</tr>
		<tr>
			<td colspan="3">
				<input type="button" value="등록하기" id="insertItemCheck">
				<input type="reset" value="다시쓰기">
			</td>
		</tr>
		</table>
	 </fieldset>
</form>
</body>
</html>



<!--
create table item (
	 item_index number primary key,         -- 상품 인덱스 
	 item_code varchar2(30) not null,       -- 상품코드   // 상품번호 primary key 
	 item_category varchar2(30) not null,   -- 상품분류1
	 item_detail_category varchar2(30) not null, -- 상세상품분류
	 item_name varchar2(30) not null,       -- 상품명
	 item_img varchar2(30) not null,        -- 상품 이미지
	 item_content varchar2(50) not null,    -- 상품 설명
	 
	 item_brand varchar2(20) not null,      -- 브랜드명
	 item_price number not null,            -- 가격
	 item_quantity number not null,            -- 재고량 (수량)
	 item_color varchar2(20) not null,      -- color
	 item_size varchar2(20) not null,       -- size
	 item_date date default sysdate            -- 등록일
);
  -->