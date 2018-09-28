<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#wrapper{
	width:1200px;
	margin: auto;
}
#title {
	border-bottom: seashell 1px solid;
	width: 300px;
	margin:auto;
	font-weight: normal;
}

ul{list-style: none; margin: 0; padding: 0;}
/** 상단부 배상상품 셀렉트 탭버튼 */
/** 내용과 1px 겹쳐져야 하고, 레이어 띄우기 */
ul.tab {list-style: none; position: relative; z-index: 100;}
/** 개별 버튼에 대한 기본 크기와 가로 정렬 */
ul.tab li {
	width: 150px; height: 30px;
	float:left;
	text-align: center; padding-top: 12px;
	font-weight: bolder;
	border: 1px solid lightgrey;
}
/** 탭 버튼의 기본 배경 처리와 글자 형태 처리 */
ul.tab li{
	background-color: lightgray;
	border-bottom: 0; 
}
ul.tab li a{color:grey; text-decoration: none; font-weight: normal;}
ul.tab li a:active{color:grey; text-decoration: none; }
ul.tab li a:focus{color:grey; text-decoration: none;}
ul.tab li a:hover{color:grey; text-decoration: none;}
ul.tab li a:visited{color:grey; text-decoration: none;}


.pix{display: inline-block; float: right; color:lightgrey;}
/** 현재 활성 탭 배경 처리 */
ul.tab li.selected {background-color: white;border-bottom: 0;}
ul.tab li.selected a {font-weight: bold;}
#sub {
	margin-top:142.5px;
	border-top: 1px solid lightgrey; 
}

table{width:1190px; margin:auto;}

th{ 
	text-decoration: none;
	font-weight: normal;
	text-align: center;
	text-decoration: none;
	border-bottom: 1px solid seashell;
}
.quantityButton {
	background-color: White;
	border:0.5px solid seashell;
	width:1px;
	height:10px;
}
.lastIn {
	text-align: center;
	padding-left:110px;
}
thead {	background-color: seashell;}

/** 	카트에 담긴 테이블 내 버튼	 */
.changeButton{ background-color:  white;	width:90px;	}
.orderButton, .deleteButton2 {background-color: black;	color: white;	width:90px;	}
.wishButton, .deleteCartButton {background-color:  seashell;	width:90px;	}
.orderButton, .wishButton, .deleteButton{height:27px; text-align: center;}

/** 	중간부 버튼 	*/
.deleteCartButton, .deleteButton2, .sheetButton {height:30px;}
.deleteButton, .sheetButton{	background-color:  white;	width:90px;	}
.deleteCartButton {width:110px;}

.deleteButton2:hover {background-color: white; color: black;}

td {border-bottom: 2px solid seashell; }

