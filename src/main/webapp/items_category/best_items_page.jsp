<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/bg.css">

</head>
<body>
       <div class="title">    
          
              <h3>
                <span>-BEST ITMES-</span>                
             </h3>                
           
          <h6 >
            &nbsp;&nbsp;IN THIS CATEGORY 
          </h6>
      </div> 
      <div class="product">
			 		<div class="item_title">
		<!-- 				<h2>new arrivals</h2>
						<p>최근 업데이트 된 신상품입니다.</p>  -->
					</div>
				
					<!-- 메인 아이템 리스트 -->
					
					<ul class="main_items">
						<c:forEach var="itemDTO" items="${list }">
							<li id="item" class="item">
								<div class="box">
									<a href="" name="BoxName"><img src="../storage/${itemDTO.item_img }" class="thumb"> </a>
									<p class="name">
											<a href=""><span style="font-size: 11px; color: #333333;">${itemDTO.item_name }<br><br></span> </a>
									</p>
									<p class="icon"></p>
									<ul class="product ">
										<li class="record">
										<strong class="title displaynone">
											<span style="font-size: 13px; color: #000000; font-weight: bold;">판매가</span> :
										</strong>
											<span style="font-size: 13px; color: #000000; font-weight: bold;">${itemDTO.item_price }원</span>
											<span id="span_type" style=""> </span>
									</ul>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
</body>
</html>