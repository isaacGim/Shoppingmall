<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="../css/bg.css" />
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
 $(function () {
		$(window).scroll(function () {
			if($(this).scrollTop() > 100){
				$('.main_category').addClass('active');
				$('.main_category').removeClass('normal');
			}else {
				$('.main_category').addClass('.main_category > ul > li');
				$('.main_category').removeClass('active');
			}
			
			if($(this).scrollTop() > 200){
				$(".img_top > img ").fadeIn();
			}else {
				$(".img_top >img ").fadeOut();
			}
		});
		
		$(".img_top ").click(function () {
			$('html,body').animate({scrollTop : 0},400);
			return false;
		});
 });
	</script>
</head>
<body>
	<div id="top">
		<div class="top_info">
			<div class="top_info_left">
				<ul>
					<li style="list-style:none;  width: 85px;" class="list" onmouseover="this.innerHTML='공지사항'" onmouseout="this.innerHTML='NOTICE|'" ><a href="">NOTICE|</a></li>
					<li style="list-style:none; width: 85px;" class="list" onmouseover="this.innerHTML='문의사항'" onmouseout="this.innerHTML='Q&amp;A|'" ><a href="">Q&amp;A|</a></li>
					<li style="list-style:none; width: 85px;" class="list" onmouseover="this.innerHTML='구매후기'" onmouseout="this.innerHTML='REVIEW|'"><a href="" >REVIEW|</a></li>
					<li style="list-style:none; width: 100px;" class="list" onmouseover="this.innerHTML='자주묻는질문'" onmouseout="this.innerHTML='FAQ|'"><a href="" >FAQ|</a></li>
       			    <li style="list-style:none; width: 100px;" class="list" onmouseover="this.innerHTML='도매제휴문의'" onmouseout="this.innerHTML='WHOLESALE|'"><a href="" >WHOLESALE|</a></li>
				</ul>
			</div>
			
			<div class="top_info_right">
				<a href="../Shop_member/loginForm.do" class="log">login|</a> 
					<a href="" class="join" data-hint="+23,500 P">join us|</a>
					<a href="" class="cart">cart <span class="orderCart">(0)|</span> </a>
					<a href="">order|</a>
					<a href="">my page</a>
			</div>
		</div>
		
		<div class="top_banner">
			<h1 ><a href=""><img alt="리멤버클릭" src="../image/top_logo.png"onmouseover="this.src='../image/top_logo_1.png'" onmouseout="this.src='../image/top_logo.png'"></a></h1>
			
			<div class="top_banner_helpInfo">
						<ul>
							<li>
								<a href="" class="infoTip1">call center</a>
									<span class="call_st">
										<b>1688-9856</b><br>
										mon - fri 10:30 - 18:30<br>
										lunch time 13:00 - 14:00<br>
										<strong>sat, sun, holiday off</strong>
									</span>
							</li>
							
							<li>
								<a href="" class="infoTip2">bank info</a>
									<span class="bank_st">
										<b>SC제일은행</b>157-20-155301<br>
										<b>카카오뱅크</b>3333-01-5132902<br>
										<strong>예금주 : 박시연</strong>
									</span>
							</li>
						</ul>
					</div>
					
					<form action="" id="searchForm" name="" method="get" enctype="multipart/form-data">
						<input id="search_action" name="search_action" value="" type="hidden">
							<div class="top_banner_search">
								<fieldset>search
									<input id="keyword" name="keyword" fw-filter="" fw-label="검색어" fw-msg="" class="keyword" placeholder="" onmousedown="" value="" type="text">
									<input type="image" src="../image/btn_search.png" onclick="" class="sh_img">
								</fieldset>
							</div>
					</form>
		
		</div>
	</div>
	
	
	<div id="top_category" class="top_category">
	<div class="main_category">
		<ul>
			<li style="width:114px" class="category"><a href="" onmouseover="this.innerHTML='베스트아이템'" onmouseout="this.innerHTML='BEST ITEM'">BEST ITEM</a></li>
			<li style="width:114px" class="category"><a href="" onmouseover="this.innerHTML='아웃웨어'" onmouseout="this.innerHTML='OUTWEAR'">OUTWEAR</a></li>
			<li style="width:72px" class="category"><a href="" onmouseover="this.innerHTML='티'" onmouseout="this.innerHTML='TEE'">TEE</a></li>
            <li style="width:94px" class="category"><a href="" onmouseover="this.innerHTML='셔츠'" onmouseout="this.innerHTML='SHIRTS'">SHIRTS</a></li>
            <li style="width:90px" class="category"><a href="" onmouseover="this.innerHTML='팬츠'" onmouseout="this.innerHTML='PANTS'">PANTS</a></li>
            <li style="width:76px" class="category"><a href="" onmouseover="this.innerHTML='가방'" onmouseout="this.innerHTML='BAG'">BAG</a></li>
            <li style="width:91px" class="category"><a href="" onmouseover="this.innerHTML='신발'" onmouseout="this.innerHTML='SHOES'">SHOES</a></li>
            <li style="width:123px" class="category"><a href="" onmouseover="this.innerHTML='악세사리'" onmouseout="this.innerHTML='ACCESSORY'">ACCESSORY</a></li>
            <li style="width:115px" class="category"><a href="" onmouseover="this.innerHTML='신상5%할인'" onmouseout="this.innerHTML='NEW'">NEW</a></li>
            <li style="width:80px" class="category"><a href="" onmouseover="this.innerHTML='세일'" onmouseout="this.innerHTML='SALE'">SALE</a></li>
		</ul>
	</div>
