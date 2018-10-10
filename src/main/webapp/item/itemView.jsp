<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>itemView</title>
<link rel="stylesheet" type="text/css" href="../css/bg.css">
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		// 카트에 추가하기 클릭한 경우.
		$(".cart").click(function() {
			if( null == $("select[name='item_color']").val()) {
				alert("색상을 선택해주세요.");	
			} else if( null == $("select[name='item_size']").val()) {
				alert("사이즈를 선택해주세요.")
			} else {
				$("#itemForm").submit();
			}
		});
		
		// 수량입력창 숨기기
		$("div#item_info").hide();
		// 색상 및 사이즈 선택 시 수량입력창 추가
		$("select[name='item_size']").change(function() {
			if( null != $("select[name='item_color']").val()) {
				$("div#item_info").show();
			}
		});
		$("select[name='item_color']").change(function() {
			if( null != $("select[name='item_size']").val()) {
				$("div#item_info").show();
			}
		});
		
		// 수량 변경시 total 가격 변경
		$("input#item_qty").change(function() {
			
		});
		
	});
</script>
</head>
<body>
	<div class="container">
		<section class="article article-a">
		<img src="../storage/${itemDTO.item_img }" width="620" height="650">	 
		</section>
		
		<!-- 데이터를 처리해야 하기 때문에 Form태그가 없어서 Form태그 만듦 -->

		<section class="article article-b">
		   <h1>${itemDTO.item_name }</h1>
		   <hr width=100%>
           <p>판매가:&nbsp;&nbsp;  ${itemDTO.item_price }원  </p>
           <p>상품코드:&nbsp;&nbsp;  ${itemDTO.item_price} </p>
           <p>영문상품명: </p>
           <p><input type="radio" name="delivery" value="국내">국내
              <input type="radio" name="delivery" value="해외배송">해외배송
           </p>
           <hr width=100%> 
           <select id="color" name="item_color">
							<option value="color" selected disabled hidden>-[필수] 옵션을 선택해 주세요-</option>
							<option value="black">블랙(Black)</option>
							<option value="white">화이트(White)</option>


			</select>	<br>
			<select id="size" name="item_size">
							<option value="size" selected disabled hidden>-[필수] 옵션을 선택해 주세요-</option>
							<option value="Free">Free Size</option>
							
							
			</select>			
		
			<!-- 색상 + 사이즈 선택 시 수량 입력창 띄움.. -->
			<div name="item_info" id="item_info" style="border:1px solid lightgray; padding:10px; margin: 2px; margin-top: 3px;">
				${itemDTO.item_name } 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" size="1" name="item_qty" id="item_qty" value="1">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				${itemDTO.item_price }원
			</div>
			
		    <hr width=100%>
            <p>TOTAL: <span class="">${itemDTO.item_price}</span></p>
		    <hr width=100%>
	   	    <div class="buttonArea">
	   	      <a href="#" class="first">BUY IT NOW</a>
	   	      <a href="#none" class="cart">ADD CART</a>
	   	      <a href="#" class="wish">WISH LIST</a>
	   	    </div>
	
		</section>
		<form action="/Shoppingmall/order_list/cartList" method="post" id="itemForm" name="itemForm">
		</form> <!-- Form 태그 -->	



	</div>
    <div class="category">
	 	<a href="#de" class="detail">DETAIL</a>
	 	<a href="#re" class="read">READ ME</a>
	 	<a href="#rev" class="review">REVIEW</a>
	 	<a href="#qa" class="qa">Q&A</a>
	 	<a href="#wi" class="with">WITH ITEM</a>
	   
	 </div>
	 <hr width=100%>	<br>
	  
	 <div>
	 <a name="de"></a>
	   
	    <table id="table1">
	       
	          <tr >
	             <td id="td1"> 칼라(Color)  </td> <td colspan="4">  블루  </td>
	          </tr>
	          <tr>
	             <td id="td1"> 세부정보(Details) </td> <td colspan="4"> 광택 중간/두께 중간 </td>    
	          </tr>
	          <tr>
	             <td id="td1"> 제조사 </td> <td colspan="4"> 리멤버클릭 제휴사(Cooperatior of RC ) </td>
	          </tr>    
	          <tr>
	             <td id="td1"> 사이즈 </td> <td> S (27~28inch) </td> <td>M (29~30inch) </td><td> L(31~32inch) </td> <td> XL (33~34inch) </td>
	          </tr>
	          <tr>
	             <td id="td2"> 허리 </td> <td> 38cm </td> <td> 39.5cm </td> <td> 41cm </td><td> 42.5cm</td>
	          </tr>
	          <tr>
	             <td id="td2">엉덩이 </td> <td> 45cm </td> <td> 46cm </td> <td>  47cm </td> <td> 48cm </td>
	          </tr>    
	          <tr>
	             <td id="td2">밑위 </td> <td> 23cm </td> <td> 24cm </td> <td> 25cm </td> <td> 26cm </td>
	          </tr>
	          <tr>
	             <td id="td2">허벅지</td><td> 27cm </td> <td> 27.5cm </td> <td> 28cm </td> <td> 28.5cm </td>   
	          </tr>
	          <tr>
	             <td id="td2">종아리</td><td> 17cm </td> <td> 17.5m </td> <td> 18cm </td> <td> 18.5cm </td>
	          </tr>
	          <tr> 
	             <td id="td2">밑단</td><td>15cm  </td><td>15.5cm </td> <td> 16cm </td> <td> 16.5cm </td>  
	          </tr>
	          <tr>
	             <td id="td2">총 기장 </td><td>92cm </td><td> 94cm </td> <td> 96cm </td> <td> 100cm </td>
	          </tr>        
	    </table>  
	 
	 
	 
	 </div><br>
	 <div class="detail_img"><br>
	 	<!--<img src="" width="700" height="700"><br><br> -->
	    <img src="../image/item_Detail/rexism.jpg"><br><br>     
	    <img src="../image/item_Detail/	detail.jpg"><br><br>
   		<img src="../storage/${itemDTO.item_img }" width="800px" height="1100px"><br><br>
	    <img src="../storage/${itemDTO.item_detail_img }" width="800px" height="1100px"><br><br>
	 	<img src="../image/item_Detail/check_color.jpg" width="700"><br><br>
	 	<img src="../image/item_Detail/model.gif">
	 	
	 </div><br><br>
	 <div class="category">
	 	<a href="#" class="detail1">DETAIL</a>
	 	<a href="#" class="read1">READ ME</a>
	 	<a href="#" class="review">REVIEW</a>
	 	<a href="#" class="qa">Q&A</a>
	 	<a href="#" class="with">WITH ITEM</a>
	   
	 </div><br>
	<a name="re"></a>
	<div id="re">
	
	 <img src="../image/item_Detail/readme.jpg">
	</div>
	 </div><br><br>
	 <div class="category">
	 	<a href="#de" class="detail1">DETAIL</a>
	 	<a href="#re" class="read">READ ME</a>
	 	<a href="#rev" class="review1">REVIEW</a>
	 	<a href="#qa" class="qa">Q&A</a>
	 	<a href="#wi" class="with">WITH ITEM</a>
	   
	 </div>
	 <div id=reviewpart><br><br>
	 <a name="rev"></a>
	
	 <table id="subject">
	   
		    <tr>
		        <th>NO</th>
		        <th id="sub">SUBJECT</th>
		        <th>name</th>
		        <th>DATE</th>
		        <th>HIT</th>
		    <tr>
		    <tr>
		        <td>1</td>
		        <td>구입후기</td>
		        <td>Kevin</td>
		        <td>0805</td>
		        <td>2</td>
		    </tr>	  
		    <tr>
		        <td></td>
		        <td></td>
		        <td></td>
		        <td></td>
		        <td></td>
		    </tr>
		    <tr>
		        <td></td>
		        <td></td>
		        <td></td>
		        <td></td>
		        <td></td>
		    </tr>   
		    <tr>
		        <td></td>
		        <td></td>
		        <td></td>
		        <td></td>
		        <td></td>
		    </tr>
		    <tr>
		        <td></td>
		        <td></td>
		        <td></td>
		        <td></td>
		        <td></td>
		    </tr>
	    
	 </table>
	 
	 
	 </div><br><br><br>
	 
	  <div class="category">
	 	<a href="#de" class="detail1">DETAIL</a>
	 	<a href="#re" class="read">READ ME</a>
	 	<a href="#rev" class="review">REVIEW</a>
	 	<a href="#qa" class="qa1">Q&A</a>
	 	<a href="#wi" class="with">WITH ITEM</a>
	   
	 </div>
	 <div id="qnapart"><br><br>
	  <table id="subject">
	   
		    <tr>
		        <th>NO</th>
		        <th id="detail_sub">SUBJECT</th>
		        <th>name</th>
		        <th>DATE</th>
		        <th>HIT</th>
		    <tr>
		    <tr>
		        <td>1</td>
		        <td>구입후기</td>
		        <td>Kevin</td>
		        <td>0805</td>
		        <td>2</td>
		    </tr>	  
		    <tr>
		        <td></td>
		        <td></td>
		        <td></td>
		        <td></td>
		        <td></td>
		    </tr>
		    <tr>
		        <td></td>
		        <td></td>
		        <td></td>
		        <td></td>
		        <td></td>
		    </tr>   
		    <tr>
		        <td></td>
		        <td></td>
		        <td></td>
		        <td></td>
		        <td></td>
		    </tr>
		    <tr>
		        <td></td>
		        <td></td>
		        <td></td>
		        <td></td>
		        <td></td>
		    </tr>
	    
	 </table>
	 
	 <a name="qa"></a>
	 
	 </div><br>
     <div class="category">
	 	<a href="#de" class="detail1">DETAIL</a>
	 	<a href="#re" class="read">READ ME</a>
	 	<a href="#rev" class="review">REVIEW</a>
	 	<a href="#qa" class="qa">Q&A</a>
	 	<a href="#wi" class="with1">WITH ITEM</a>
	</div>
	<div>
	<a name="wi"></a>
	    <img src="" >
	</div>
</body>
</html>