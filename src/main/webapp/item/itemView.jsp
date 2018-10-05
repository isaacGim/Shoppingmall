<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   a{text-decoration:none;}
   body {
      margin: 0;
      font-size: 2em;
   }
   .container {
    width: 1000px;
    margin : 0 auto;
    font-size: 0;
    
   }
   .item {
     
     display: inline-block; 
     vertical-align: top;
     padding: 5%;
     font-size: 1rem;   /*root em: 16px; */
   }
   .item-a {
      background-color: 
      width: 30%;
     
   
   }
   .item-b {
      background-color:  
   	  width: 50%;
   }
   
  /* .button{
   margin :0;
   width: 396px;
   border:2px solid #333;
   background: #333;
   color: #fff;
   }*/
   /*.button {
   margin: 0;
   border: 0;
   font-size: 1rem;
   position: relative;
   top: 50%;
   left: 50%;
   margin:top: -25px;
   margin-left: -100px;
   width: 200px;
   height: 50px;
   text-align: center;
   box-sizing: border-box;
   }*/
   .btnArea a:first-child {
    margin: auto;
    width: 400px;
    border: 2px solid #333;
    background: #333;
    color: #fff;
    
   }
   .btnArea a.cart {
    margin: auto;
    border: 2px solid #333;
    background: #333;
    color: #fff;
   }
   .btnArea a.wish {
    margin: auto;
    border: 2px solid #333;
    background: #333;
    color: #fff;
   }
   
   #color{
   width: 100%
   }
   #size{
   width: 100%
   }
  .btnArea a:hover {
   /* cursor: pointer; */
    background-color: white;
    color:black;
   }
   .category{
   
    display: flex;
    flex-direction: row;
    justify-content: center;
    font-size: 1rem;
    margin: 0 -5px;
    
    background:white;
    color:black;
    
   } 
   .category > a {
    border-style: groove;
    justify-content: center;
    margin : 5px;
    width: 90px;
    text-align: center;
   }
   .category a.detail {
     background: #333;
     color: #fff;
   }
   .category a.read1 {
     background: #333;
     color: #fff;
   }
   .category a.review1 {
     background: #333;
     color: #fff;
   }
   .category a.qa1{
     background: #333;
     color: #fff;
   }
   .category a.with1{
     background: #333;
     color: #fff;
   }
   
   
   #table1 {
   width: 80%;
   border: 1px solid #444444;
   font-size: 14px;
   border-collapse: collapse;
   margin: auto;
   text-align: center;
   }
  #table1 tr, #table1 td{
   border: 1px solid; 
   padding: 5px;
   }
 
   
   .img{
   text-align:center;
   border-radius: 8px;
   } 
  
   #re{
   text-align:center;
   width:90%;
   }
   
   #td1{
   background:#D3D3D3
   }
   #td2{
   background:#F5F5F5
   }
   #reviewpart{
   text-align:center;
   }
   #qnapart{
   text-align:center;
   }
   #hit{
    background:#F5F5F5
   }
  /* tbody {
   	    height: 50px;
		border-bottom:1.3px solid #F2F2F2;
		border-top:1.3px solid #F2F2F2;
		font-size:10px;	*/
		
    #subject {
  		width: 80%;
   	/*	border: 1px solid #444444; */
   		font-size: 14px;
        border-collapse: collapse;
        margin: auto;
        text-align: center;  
        
    
    } 
     #subject th{
        background-color: #F5F5F5
     }
     #subject {
       height: 50px;
	   border-bottom:1.3px solid #F2F2F2;
      border-top:1.3px solid #F2F2F2;
	  
     }
     #sub{
       width: 75%;
     }
   }
</style>
</head>
<body>
	<div class="container">
		<section class="item item-a">
		<img src="/img/bestitem/outwear/allround.jpg" width="400" height="500">	 
		<img src="">
	
	
		</section>
		<section class="item item-b">
		   <h1>"item_name"</h1>
		   <hr width=100%>
           <p>판매가: </p>
           <p>적립금: </p>
           <p>상품코드: </p>
           <p>영문상품명: </p>
           <p>국내 해외배송 </p>
           <hr width=100%> 
           <select id="color" name="item_color">
							<option value="color" selected disabled hidden>-[필수] 옵션을 선택해 주세요-</option>
							<option value="1">"  "</option>
							<option value="2">"  "</option>
			</select>	<br>
			<select id="size" name="item_size">
							<option value="size" selected disabled hidden>-[필수] 옵션을 선택해 주세요-</option>
							<option value="3">"  "</option>
							<option value="4">"  "</option>
							
			
			</select>			
		    <hr width=100%>
            <p>TOTAL:   </p>
		    <hr width=100%>
		<!-- 
		    <div class="btnArea">
			<button class="button">바로 구매하기</button> <br>
			<button class="button">장바구니 담기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="button">관심상품 등록</button>
			</div>
	   	 -->
	   	    <div class="btnArea">
	   	      <a href="#" class="fist">BUY IT NOW</a>
	   	      <a href="#" class="cart">ADD CART</a>
	   	      <a href="#" class="wish">WISH LIST</a>
	   	    </div>
	
		</section>

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
	 
	 
	 
	 </div><br><br><br>
	 <div class="img"><br>
	 	<img src="" width="700" height="700"><br><br>
	 	<img src="" width="700" height="700"><br><br>
	 	<img src="" width="700" height="700"><br><br>
	 	<img src="" width="700" height="700"><br><br>
	 	<img src="img/rexism.jpg">
	 	<img src="" width="700" height="700"><br><br>
	 	<img src="" width="700" height="700"><br><br>
	 	<img src="" width="700" height="700"><br><br>
	 	<img src="" width="700" height="700"><br><br>
	 	<img src="img/detail.jpg">
	 	<img src="" width="700" height="700"><br><br>
	 	<img src="" width="700" height="700"><br><br>
	 	<img src="" width="700" height="700"><br><br>
	 	<img src="img/check_color.jpg" width="700">
	 	<img src="img/model.gif">
	 	
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
	
	 <img src="img/readme.jpg">
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
	 
	 <a name="qa"></a>
	 
	 <!--  <table class="subject">
	   <tbody>
		    <tr id="hit">
		        <td id="no">NO</td><td id="su">SUBJECT</td><td id="na">name</td><td id="da">DATE</td><td id="hit">HIT</td>
		    <tr>
		        <td></td><td></td><td></td><td></td><td></td>
		    </tr>	  
		    <tr>
		        <td></td><td></td><td></td><td></td><td></td>
		    </tr>
		    <tr>
		        <td></td><td></td><td></td><td></td><td></td>
		    </tr>   
		    <tr>
		        <td></td><td></td><td></td><td></td><td></td>
		    </tr>
		    <tr>
		        <td></td><td></td><td></td><td></td><td></td>
		    </tr>
	   </tbody>
	 </table>
	 -->
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