</div>


<div id="full_main">
	<div id="banner_wrapper " class="banner_wrapper">
			<img class='banner_image1' src='../image/banner_top.jpg'>
			<img class='banner_image2' src='../image/banner_bot.jpg'>
			<img class='banner_image3' src='../image/banner_sho.jpg'>
			<img class='banner_image4' src='../image/banner_acc.jpg'>
	</div>
		<a href="#" id="full_banner_prev"><img src="../image/slide_left.png"/></a>
		<a href="#" id="full_banner_next"><img src="../image/slide_right.png"/></a>
	<div id="slider_pg">
	</div>
</div>

<hr class="midHR">
	<div id="content">
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
					
					<ul class="main_items">
						<li id="item" class="item">
							<div class="box">
								<a href="" name="BoxName"><img alt="스터드 레더패치 블랙티" src="../image/shop1.jpg" class="thumb"> </a>
								<p class="name">
									<a href=""><span style="font-size: 11px; color: #333333;">스터드 레더패치 블랙티<br><br></span> </a>
								</p>
								<p class="icon"></p>
								<ul class="product ">
									<li class="record">
									<strong class="title displaynone">
										<span style="font-size: 13px; color: #000000; font-weight: bold;">판매가</span> :
									</strong>
										<span style="font-size: 13px; color: #000000; font-weight: bold;">32,500원</span>
										<span id="span_type" style=""> </span>
								</ul>
							</div>
							</li>
							
							<li id="item" class="item">
								<div class="box">
									<a href="" name="BoxName"><img src="../image/shop2.jpg" alt="" class="thumb"/></a>
									<p class="name">
										<a href=""><span style="font-size:11px;color:#333333;">버클빅포켓 지퍼팬츠<br>(블랙/화이트)<br></span></a>
									</p>
									<p class="icon"></p>
									<ul class="product">
										<li class="record">
										<strong class="title displaynone">
											<span style="font-size:13px;color:#000000;font-weight:bold;">판매가</span> :</strong> 
											<span style="font-size:13px;color:#000000;font-weight:bold;">79,500원</span>
											<span id="span_type" style=""> </span>
										</li>
									</ul>
								</div>
							</li>
							
							<li id="item" class="item">
								<div class="box">
									<a href="" name="BoxName"><img src="../image/shop3.jpg" alt="" class="thumb"/></a>
									<p class="name">
										<a href=""><span style="font-size:11px;color:#333333;">라인로드 루즈티<br>(블랙/화이트)<br></span></a>
									</p>
									<p class="icon"></p>
									<ul class="product">
										<li class="record">
										<strong class="title displaynone">
											<span style="font-size:13px;color:#000000;font-weight:bold;">판매가</span> :</strong> 
											<span style="font-size:13px;color:#000000;font-weight:bold;">29,500원</span>
											<span id="span_type" style=""> </span>
										</li>
									</ul>
								</div>
							</li>
							
							<li id="item" class="item">
								<div class="box">
									<a href="" name="BoxName"><img src="../image/shop4.jpg" alt="" class="thumb"/></a>
									<p class="name">
										<a href=""><span style="font-size:11px;color:#333333;">스퀘어체크 루즈롱셔츠<br>(블랙/화이트)<br></span></a>
									</p>
									<p class="icon"></p>
									<ul class="product">
										<li class="record">
										<strong class="title displaynone">
											<span style="font-size:13px;color:#000000;font-weight:bold;">판매가</span> :</strong> 
											<span style="font-size:13px;color:#000000;font-weight:bold;">54,500원</span>
											<span id="span_type" style=""> </span>
										</li>
									</ul>
								</div>
							</li>
							
							<li id="item" class="item">
								<div class="box">
									<a href="" name="BoxName"><img src="../image/shop5.jpg" alt="" class="thumb"/></a>
									<p class="name">
										<a href=""><span style="font-size:11px;color:#333333;">믹스카툰 롱셔츠<br><br></span></a>
									</p>
									<p class="icon"></p>
									<ul class="product">
										<li class="record">
										<strong class="title displaynone">
											<span style="font-size:13px;color:#000000;font-weight:bold;">판매가</span> :</strong> 
											<span style="font-size:13px;color:#000000;font-weight:bold;">54,500원</span>
											<span id="span_type" style=""> </span>
										</li>
									</ul>
								</div>
							</li>
							
							
							<li id="item" class="item">
								<div class="box">
									<a href="" name="BoxName"><img src="../image/shop6.jpg" alt="" class="thumb"/></a>
									<p class="name">
										<a href=""><span style="font-size:11px;color:#333333;">RC[AL228] ZG-HL17<br>(블랙/화이트)<br></span></a>
									</p>
									<p class="icon"></p>
									<ul class="product">
										<li class="record">
										<strong class="title displaynone">
											<span style="font-size:13px;color:#000000;font-weight:bold;">판매가</span> :</strong> 
											<span style="font-size:13px;color:#000000;font-weight:bold;">11,000원</span>
											<span id="span_type" style=""> </span>
										</li>
									</ul>
								</div>
							</li>
							
							
							<li id="item" class="item">
								<div class="box">
									<a href="" name="BoxName"><img src="../image/shop7.jpg" alt="" class="thumb"/></a>
									<p class="name">
										<a href=""><span style="font-size:11px;color:#333333;">RC[AL241] ZG버클쪼리<br>(블랙/화이트)<br></span></a>
									</p>
									<p class="icon"></p>
									<ul class="product">
										<li class="record">
										<strong class="title displaynone">
											<span style="font-size:13px;color:#000000;font-weight:bold;">판매가</span> :</strong> 
											<span style="font-size:13px;color:#000000;font-weight:bold;">15,000원</span>
											<span id="span_type" style=""> </span>
										</li>
									</ul>
								</div>
							</li>
							
							
							<li id="item" class="item">
								<div class="box">
									<a href="" name="BoxName"><img src="../image/shop8.jpg" alt="" class="thumb"/></a>
									<p class="name">
										<a href=""><span style="font-size:11px;color:#333333;">모노플라워 루즈셔츠<br>(블랙/블루)<br></span></a>
									</p>
									<p class="icon"></p>
									<ul class="product">
										<li class="record">
										<strong class="title displaynone">
											<span style="font-size:13px;color:#000000;font-weight:bold;">판매가</span> :</strong> 
											<span style="font-size:13px;color:#000000;font-weight:bold;">58,500원</span>
											<span id="span_type" style=""> </span>
										</li>
									</ul>
								</div>
							</li>
							
							
							<li id="item" class="item">
								<div class="box">
									<a href="" name="BoxName"><img src="../image/shop9.jpg" alt="" class="thumb"/></a>
									<p class="name">
										<a href=""><span style="font-size:11px;color:#333333;">RCPM2433<br>(블랙/네이비/남여공용)<br></span></a>
									</p>
									<p class="icon"></p>
									<ul class="product">
										<li class="record">
										<strong class="title displaynone">
											<span style="font-size:13px;color:#000000;font-weight:bold;">판매가</span> :</strong> 
											<span style="font-size:13px;color:#000000;font-weight:bold;">29,500원</span>
											<span id="span_type" style=""> </span>
										</li>
									</ul>
								</div>
							</li>
							
							
							<li id="item" class="item">
								<div class="box">
									<a href="" name="BoxName"><img src="../image/shop10.jpg" alt="" class="thumb"/></a>
									<p class="name">
										<a href=""><span style="font-size:11px;color:#333333;">RCPM2433<br>(블랙/네이비/남여공용)<br></span></a>
									</p>
									<p class="icon"></p>
									<ul class="product">
										<li class="record">
										<strong class="title displaynone">
											<span style="font-size:13px;color:#000000;font-weight:bold;">판매가</span> :</strong> 
											<span style="font-size:13px;color:#000000;font-weight:bold;">29,500원</span>
											<span id="span_type" style=""> </span>
										</li>
									</ul>
								</div>
							</li>
							
							<li id="item" class="item">
								<div class="box">
									<a href="" name="BoxName"><img src="../image/shop11.jpg" alt="" class="thumb"/></a>
									<p class="name">
										<a href=""><span style="font-size:11px;color:#333333;">RCPM2433<br>(블랙/네이비/남여공용)<br></span></a>
									</p>
									<p class="icon"></p>
									<ul class="product">
										<li class="record">
										<strong class="title displaynone">
											<span style="font-size:13px;color:#000000;font-weight:bold;">판매가</span> :</strong> 
											<span style="font-size:13px;color:#000000;font-weight:bold;">29,500원</span>
											<span id="span_type" style=""> </span>
										</li>
									</ul>
								</div>
							</li>
							
							
							<li id="item" class="item">
								<div class="box">
									<a href="" name="BoxName"><img src="../image/shop12.jpg" alt="" class="thumb"/></a>
									<p class="name">
										<a href=""><span style="font-size:11px;color:#333333;">RCPM2433<br>(블랙/네이비/남여공용)<br></span></a>
									</p>
									<p class="icon"></p>
									<ul class="product">
										<li class="record">
										<strong class="title displaynone">
											<span style="font-size:13px;color:#000000;font-weight:bold;">판매가</span> :</strong> 
											<span style="font-size:13px;color:#000000;font-weight:bold;">29,500원</span>
											<span id="span_type" style=""> </span>
										</li>
									</ul>
								</div>
							</li>
							
							
							<li id="item" class="item">
								<div class="box">
									<a href="" name="BoxName"><img src="../image/shop13.jpg" alt="" class="thumb"/></a>
									<p class="name">
										<a href=""><span style="font-size:11px;color:#333333;">RCPM2433<br>(블랙/네이비/남여공용)<br></span></a>
									</p>
									<p class="icon"></p>
									<ul class="product">
										<li class="record">
										<strong class="title displaynone">
											<span style="font-size:13px;color:#000000;font-weight:bold;">판매가</span> :</strong> 
											<span style="font-size:13px;color:#000000;font-weight:bold;">29,500원</span>
											<span id="span_type" style=""> </span>
										</li>
									</ul>
								</div>
							</li>
							
							
							<li id="item" class="item">
								<div class="box">
									<a href="" name="BoxName"><img src="../image/shop14.jpg" alt="" class="thumb"/></a>
									<p class="name">
										<a href=""><span style="font-size:11px;color:#333333;">RCPM2433<br>(블랙/네이비/남여공용)<br></span></a>
									</p>
									<p class="icon"></p>
									<ul class="product">
										<li class="record">
										<strong class="title displaynone">
											<span style="font-size:13px;color:#000000;font-weight:bold;">판매가</span> :</strong> 
											<span style="font-size:13px;color:#000000;font-weight:bold;">29,500원</span>
											<span id="span_type" style=""> </span>
										</li>
									</ul>
								</div>
							</li>
							
							
							<li id="item" class="item">
								<div class="box">
									<a href="" name="BoxName"><img src="../image/shop15.jpg" alt="" class="thumb"/></a>
									<p class="name">
										<a href=""><span style="font-size:11px;color:#333333;">RCPM2433<br>(블랙/네이비/남여공용)<br></span></a>
									</p>
									<p class="icon"></p>
									<ul class="product">
										<li class="record">
										<strong class="title displaynone">
											<span style="font-size:13px;color:#000000;font-weight:bold;">판매가</span> :</strong> 
											<span style="font-size:13px;color:#000000;font-weight:bold;">29,500원</span>
											<span id="span_type" style=""> </span>
										</li>
									</ul>
								</div>
							</li>
							
							
							<li id="item" class="item">
								<div class="box">
									<a href="" name="BoxName"><img src="../image/shop16.jpg" alt="" class="thumb"/></a>
									<p class="name">
										<a href=""><span style="font-size:11px;color:#333333;">RCPM2433<br>(블랙/네이비/남여공용)<br></span></a>
									</p>
									<p class="icon"></p>
									<ul class="product">
										<li class="record">
										<strong class="title displaynone">
											<span style="font-size:13px;color:#000000;font-weight:bold;">판매가</span> :</strong> 
											<span style="font-size:13px;color:#000000;font-weight:bold;">29,500원</span>
											<span id="span_type" style=""> </span>
										</li>
									</ul>
								</div>
							</li>
							
							<li id="item" class="item">
								<div class="box">
									<a href="" name="BoxName"><img src="../image/shop17.jpg" alt="" class="thumb"/></a>
									<p class="name">
										<a href=""><span style="font-size:11px;color:#333333;">RCPM2433<br>(블랙/네이비/남여공용)<br></span></a>
									</p>
									<p class="icon"></p>
									<ul class="product">
										<li class="record">
										<strong class="title displaynone">
											<span style="font-size:13px;color:#000000;font-weight:bold;">판매가</span> :</strong> 
											<span style="font-size:13px;color:#000000;font-weight:bold;">29,500원</span>
											<span id="span_type" style=""> </span>
										</li>
									</ul>
								</div>
							</li>
							
							
							<li id="item" class="item">
								<div class="box">
									<a href="" name="BoxName"><img src="../image/shop18.jpg" alt="" class="thumb"/></a>
									<p class="name">
										<a href=""><span style="font-size:11px;color:#333333;">RCPM2433<br>(블랙/네이비/남여공용)<br></span></a>
									</p>
									<p class="icon"></p>
									<ul class="product">
										<li class="record">
										<strong class="title displaynone">
											<span style="font-size:13px;color:#000000;font-weight:bold;">판매가</span> :</strong> 
											<span style="font-size:13px;color:#000000;font-weight:bold;">29,500원</span>
											<span id="span_type" style=""> </span>
										</li>
									</ul>
								</div>
							</li>
								
					</ul>
				</div>
			</div>
			
			<hr class="footerHR">
		</div>
	</div>	
			<div id="footer">
			<div class="footer_menu">
				<ul class="menus">
					<li class="home"><a href="/index.html">HOME |</a></li>
					<li class="compony"><a href="">COMPANY |</a></li>
					<li class="agreement"><a href="">AGREEMENT |</a></li>
					<li class="privacy"><a href="">PRIVACY POLICY |</a></li>
					<li class="guide"><a href="">GUIDE |</a></li>
				</ul>
			</div>
			
			<div id="footer_info">
				<ul class="infos">
					<li>
						<p>CUSTOMER CENTER<br>-<br>
						<p>1688-9856<br>
							MON - FRI 10:30 - 18:30<br>
							LUNCH TIME 13:00 - 14:00<br>
							SAT, SUN, HOLIDAY OFF</p>
					</li>
					
					<li>
						<p>BANKING INFO<br>-<br>
						<p>SC제일은행157-20-155301<br>
							카카오뱅크3333-01-5132902<br>
							예금주 : 박시연</p>
					</li>
					
					<li>
						<p>COMPANY INFO<br>-<br>
						<p>COMPANY 에쓰와이 어패럴 TEL. 1688-9856 OWNER 박시연<br>
							ADDRESS 서울특별시 동대문구 왕산로 128 (용두동) 동의보감타워 1015호<br>
							BUSINESS LICENCE. 201-08-66902 MAIL-ORDER LICENCE. 2009-서울동대문-0469 [사업자정보확인]<br>
							WEB MASTER 박시연 (webmaster@rememberclick.com) 호스팅 제공 : 심플렉스 인터넷(주)</p>
					</li>
				</ul>
				
			</div>
			
			
			<div id="footer_fin">
				<p >COPYRIGHT © 2016 리멤버클릭. ALL RIGHTS RESERVED. DESIGN BY ROMIDESIGN.<img class="fin_img" alt="" src="../image/fin_img.JPG"></p>
			</div>
		</div>


	<a href="#" class="img_top"><img  alt="" src="../image/top.JPG"></a>

</body>
</html>