/**		최하단부 버튼		*/
.shoppingutton, .orderSelectButton, .orderAllButton{width:120px; height:40px;}
.orderAllButton{background-color: black; color:white;}
.orderSelectButton{background-color: lightgray; color:black;}
.shoppingutton{background-color: white; color:black;}
.lastButton{
	margin: 0 auto;	
	padding: auto;
	align-content: center;
}
/** 이용안내 */
.inform {border: 1px solid seashell; width: 1190; margin: auto;}
</style>
<title>SHOPPING CART</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	/* 상단 탭 버튼  */
	$(function() {
		$("ul.tab li").click(function() {
			$("ul.tab li").not(this).removeClass("selected");
			$(this).addClass("selected");
		});
	});
	
	$(function() {
		$('tr').each(function(index, item) {
			$(this).find('input[type="text"]').addClass('quantity' + index);
			$(this).find('strong:eq(0)').children().addClass('itemPrice' + index);
			$(this).find('strong:eq(1)').children().addClass('sumPrice' + index);
			$(this).find('img:eq(1)').addClass('QuantityUp' + index);
			$(this).find('img:eq(2)').addClass('QuantityDown' + index);
			$(this).find('input[type="button"]').addClass('changeButton' + index);
			
			var itemPrice = $('.itemPrice' + index).text();
			var count = $('.quantity' + index).val();
			var result = count * itemPrice;
			$('.sumPrice' + index).text(result);
		});
		
		$('tr').each(function(index, item) {
			$('.QuantityUp' + index).click(function() {
				var count = $('.quantity' + index).val();
				count++;
				$('.quantity' + index).val(count);
				var itemPrice = $('.itemPrice' + index).text();
				var result = count * itemPrice;
				$('.sumPrice' + index).text(result);
			});
			
			$('.QuantityDown' + index).click(function() {
				var count = $('.quantity' + index).val();
				if(count > 1) count--;
				$('.quantity' + index).val(count);
				var itemPrice = $('.itemPrice' + index).text();
				var result = count * itemPrice;
				$('.sumPrice' + index).text(result);
			});
			
			$('.changeButton' + index).click(function() {
				var count = $(".quantity" + index).val();
				if(count == 0 || count < 0){
					alert("수량 [0] 혹은 [0] 보다 작은 수를 설정할 수 없습니다.");
					return false;
				}
				$(".quantity" + index).val(count);
				var itemPrice = $('.itemPrice' + index).text();
				var result = count * itemPrice;
				$('.sumPrice' + index).text(result);
			});
		});
	});
	
	/* 전체 체크박스 선택/해제 */
	$(function() {
		// 전체선택 체크박스 클릭
		$(".checkAll").click(function() {
			// 만약 전체 선택 체크박스가 체크된 상태일 경우
			if($(".checkAll").prop("checked")){
				// 해당화면에 전체 checkbox들을 체크해준다.
				$("input[type=checkbox]").prop("checked",true);
			// 전체선택 체크박스가 해제된 경우
			} else {
				// 해당 화면에 모든 checkbox들의 체크를 해제시킨다.
				$("input[type=checkbox]").prop("checked",false);
			}
		});
	});
</script>
</head>
<body>

