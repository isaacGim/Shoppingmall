<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 대분류 -->	
		<select name="item_category" id="category1" >
			<option>---- 대분류선택 ----</option>
			<option  value="item_outwear" data-target="#category2-1" >아웃웨어</option>
			<option  value="item_tee" data-target="#category2-2" >티</option>
			<option  value="item_shirts" data-target="#category2-3" >셔츠</option>
			<option  value="item_pants" data-target="#category2-4" >팬츠</option>
			<option  value="item_bag" data-target="#category2-5" >가방</option>
			<option  value="item_shoes" data-target="#category2-6" >신발</option>
			<option  value="item_acc" data-target="#category2-7" >악세사리</option>
			<option  value="신상" >신상</option>
			<option  value="세일" >세일</option>
		</select>
						

<!--소분류  -->
		<select name="item_detail_category" id="category2-1">
				<option>---- 소분류선택 ----</option>
				<option value="item_cardigan">가디건</option>
				<option value="item_coat">코트</option>
				<option  value="item_padding">패딩</option>
				<option  value="item_poncho">숄/판초</option>
				<option value="item_vest">베스트</option>
				<option value="item_jacket">자켓/블레이져</option>
				<option value="item_zipup">점퍼/집업</option>
		</select>
		
		<select name="item_detail_category" id="category2-2">
				<option>---- 소분류선택 ----</option>
				<option value="item_long">긴팔</option>
				<option value="item_half">반팔</option>
				<option  value="item_collar">카라</option>
				<option  value="item_losefit">롱/루즈핏</option>
				<option value="item_sleeveless">민소매</option>
				<option value="item_knit">니트</option>
				<option value="item_slim">슬림/베이직핏</option>
				<option value="item_hood">후드</option>
		</select>
		
		<select name="item_detail_category" id="category2-3">
				<option>---- 소분류선택 ----</option>
				<option value="item_longs">긴팔</option>
				<option value="item_halfs">반팔</option>
				<option value="item_losefits">롱/루즈핏</option>
				<option  value="item_checks">체크</option>
				<option value="item_slims">베이직/슬림핏</option>		
		</select>
		
		<select name="item_detail_category" id="category2-4">
				<option>---- 소분류선택 ----</option>
				<option value="item_skinny">스키니</option>
				<option value="item_longp">긴바지</option>
				<option  value="item_onep">일자바지</option>
				<option  value="item_baggyp">배기바지</option>
				<option value="item_halfp">반바지</option>
				<option value="item_slexp">슬랙스</option>
				<option value="item_joggerp">조거</option>
				<option value="item_bootsp">부츠컷</option>
		</select>
		
		<select name="item_detail_category" id="category2-5">
				<option>---- 소분류선택 ----</option>
				<option value="item_etc">기타</option>
				<option value="item_back">백팩</option>
				<option  value="item_shoulder">숄더백</option>
				<option  value="item_clutch">클러치백</option>
				<option value="item_tote">토트백</option>
				<option value="item_cross">크로스백</option>
		</select>
		
		<select name="item_detail_category" id="category2-6">
				<option>---- 소분류선택 ----</option>
				<option value="item_ready">기성화</option>
				<option value="item_hand">수제화</option>
				<option  value="item_shoescus">SHOECUS</option>
		</select>
		
		<select name="item_detail_category" id="category2-7">
				<option>---- 소분류선택 ----</option>
				<option value="item_bracelet">팔찌</option>
				<option value="item_socks">양말</option>
				<option  value="item_cap">모자</option>
				<option  value="item_watch">시계</option>
				<option value="item_glove">장갑/워머</option>
				<option value="item_wallet">지갑</option>
				<option value="item_glasses">안경</option>
				<option value="item_etcc">기타</option>
				<option value="item_necklace">목걸이</option>
				<option value="item_muffler">머플러</option>
				<option value="item_ring">반지</option>
				<option value="item_belt">벨트</option>
		</select>
</body>
</html>