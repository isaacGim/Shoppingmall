<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ShoppingMall</title>
<link rel="stylesheet" type="text/css" href="../css/bg.css" />
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
var BANNER_INDEX = 1;
var BANNER_LEN = 0;
var BANNER_WIDTH = 1702;
var SHOW_DURATION = 200;


	$(function () {
		
			$('.category1').hover(function () {
				$(this).parent().find('.sub1').slideDown().show();
					$(this).hover(function () {
					}, function () {
						$(this).find('.sub1').slideUp('fast');
					});	
				});
			
			$('.category2').hover(function () {
				$(this).parent().find('.sub2').slideDown().show();
					$(this).hover(function () {
					}, function () {
						$(this).find('.sub2').slideUp('fast');
					});	
				});
		
			$('.category3').hover(function () {
				$(this).parent().find('.sub3').slideDown().show();
					$(this).hover(function () {
					}, function () {
						$(this).find('.sub3').slideUp('fast');
					});	
				});
			
			$('.category4').hover(function () {
				$(this).parent().find('.sub4').slideDown().show();
					$(this).hover(function () {
					}, function () {
						$(this).find('.sub4').slideUp('fast');
					});	
				});
			
			$('.category5').hover(function () {
				$(this).parent().find('.sub5').slideDown().show();
					$(this).hover(function () {
					}, function () {
						$(this).find('.sub5').slideUp('fast');
					});	
				});
			
			$('.category6').hover(function () {
				$(this).parent().find('.sub6').slideDown().show();
					$(this).hover(function () {
					}, function () {
						$(this).find('.sub6').slideUp('fast');
					});	
				});
			
			$('.category7').hover(function () {
				$(this).parent().find('.sub7').slideDown().show();
					$(this).hover(function () {
					}, function () {
						$(this).find('.sub7').slideUp('fast');
					});	
				});
			
			$('.category8').hover(function () {
				$(this).parent().find('.sub8').slideDown().show();
					$(this).hover(function () {
					}, function () {
						$(this).find('.sub8').slideUp('fast');
					});	
				});
		
	        bannerInit();
	         
	        $('#full_banner_prev').unbind();
	        $('#full_banner_prev').bind('click', function(){           
	            var nIndex = BANNER_INDEX-1;
	            
	            showBannerAt(nIndex);
	        });
	        $('#full_banner_next').unbind();
	        $('#full_banner_next').bind('click', function(){
	        	
	            var nIndex = BANNER_INDEX+1;
	             
	            showBannerAt(nIndex);  
	        });
	    function showBannerAt(nIndex){
	        if (nIndex != BANNER_INDEX) {
	                                 
	            var nPosition = -BANNER_WIDTH * nIndex;
	            
	            $('.banner_wrapper').stop();
	            $('.banner_wrapper').animate({
	                left: nPosition
	            }, SHOW_DURATION, function(){
	            	
	                if(nIndex<1) {
	                    nIndex = BANNER_LEN;
	                    nPosition = -BANNER_WIDTH * nIndex;
	                    $('.banner_wrapper').css({'left': nPosition + 'px'});
	                }
	 
	                if(nIndex>BANNER_LEN) {
	                    nIndex = 1;
	                    nPosition = -BANNER_WIDTH * nIndex;
	                    $('.banner_wrapper').css({'left': nPosition + 'px'});
	                }
	 
	                BANNER_INDEX = nIndex;
	            });
	        }
	    }
	 
	    function bannerInit(){
	        BANNER_LEN = $('.banner_wrapper .page').length;
	        $('.banner_wrapper').css({'left': -BANNER_WIDTH});
	    }




		$(window).scroll(function () {
			if($(this).scrollTop() > 100){
				$('.top_category').addClass('active');
				$('.top_category').removeClass('normal');
			}else {
				$('.top_category').addClass('.main_category > ul > li');
				$('.top_category').removeClass('active');
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
		
		$('.close').click(function () {
			$('.bar_right').addClass('close_bar');
			$(this).css('visibility','hidden');
		});
		
		$('.open').click(function () {
			$('.close').css('visibility','visible');
			$('.bar_right').removeClass('close_bar');
		});
		
 });
	</script>
</head>
<body>
	<div id="top">
		<div class="top_info">
			<div class="top_info_left">
				<ul>
					<li onclick="location.href='/Shoppingmall/notice/noticeList?pg=1'" style="list-style:none;  width: 85px;" class="list" onmouseover="this.innerHTML='공지사항'" onmouseout="this.innerHTML='NOTICE|'" >NOTICE|</li>
					<li onclick="location.href='/Shoppingmall/main/index.jsp?req=qnaList'" style="list-style:none; width: 85px;" class="list" onmouseover="this.innerHTML='문의사항'" onmouseout="this.innerHTML='Q&amp;A|'" >Q&amp;A|</li>
					<li style="list-style:none; width: 85px;" class="list" onmouseover="this.innerHTML='구매후기'" onmouseout="this.innerHTML='REVIEW|'"><a href="" >REVIEW|</a></li>
					<li style="list-style:none; width: 100px;" class="list" onmouseover="this.innerHTML='자주묻는질문'" onmouseout="this.innerHTML='FAQ|'"><a href="" >FAQ|</a></li>
       			    <li style="list-style:none; width: 100px;" class="list" onmouseover="this.innerHTML='도매제휴문의'" onmouseout="this.innerHTML='WHOLESALE|'"><a href="" >WHOLESALE|</a></li>
				</ul>
			</div>
			
			<div class="top_info_right">
				<c:if test="${sessionScope.member_id == 'hong' }">
					<a href="/Shoppingmall/admin/adminList?pg=1" class="insert" >AdminPage|</a> 
				</c:if>
				<c:choose>
					<c:when test="${sessionScope.member_id == null}">
						<a href="/Shoppingmall/shop_member/loginForm" class="log" >login|</a> 		
						<a href="/Shoppingmall/shop_member/joinForm" class="join">join us|</a>	
					</c:when>
					<c:when test="${sessionScope.member_id != null}">
						<a href="/Shoppingmall/shop_member/MyInfo" class="log" >MyInfo|</a> 		
						<a href="/Shoppingmall/shop_member/logout" class="log" >logout|</a> 
					</c:when>
				</c:choose>
				<a href="" class="cart">cart <span class="orderCart">(0)|</span> </a>
				<a href="">order|</a>
			</div>
		</div>
		
		<div class="top_banner">
			<h1 >
				<a href="../main/index">
					<img alt="리멤버클릭" src="../image/top_logo.png"onmouseover="this.src='../image/top_logo_1.png'" onmouseout="this.src='../image/top_logo.png'">
				</a>
			</h1>
			
			<div class="top_banner_helpInfo">
						<ul>
							<li>
								<a href="" class="infoTip1">call center</a>
									<span class="call_st">
										<b>1688-9856</b><br>
										mon - fri <br>10:30 - 18:30<br>
										lunch time <br>13:00 - 14:00<br>
										<strong>sat, sun, holiday off</strong>
									</span>
							</li>
							
							<li>
								<a href="" class="infoTip2">bank info</a>
									<span class="bank_st">
										<b>SC제일은행</b>157-20-155301<br>
										<b>카카오뱅크</b>3333-01-5132902<br>
										<strong>예금주 : 김이이삭</strong>
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
			<li style="width:114px" class="category1"><a href="" onmouseover="this.innerHTML='베스트아이템'" onmouseout="this.innerHTML='BEST ITEM'">BEST ITEM</a>
				<ul class=" sub sub1">
					<li><a>아웃웨어</a></li>
					<li><a>팬츠</a></li>
					<li><a>셔츠</a></li>
					<li><a>티</a></li>
					<li><a>신발</a></li>
					<li><a>악세사리</a></li>
					<li><a>가방</a></li>
				</ul>
			</li>
			<li style="width:114px" class="category2"><a href="" onmouseover="this.innerHTML='아웃웨어'" onmouseout="this.innerHTML='OUTWEAR'">OUTWEAR</a>
				<ul class="sub sub2">
					<li><a>가디건</a></li>
					<li><a>코트</a></li>
					<li><a>패딩</a></li>
					<li><a>숄/판초</a></li>
					<li><a>베스트</a></li>
					<li><a>자켓/블레이져</a></li>
					<li><a>점퍼/집업</a></li>
				</ul>
			</li>
			<li style="width:72px" class="category3"><a href="" onmouseover="this.innerHTML='티'" onmouseout="this.innerHTML='TEE'">TEE</a>
				<ul class="sub sub3">
					<li><a>긴팔</a></li>
					<li><a>반팔</a></li>
					<li><a>카라</a></li>
					<li><a>롱/루즈핏</a></li>
					<li><a>민소매</a></li>
					<li><a>니트</a></li>
					<li><a>슬림/베이직핏</a></li>
					<li><a>후 드</a></li>
				</ul>
			</li>
	            <li style="width:94px" class="category4"><a href="" onmouseover="this.innerHTML='셔츠'" onmouseout="this.innerHTML='SHIRTS'">SHIRTS</a>
	        	<ul class="sub sub4">
					<li><a>긴팔</a></li>
					<li><a>반팔</a></li>
					<li><a>롱/루즈핏</a></li>
					<li><a>체크</a></li>
					<li><a>베이직/슬림핏</a></li>
				</ul>    
	            </li>
	            <li style="width:90px" class="category5"><a href="" onmouseover="this.innerHTML='팬츠'" onmouseout="this.innerHTML='PANTS'">PANTS</a>
	        	<ul class="sub sub5">
					<li><a>스키니</a></li>
					<li><a>긴바지</a></li>
					<li><a>일자바지</a></li>
					<li><a>배기바지</a></li>
					<li><a>반바지</a></li>
					<li><a>슬랙스</a></li>
					<li><a>조거</a></li>
					<li><a>부츠컷</a></li>
				</ul>    
	            </li>
	            <li style="width:76px" class="category6"><a href="" onmouseover="this.innerHTML='가방'" onmouseout="this.innerHTML='BAG'">BAG</a>
	        	<ul class="sub sub6">
					<li><a>기타</a></li>
					<li><a>백팩</a></li>
					<li><a>숄더백</a></li>
					<li><a>클러치백</a></li>
					<li><a>토트백</a></li>
					<li><a>크로스백</a></li>
				</ul>    
	            </li>
	            <li style="width:91px" class="category7"><a href="" onmouseover="this.innerHTML='신발'" onmouseout="this.innerHTML='SHOES'">SHOES</a>
	        	<ul class="sub sub7">
					<li><a>기성화</a></li>
					<li><a>수제화</a></li>
					<li><a>SHOECUS</a></li>
				</ul>    
	            </li>
	            <li style="width:123px" class="category8"><a href="" onmouseover="this.innerHTML='악세사리'" onmouseout="this.innerHTML='ACCESSORY'">ACCESSORY</a>
	        	<ul class="sub sub8">
					<li><a>팔찌</a></li>
					<li><a>양말</a></li>
					<li><a>모자</a></li>
					<li><a>시계</a></li>
					<li><a>장갑/워머</a></li>
					<li><a>지갑</a></li>
					<li><a>안경</a></li>
					<li><a>기타</a></li>
					<li><a>목걸이</a></li>
					<li><a>머플러</a></li>
					<li><a>반지</a></li>
					<li><a>벨트</a></li>
				</ul>    
	            </li>
	            <li style="width:115px" class="category"><a href="" onmouseover="this.innerHTML='신상5%할인'" onmouseout="this.innerHTML='NEW'">NEW</a></li>
	            <li style="width:80px" class="category"><a href="" onmouseover="this.innerHTML='세일'" onmouseout="this.innerHTML='SALE'">SALE</a></li>
			</ul>
		</div>
</div>


<div id="full_main">
	<div id="banner_wrapper " class="banner_wrapper">
			<img  src='../image/banner_acc.jpg'>
			<img class="page" src='../image/banner_top.jpg'>
			<img class="page" src='../image/banner_bot.jpg'>
			<img class="page" src='../image/banner_sho.jpg'>
			<img class="page" src='../image/banner_acc.jpg'>
			<img class="page" src='../image/banner_top.jpg'>
	</div>
        
		<img id="full_banner_prev" src="../image/slide_left.png"/>
		<img id="full_banner_next"  src="../image/slide_right.png"/>

	<div id="slider_pg">
	</div>
	
</div>

<hr class="midHR">
	<div id="content">
	 
		<c:if test="${param.req==null}">
			<jsp:include page="../board/itemList.jsp" />
		</c:if>
	 
		<!-- 로그인화면-->
		<c:if test="${param.req=='loginForm'}">
			<jsp:include page="../shop_member/loginForm.jsp" />
		</c:if>
		
		<!-- 회원가입 화면 -->
		<c:if test="${param.req=='joinForm'}">
			<jsp:include page="../shop_member/JoinForm.jsp" />
		</c:if>
		
		<!-- 상품등록화면 -->
		<c:if test="${param.req=='insertForm'}">
			<jsp:include page="/admin/insertForm.jsp" />
		</c:if>
		
		<!-- 상품등록완료 -->
		<c:if test="${param.req=='insertItem'}">
			<jsp:include page="/admin/insertItem.jsp" />
		</c:if>
		
		<!-- 관리자리스트 -->
		<c:if test="${param.req=='adminList' }">
			<jsp:include page="/admin/adminList.jsp"/>
		</c:if>

		<!-- qna목록
		<c:if test="${param.req=='qnaList'}">
			<jsp:include page="../qna/qnaList.jsp" />
		</c:if>
	 -->
	 
		 <!-- 공지사항 목록 -->
		<c:if test="${param.req=='noticeList'}">
			<jsp:include page="../notice/noticeList.jsp" />
		</c:if>
		
		<!-- 공지사항 보기 -->
		<c:if test="${param.req=='noticeView'}">
			<jsp:include page="../notice/noticeView.jsp" />
		</c:if>
		
		
		
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
	
	<img class="open" src="../image/open.png">
	<img class="close" src="../image/close.png">
	
	<div class="bar_right">
		<div class="bar_div">
			<div class="bar_panel">
				<ul class="panel_board">
					<h2>board<br> ―</h2>
					<li><a href="">notice</a></li>
					<li><a href="">Q &amp; A</a></li>
					<li><a href="">REVIEW</a></li>
				</ul>

					<ul class="panel_info">	
						<h2>HELP DESK<br> ―</h2>
						<p><b>1688-9856</b></p>
						<p>mon - fri 10:30 - 18:30</p>
						<p>lunch time 13:00 - 14:00</p>
						<p><strong>sat, sun, holiday off</strong></p>
					</ul>
					
						<ul class="panel_bank">
								<h2>banking<br>―</h2>
								<p><b>SC제일은행</b><br>157-20-155301</p>
								<p><b>카카오뱅크</b><br>3333-01-5132902</p>
								<p><strong>예금주 : 박시연</strong></p>
						</ul>
					</div>
				<div class="">
					<h3><a href="">view item<br>―</a></h3>
					<ul>
						<li class="">
							<a href=""><img src="" alt=""></a>
							</li>
							<li class="">
							<a href=""><img src="" alt=""></a>
						</li>
					</ul>
							<p class="view_item">
								<img src="../image/view_prev.gif" alt="이전 제품" class="prev">
								<img src="../image/view_next.gif" alt="다음 제품" class="next">
							 </p>
					</div>
				</div>
			</div>
</body>
</html>