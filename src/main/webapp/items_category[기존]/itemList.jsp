<%@page import="item.bean.ItemDTO"%>
<%@page import="java.util.List"%>
<%@page import="item.controller.ItemServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/bg.css" />
</head>
<body>
<form action="">
		<div id="container">
			<div id="contents">
				<div class="contents_info" module="contents_info">
					<ul class="info_area">
						<li class="info_img">
							<a href=""><img alt="웰컴조인자리" src="../image/join_1.jpg"> </a>
						</li>
						<li class="info_img">
							<a href=""><img alt="리뷰자리" src="../image/review_2.jpg"> </a>
						</li>
						<li class="info_notice">
							<div class="info_notice">
								<h2><a href="" >notice &amp; news</a></h2>
										<ul>
										<li><a href="">거래처와 협력사 장기휴가로인한 배송지연공지</a><span>07/30</span></li>
										<li><a href="">2018년 설연휴 배송관련공지</a><span>02/07</span></li>
										<li><a href="">회원등급별 할인혜택</a><span>04/26</span></li>
										</ul>
							</div>
						</li>
					</ul>
				</div>
				
				<div class="product">
					<div class="item_title">
						<h2>new arrivals</h2>
						<p>최근 업데이트 된 신상품입니다.</p>
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
			</div>
	</div>
</form>	
</body>
</html>