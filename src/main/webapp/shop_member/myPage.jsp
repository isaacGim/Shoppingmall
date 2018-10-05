<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/bg2.css" />
</head>
<body>
<p style="text-align: right;"><a href="../main/index.jsp">HOME</a> > 마이 쇼핑</p>
<h2 style="text-align: center;">My Page</h2>
<hr width="100px">
<div style="border-bottom: 2px solid black;" >
 <fieldset>
<legend>MY PAGE</legend>	
	<div class="myPage" >
		<img alt="First" src="../image/mypage.gif" style=" border-right: 1px solid gray; float: left;">
		<p align="center" >
		저희 쇼핑몰을 이용해 주셔서 감사합니다. 회원님은 <b>[퍼스트리멤버]</b> 회원입니다. <br>
		<b>무통장 입금으로 50,000원 이상</b> 구매시 <b>1%</b>을 추가할인 받으실 수 있습니다.</p>
			<hr width="100%">
				<h4>주소를 복사하여 친구를 쇼핑몰에 초대해보세요.</h4>
			<ul >
				<li><input type="text" value="http://localhost:8080/Project2/main/index.jsp" style="width: 50%;"><button>주소복사</button></li>
				<li>-친구에게는 가입즉시 2,000원의 적립금이 지급됩니다.</li>
				<li>-회원님에게는 초대된 친구 구매 이후 쇼핑몰 운영자가 적립금을 수동 지급합니다.</li>
			</ul>
	</div>
	<br>
	<br>
	
	<div class="myPage_info" >
		<ul class="mp_fi">
			<li><p>> 가용적립금<span style="float: right;"><b>2,000원</b><button>조회</button></span></p></li>
			<li><p>> 사용적립금<b style="float: right; margin-right: 3em;">0원</b></p></li>
			<li><p>> 쿠폰<span style="float: right;"><b>4개</b><button>조회</button></span></p></li>
		</ul>
		<ul class="mp_se">	
			<li><p>> 총적립금<b style="float: right;">2,000원</b></p></li>
			<li><p>> 총주문<b style="float: right; ">0(0회)</b></p></li>
		</ul>
	</div>
	
	<div class="block">
	<div class="order">
		<h3>ORDER</h3>
		<div>
			<a><img  style="width: 100%;height:100%; "  alt="order" src="../image/order.jpg"></a>
		</div>
	</div>
	
	<div class="profile">
		<h3>PROFILE</h3>
		<div>
			<a><img alt="order" src="../image/profile.jpg"> </a>
		</div>
	</div>
	
	<div class="wishlist">
		<h3>WISHLIST</h3>
		<div>
			<a><img alt="order" src="../image/wishlist.jpg"> </a>
		</div>
	</div>
	</div>
 </fieldset>
</div>
</body>
</html>