<div id="wrapper">
	<h2 id="title" align="center" style="margin-bottom:100px;">
		SHOPPING CARdT
	</h2>
	
	<div id="cartBox">
		<div id="cartTop">
			<ul class="tab">
				<li class="selected">
					<a href="#">국내배송상품 (0)</a>
				</li>
				<li>
					<a href="#">해외배송상품 (0)</a>
				</li>
			</ul>
			<p class="pix">장바구니에 담긴 상품은 10일 동안 보관됩니다.</p>
		</div>
	</div>
	
	<div id="sub">
	</div>
	

	<br>
	<table>
	<caption style="caption-side:top; text-align: left"><strong>일반상품</strong></caption>
		<thead>
			<tr height="50px">
				<th width="15px">
					<input type="checkbox" class="checkAll">
				</th>
				<th width="90px">이미지</th>
				<th width="350px">상품정보</th>
				<th width="90px">판매가</th>
				<th width="100px">수량</th>
				<th width="90px">적립금</th>
				<th width="90px">배송구분</th>
				<th width="90px">배송비</th>
				<th width="90px">합계</th>
				<th width="90px">선택</th>
			</tr>
		</thead>
		
		<tbody>	
			<tr align="center" height="120px">
				<td><input type="checkbox"></td>
				<td><img src="../image/shop5.jpg" width="89" height="119"></td>
				<td>
					상품명(블랙/화이트) [옵션:xxx]
				</td>
				<td style="font-size: 12pt;"><!-- 판매가 -->
					<strong><span>20000</span></strong>
				</td>
				<td>
					<span>
					<input type="text" size="1" value="1">
					<img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_quantity_up.gif"
						alt="증가" onclick="">
					<img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_quantity_down.gif"
						 alt="감소" onclick="">
					</span>
					<input type="button" value="변경">
				</td>
				<td></td>
				<td></td>
				<td></td>
				<td style="font-size: 12pt;">
					<strong><span></span></strong>
				</td>
				<td>
					<input type="button" value="주문하기" class="orderButton">
					<input type="button" value="관심상품등록" class="wishButton">
					<input type="button" value="삭제" class="deleteButton">
				</td>
			</tr>
			
			<!-- test page -->
			<tr align="center" height="120px">
				<td><input type="checkbox"></td>
				<td><img src="../image/shop5.jpg" width="89" height="119"></td>
				<td>
					상품명(블랙/화이트) [옵션:xxx] 버튼
				</td>
				<td style="font-size: 12pt;">
					<strong><span>10000</span></strong>
				</td>
				<td>
					<span>
					<input type="text" size="1" value="1">
					<img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_quantity_up.gif"
						alt="증가" onclick="">
					<img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_quantity_down.gif"
						 alt="감소" onclick="">
					</span>
					<input type="button" value="변경">
				</td>
				<td></td>
				<td></td>
				<td></td>
				<td style="font-size: 12pt;">
					<strong><span></span></strong>
				</td>
				<td>
					<input type="button" value="주문하기" class="orderButton">
					<input type="button" value="관심상품등록" class="wishButton">
					<input type="button" value="삭제" class="deleteButton">
				</td>
			</tr>
			<!-- test page -->
			
		</tbody>
		<tfoot>
			<tr height="50" style="background:seashell;">
				<td colspan="10">
					<span style="float:left; padding-top: 15px; padding-left:5px;">
						[기본배송]
					</span>
					<p style="float:right;">상품구매금액<span></span> + 배송비 0 (무료) = 합계 : <span>원</span></p>
				</td>
			</tr>
			<tr>
				<td colspan="10" height="25">
					<p style="color:lightgrey;">할인 적용 금액은 주문서작성의 결제예정금액에서 확인 가능합니다.</p>
				</td>			
			</tr>
			<tr>
				<td colspan="10" style="border-bottom: 0;">
					<strong>선택상품을</strong> <input type="button" value="삭제하기" class="deleteButton2">		
					<input type="button" value="견적서출력" class="sheetButton" style="float:right;">
					<input type="button" value="장바구니비우기" class="deleteCartButton" style="float:right;">
				</td>
			</tr>
		</tfoot>
	</table>
	
	<br><br><br>

	<table>
		<thead>
			<tr height="50px">
				<th>총 상품금액</th>
				<th>총 배송비</th>
				<th>결제예정금액</th>
			</tr>
		</thead>
		<tr align="center" height="90px" style="font-weight:bold;font-size: 18pt;">
			<td>108,500원</td>
			<td>+0원</td>
			<td>=108,500원</td>
		</tr>
		
		<tr align="center">
			<td colspan="3">
				<input type="button" value="전체상품주문" class="orderAllButton">
				<input type="button" value="선택상품주문" class="orderSelectButton">
				<input type="button" value="쇼핑계속하기" class="shoppingutton">
			</td>
		</tr>
	</table>
	<br><br><br><br><br>
	<div class="inform">
		<h3>이용안내</h3>
		
		<hr color="seashell"><hr color="seashell">
		<h4>장바구니 이용안내</h4>
		<p>
		1. 해외배송 상품과 국내배송 상품은 함께 결제하실 수 없으니 장바구니 별로 따로 결제해 주시기 바랍니다.<br>
		2. 해외배송 가능 상품의 경우 국내배송 장바구니에 담았다가 해외배송 장바구니로 이동하여 결제하실 수 있습니다.<br>
		3. 선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경] 버튼을 누르시면 됩니다.<br>
		4. [쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.<br>
		5. 장바구니와 관심상품을 이용하여 원하시는 상품만 주문하거나 관심상품으로 등록하실 수 있습니다.<br>
		6. 파일첨부 옵션은 동일상품을 장바구니에 추가할 경우 마지막에 업로드 한 파일로 교체됩니다.<br>
		</p>
		<h4>무이자할부 이용안내</h4>
		<p>
		1. 상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만 선택하여 [주문하기] 버튼을 눌러 주문/결제 하시면 됩니다.<br>
		2. [전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에 대한 주문/결제가 이루어집니다.<br>
		3. 단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수 없습니다.<br>
		</p>
		<br><br>
	</div>
</div>


</body>
</html>