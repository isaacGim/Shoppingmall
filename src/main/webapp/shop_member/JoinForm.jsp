<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
	
	<title>Join</title>
<!--  
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
-->



<style type="text/css">


#upper {
 text-align:center;

}

body {	
    font-size: 10px;
}
			
table{
	width:100%; 

	
}
		
td{
	height: 50px;
	border-bottom:1.3px solid #F2F2F2;
	border-top:1.3px solid #F2F2F2;
	font-size:10px;							
}
		
#title{
	width : 100px;
	background-color:#FBFAFA;
    font-size: 10px;
    
    
    
}
select{
 font-size: 12.5px;
}
</style>
	
	
		
 
 <!-- 
	<script type="text/javascript">
	
		function checkValue()
		{
			if(!document.userInfo.id.value){
				alert("아이디를 입력하세요.");
				return false;
			}
			
			if(!document.userInfo.password.value){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			
			if(document.userInfo.password.value != document.userInfo.passwordcheck.value ){
				alert("비밀번호를 동일하게 입력하세요.");
				return false;
			}
		}
	</script>
	 
 -->
 <script type="text/javascript" src="js/jquery-3.3.1-min.js"></script>
 <script type="text/javascript">
 	$(document).ready(function() {
 		<!--
 		var password = $('tr:eq(1)').find('td:last > input').val();
 		var passwordVerify = $('tr:eq(2)').find('td:last').children().val();
 		-->
 		
 		$('form#joinForm').on('submit', function() {
 			var pwd = $('input[name="pwd"]').val();
 			var pwdVerify = $('input[name=pwdVerify]').val();
 
 			if(pwd != pwdVerify) {
 				alert('비밀번호와 비밀번호 확인이 다릅니다.');
 				return false;
 			}
 		});
 		
 		$('input[id="idChecker"]').on('click', function() {
 			var id = $('input[name="id"]').val();
 			
 			$.post('/Shoppingmall/ajax/idChecker.jsp', {id: id}, function(data) {
 				var valid = $(data).find('result').text();
				valid = eval(valid);
 				
 				if(!valid) $('span#idResult').text('중복된 아이디가 없습니다.');
 				else $('span#idResult').text('중복된 아이디가 있습니다. 다시 입력해주세요');
 			});
 		});
 	});
 </script>
</head>
<body>

 <div id="upper">
		<br><br>
		<b><font size="3" color="">JOIN US</font></b>
		<br><br><br>
</div>
<div>		
		
		<form method="post" action="/Shoppingmall/shop_member/join" id="joinForm">
			<table>
			
				<tr>
					<td id="title">&nbsp;&nbsp;아이디</td>
					<td>
						<input type="text" name="id" size="15" maxlength="50">
						
						<input type="button" id="idChecker" value="중복확인"><span id="idResult"></span>	
					</td>
				</tr>
						
				<tr>
					<td id="title">&nbsp;&nbsp;비밀번호</td>
					<td>
						<input type="password" name="pwd" maxlength="50">
					</td>
				</tr>
				<tr>
					<td id="title">&nbsp;&nbsp;비밀번호 확인</td>
					<td>
						<input type="password" name="pwdVerify" size="20" maxlength="50">
					</td>
				</tr>
				
				<tr>
					<td id="title">&nbsp;&nbsp;비밀번호 확인 질문</td>
					<td>
				   <select name="pwd_chk_q" >
					  <option value="기억">기억에 남는 추억의 장소는?</option>
					  <option value="좌우명">자신의 인생 좌우명은?</option>
					  <option value="보물">자신의 보물 제1호는?</option>
					  <option value="선생님">가장 기억에 남는 선생님 성함은?</option>
					  <option value="신체비밀">타인이 모르는 자신만의 신체비밀이 있다면?</option>
					  <option value="추억">추억하고 싶은 날짜가 있다면?</option>
					  <option value="선물">받았던 선물 중 기억에 남는 독특한 선물은?</option>
					  <option value="친구">유년시절 가장 생각나는 친구 이름은?</option>
					  <option value="책">인상 깊게 읽은 책 이름은?</option>
					</select>
						
				
					</td>
				</tr>
					<tr>
					<td id="title">&nbsp;&nbsp;비밀번호 확인 답변</td>
					<td>
						<input type="text" name="pwd_chk_a" maxlength="50" size="30">
					</td>
				</tr>
					<tr>
					<td id="title">&nbsp;&nbsp;이름</td>
					<td>
						<input type="text" name="name" maxlength="50" size="20">
					</td>
				</tr>
					<tr>
					<td id="title">&nbsp;&nbsp;이름(영문)</td>
					<td>
						<input type="text" name="ename" maxlength="50" size="20">(&nbsp;이름 - 성 형식으로 입력해 주세요.&nbsp;)
					</td>
				</tr>
					<tr>
					<td id="title">&nbsp;&nbsp;주소</td>
					
					<td>
					    <br> 
						<input type="text" name=""  size="8"> 우편번호<br><br>
						<input type="text" name="addr1" size="30"> 기본주소 <br><br>
						<input type="text" name="addr2" size="30"> 나머지주소<br><br>
				
				<!--	
						<input type="text" name="" class="postcodify_postcode5" value="" />
						<button id="postcodify_search_button">검색</button><br />
						<input type="text" name="" class="postcodify_address" value="" /><br />
						<input type="text" size="30" name="addr1" class="postcodify_details" value="" /><br />
						<input type="text" size="30" name="addr2" class="postcodify_extra_info" value="" /><br />
			 -->			
					</td>
				</tr>
					<tr>
					<td id="title">&nbsp;&nbsp;일반전화</td>
					<td> 
					<select name="tel1" style="width:60px" >
						<option value="031">02</option>
						<option value="031">031</option>
						<option value="032">032</option>
						<option value="033">033</option>
						<option value="041">041</option>
						<option value="042">042</option>
						<option value="043">043</option>
						<option value="041">044</option>
						<option value="041">051</option>
						<option value="041">052</option>
						<option value="041">053</option>
						<option value="041">054</option>
						<option value="041">055</option>
						<option value="041">061</option>
						<option value="041">062</option>
						<option value="041">063</option>
						<option value="041">064</option>
						<option value="041">0502</option>
						<option value="041">0503</option>
						<option value="041">0504</option>
					</select> -
					<input name="tel2" size="6" id="telno2" maxlength="4" > -
					<input name="tel3" size="6" id="telno2" maxlength="4"  >
	  				
					</td>
									
				</tr>
					<tr>
					<td id="title">&nbsp;&nbsp;휴대전화</td>
					<td>
						<select name="phone1" style="width:60px" >
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
						
					</select> -
					<input name="phone2" size="6" id="mobile2" maxlength="4" > -
					<input name="phone3" size="6" id="mobile3" maxlength="4" >
	  		
					</td>
				</tr>
					<tr>
					<td id="title">&nbsp;&nbsp; sms 수신여부</td>
					<td>
					   <input type="checkbox" name="chk_sms" value="">동의함 </br>
					   &nbsp;&nbsp; 쇼핑몰에서 제공하는 유익한 이벤트 소식을 SMS로 받으실 수 있습니다.		
					</td>
				</tr>
					<tr>
					<td id="title">&nbsp;&nbsp;이메일</td>
					<td>
						<input type="text" name="email1" maxlength="50">@
						<select name="email2">
							<option value="" selected disabled hidden>-이메일 선택-</option>
							<option value="naver">naver.com</option>
							<option value="daum">daum.net</option>
							<option value="nate">nate.com</option>
							<option value="hotmail">hotmail</option>	
							<option value="yahoo">yahoo.com</option>	
							<option value="empas">empas.com</option>	
							<option value="korea">korea.com</option>	
							<option value="dream">dreamwiz.com</option>	
							<option value="gmail">gmail.com</option>	
														
						</select>
					</td>
				</tr>
					
				<tr>
					<td id="title">&nbsp;&nbsp;이메일 수신여부</td>
					<td>
					<input type="checkbox" name="chk_mail" value="">동의함 <br>
					&nbsp;&nbsp;쇼핑몰에서 제공하는 유익한 이벤트 소식을 이메일로 받으실 수 있습니다.
					</td>
				</tr>
					
				
				
				<tr style="height:65px; ">	
				    <td style="padding-top:40px; font-size:15px">추가정보</td>
					  
					
						
		
				</tr>
					
				
				
					
				<tr>
					<td id="title">&nbsp;&nbsp;성별</td>
					<td>
						<input type="radio" name="gender" value="남" checked>남
						<input type="radio" name="gender" value="여" checked>여
					</td>
				</tr>
					
				<tr>
					<td id="title">&nbsp;&nbsp;생년월일</td>
					<td>
						<input type="text" name="birth_year" maxlength="4" placeholder="년(4자)" size="6" >
						년
						<input type="text" name="birth_month" maxlength="2" placeholder="월" size="4" >
						월
						<input type="text" name="birth_day" maxlegth="2" placeholder="일" size="4">
						일
						<input type="radio" name="birth_solar_lunar" value="양력">양력
						<input type="radio" name="birth_solar_lunar" value="음력">음력


					</td>
				</tr>
					<tr>
					<td id="title">&nbsp;&nbsp;직업</td>
					<td>
						<select name="job">
							<option value="" selected disabled hidden>선택</option>
							<option value="student">학생</option>
							<option value="employee">회사원</option>
							<option value="employer">자영업</option>	
							<option value="jobless">무직</option>
							<option value="etc">기타</option>	
														
						</select>
					</td>
				</tr>
					<tr>
					<td id="title">&nbsp;&nbsp;관심분야</td>
					<td>
						<input type="checkbox" name="interest" value="ani">애니메이션 
						<input type="checkbox" name="interest" value="movie">영화/연극 
						<input type="checkbox" name="interest" value="themepark">놀이공원 
						<input type="checkbox" name="interest" value="luck">경품정보 
						<input type="checkbox" name="interest" value="gallery">미술전시회
						<input type="checkbox" name="interest" value="">콘서트 
						<input type="checkbox" name="interest" value="fashion">패션/미용 
						<input type="checkbox" name="interest" value="politic">정치 
						<input type="checkbox" name="interest" value="IT/정보통신">IT/정보통신 
						<input type="checkbox" name="interest" value="sports">스포츠 
						<input type="checkbox" name="interest" value="cook">요리/음식 
						<input type="checkbox" name="interest" value="star">연예인
						<input type="checkbox" name="interest" value="woman">여성/주부
						<input type="checkbox" name="interest" value="baby">육아 
						<input type="checkbox" name="interest" value="stock">주식/증권
						<input type="checkbox" name="interest" value="game">컴퓨터/게임
						<input type="checkbox" name="interest" value="health">건강/의료
						<input type="checkbox" name="interest" value="travel">여행
						<input type="checkbox" name="interest" value="shopping">쇼핑
						<input type="checkbox" name="interest" value="language">어학
						<input type="checkbox" name="interest" value="etcc">기타등등	
					</td>
				</tr>
					<tr>
					<td id="title">&nbsp;&nbsp;가입키워드나 경로</td>
					<td>
						<input type="checkbox" name="path" value="facebook">페이스북
						<input type="checkbox" name="path" value="insta">인스타그램
						<input type="checkbox" name="path" value="search">인터넷검색
						<input type="checkbox" name="path" value="people">주변소개
						<input type="checkbox" name="path" value="etc2">기타
					</td>
				</tr>
					
				<tr>
					<td id="title">&nbsp;&nbsp;리멤버클릭가입이유</td>
					<td>
						<input type="text" name="reason" maxlength="50">
					
					</td>
				</tr>
					
				<tr>
					<td id="title">&nbsp;&nbsp;추천인아이디</td>
					<td>
						<input type="text" name="recommend" />
					</td>
				</tr>
				<tr>
					<td id="title">&nbsp;&nbsp;환불계좌 정보</td>
					<td>
					   <br>
						예금주&nbsp;&nbsp;<input type="text" name="accounter" /></br><br>
						은행명 &nbsp;
						<select name="bank_name">
							<option value="" selected disabled hidden>-은행선택-</option>
							<option value="jeju">제주은행</option>
							<option value="jb">전북은행</option>
							<option value="kn">경남은행</option>	
							<option value="city">씨티은행</option>
							<option value="post">우체국</option>	
							<option value="keb">KEB하나은행</option>	
							<option value="nh">농협</option>	
							<option value="sae">새마을금고</option>	
							<option value="san">산업은행</option>	
							<option value="kakao">카카오뱅크</option>	
							<option value="ki">기업은행</option>	
							<option value="kuk">국민은행</option>	
							<option value="hwan">외환은행</option>	
							<option value="su">수협</option>	
							<option value="we">우리은행</option>	
							<option value="sin">신한은행</option>	
							
														
						</select> </br><br>
						계좌번호
						<input type="text" name="account_num" /> <br><br>
					</td>
				</tr>
				
			
			</table>
		<div>
		
		
		 
		</div>
		<table>
		<tr style="height:65px; ">	
				    <td style="padding-top:40px; font-size:15px">이용약관 동의</td>
					  
					
						
		
				</tr>
		</table>
		
		
		<div style="width:100%; height: 500px; border:1px solid black text-align:center">
		<textarea style="resize:none; width:100%; height:400px;">
		                                 전자상거래(인터넷사이버몰) 표준약관                 
                                           
                                           
                                           
                                                   제10023호(2010. 12. 17. 개정)
 

 
 
 
 
제1조(목적) 이 약관은 에쓰와이 어패럴(전자상거래 사업자)이 운영하는 리멤버클릭 (이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.
 
※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다」
 
제2조(정의)
 
① “몰”이란 OO 회사가 재화 또는 용역(이하 “재화등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터등 정보통신설비를 이용하여 재화등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
 
② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
 
③ ‘회원’이라 함은 “몰”에 개인정보를 제공하여 회원등록을 한 자로서, “몰”의 정보를 지속적으로 제공받으며, “몰”이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
 
④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.
 
제3조 (약관등의 명시와 설명 및 개정)
① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호․모사전송번호․전자우편주소, 사업자등록번호, 통신판매업신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 00 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
 
② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회․배송책임․환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.
 
③ “몰”은 전자상거래등에서의소비자보호에관한법률, 약관의규제에관한법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진등에관한법률, 방문판매등에관한법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
 
④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일이전부터 적용일자 전일까지 공지합니다.
다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "몰“은 개정전 내용과 개정후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.
 
⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간내에 ‘몰“에 송신하여 ”몰“의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.
 
⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래등에서의소비자보호에관한법률, 약관의규제등에관한법률, 공정거래위원회가 정하는 전자상거래등에서의소비자보호지침 및 관계법령 또는 상관례에 따릅니다.
 
제4조(서비스의 제공 및 변경)
 
① “몰”은 다음과 같은 업무를 수행합니다.
 
1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결
2. 구매계약이 체결된 재화 또는 용역의 배송
3. 기타 “몰”이 정하는 업무
 
② “몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.
 
③ “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.
 
④ 전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.
 
제5조(서비스의 중단)
 
① “몰”은 컴퓨터 등 정보통신설비의 보수점검․교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.
 
② “몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.
 
③ 사업종목의 전환, 사업의 포기, 업체간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.
 
제6조(회원가입)
 
① 이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.
 
② “몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각호에 해당하지 않는 한 회원으로 등록합니다.
 
1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.
2. 등록 내용에 허위, 기재누락, 오기가 있는 경우
3. 기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우
 
③ 회원가입계약의 성립시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.
 
④ 회원은 제15조제1항에 의한 등록사항에 변경이 있는 경우, 즉시 전자우편 기타 방법으로 “몰”에 대하여 그 변경사항을 알려야 합니다.
 
제7조(회원 탈퇴 및 자격 상실 등)
 
① 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다.
 
② 회원이 다음 각호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.
 
1. 가입 신청시에 허위 내용을 등록한 경우
2. “몰”을 이용하여 구입한 재화등의 대금, 기타 “몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우
3. 다른 사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우
4. “몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우
 
③ “몰”이 회원 자격을 제한․정지 시킨후, 동일한 행위가 2회이상 반복되거나 30일이내에 그 사유가 시정되지 아니하는 경우 “몰”은 회원자격을 상실시킬 수 있습니다.
 
④ “몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.
 
제8조(회원에 대한 통지)
 
① “몰”이 회원에 대한 통지를 하는 경우, 회원이 “몰”과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.
 
② “몰”은 불특정다수 회원에 대한 통지의 경우 1주일이상 “몰” 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.
 
제9조(구매신청) “몰”이용자는 “몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “몰”은 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다. 단, 회원인 경우 제2호 내지 제4호의 적용을 제외할 수 있습니다.
 
1. 재화등의 검색 및 선택
2. 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력
3. 약관내용, 청약철회권이 제한되는 서비스, 배송료․설치비 등의 비용부담과 관련한 내용에 대한 확인
4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)
5. 재화등의 구매신청 및 이에 관한 확인 또는 “몰”의 확인에 대한 동의
6. 결제방법의 선택
 
제10조 (계약의 성립)
 
① “몰”은 제9조와 같은 구매신청에 대하여 다음 각호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.
 
1. 신청 내용에 허위, 기재누락, 오기가 있는 경우
2. 미성년자가 담배, 주류등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우
3. 기타 구매신청에 승낙하는 것이 “몰” 기술상 현저히 지장이 있다고 판단하는 경우
 
② “몰”의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.
 
③ “몰”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소등에 관한 정보등을 포함하여야 합니다.
 
제11조(지급방법) “몰”에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각호의 방법중 가용한 방법으로 할 수 있습니다. 단, “몰”은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.
 
1. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체
2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제
3. 온라인무통장입금
4. 전자화폐에 의한 결제
5. 수령시 대금지급
6. 마일리지 등 “몰”이 지급한 포인트에 의한 결제
7. “몰”과 계약을 맺었거나 “몰”이 인정한 상품권에 의한 결제
8. 기타 전자적 지급 방법에 의한 대금 지급 등
 
제12조(수신확인통지․구매신청 변경 및 취소)
 
① “몰”은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.
 
② 수신확인통지를 받은 이용자는 의사표시의 불일치등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 “몰”은 배송전에 이용자의 요청이 있는 경우에는 지체없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.
 
제13조(재화등의 공급)
 
① “몰”은 이용자와 재화등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, “몰”이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 2영업일 이내에 조치를 취합니다. 이때 “몰”은 이용자가 재화등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.
 
② “몰”은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 “몰”이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 “몰”이 고의․과실이 없음을 입증한 경우에는 그러하지 아니합니다.
 
제14조(환급) “몰”은 이용자가 구매신청한 재화등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 2영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.
 
제15조(청약철회 등)
 
① “몰”과 재화등의 구매에 관한 계약을 체결한 이용자는 수신확인의 통지를 받은 날부터 7일 이내에는 청약의 철회를 할 수 있습니다.
 
② 이용자는 재화등을 배송받은 경우 다음 각호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.
 
1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)
2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우
3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우
4. 같은 성능을 지닌 재화등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우
 
③ 제2항제2호 내지 제4호의 경우에 “몰”이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회등이 제한되지 않습니다.
 
④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화등을 공급받은 날부터 3월이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.
 
제16조(청약철회 등의 효과)
 
① “몰”은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화등의 대금을 환급합니다. 이 경우 “몰”이 이용자에게 재화등의 환급을 지연한 때에는 그 지연기간에 대하여 「전자상거래등에서의 소비자보호에 관한 법률 시행령」이 정하는 지연이자율(연 100분의 24)을 곱하여 산정한 지연이자를 지급합니다.
 
② “몰”은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화등의 대금을 지급한 때에는 지체없이 당해 결제수단을 제공한 사업자로 하여금 재화등의 대금의 청구를 정지 또는 취소하도록 요청합니다.
 
③ 청약철회등의 경우 공급받은 재화등의 반환에 필요한 비용은 이용자가 부담합니다. “몰”은 이용자에게 청약철회등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회등을 하는 경우 재화등의 반환에 필요한 비용은 “몰”이 부담합니다.
 
④ 이용자가 재화등을 제공받을때 발송비를 부담한 경우에 “몰”은 청약철회시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.
 
제17조(개인정보보호)
 
① “몰”은 이용자의 정보수집시 구매계약 이행에 필요한 최소한의 정보를 수집합니다. 다음 사항을 필수사항으로 하며 그 외 사항은 선택사항으로 합니다.
 
1. 성명
2. 주민등록번호(회원의 경우) 또는 외국인등록번호
3. 주소
4. 전화번호
5. 희망ID(회원의 경우)
6. 비밀번호(회원의 경우)
7. 전자우편주소(또는 이동전화번호)
 
② “몰”이 이용자의 개인식별이 가능한 개인정보를 수집하는 때에는 반드시 당해 이용자의 동의를 받습니다.
 
③ 제공된 개인정보는 당해 이용자의 동의없이 목적외의 이용이나 제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 몰이 집니다. 다만, 다음의 경우에는 예외로 합니다.
 
1. 배송업무상 배송업체에게 배송에 필요한 최소한의 이용자의 정보(성명, 주소, 전화번호)를 알려주는 경우
2. 통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우
3. 재화등의 거래에 따른 대금정산을 위하여 필요한 경우
4. 도용방지를 위하여 본인확인에 필요한 경우
5. 법률의 규정 또는 법률에 의하여 필요한 불가피한 사유가 있는 경우
 
④ “몰”이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 정보통신망이용촉진등에관한법률 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.
 
⑤ 이용자는 언제든지 “몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “몰”은 이에 대해 지체없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 “몰”은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.
 
⑥ “몰”은 개인정보 보호를 위하여 관리자를 한정하여 그 수를 최소화하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.
 
⑦ “몰” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체없이 파기합니다.
 
제18조(“몰“의 의무)
 
① “몰”은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화․용역을 제공하는데 최선을 다하여야 합니다.
 
② “몰”은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.
 
③ “몰”이 상품이나 용역에 대하여 「표시․광고의공정화에관한법률」 제3조 소정의 부당한 표시․광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.
 
④ “몰”은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.
 
제19조(회원의 ID 및 비밀번호에 대한 의무)
 
① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.
 
② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.
 
③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “몰”에 통보하고 “몰”의 안내가 있는 경우에는 그에 따라야 합니다.
 
제20조(이용자의 의무) 이용자는 다음 행위를 하여서는 안됩니다.
 
1. 신청 또는 변경시 허위 내용의 등록
2. 타인의 정보 도용
3. “몰”에 게시된 정보의 변경
4. “몰”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시
5. “몰” 기타 제3자의 저작권 등 지적재산권에 대한 침해
6. “몰” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위
 
제21조(연결“몰”과 피연결“몰” 간의 관계)
 
① 상위 “몰”과 하위 “몰”이 하이퍼 링크(예: 하이퍼 링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 “몰”(웹 사이트)이라고 하고 후자를 피연결 “몰”(웹사이트)이라고 합니다.
 
② 연결“몰”은 피연결“몰”이 독자적으로 제공하는 재화등에 의하여 이용자와 행하는 거래에 대해서 보증책임을 지지 않는다는 뜻을 연결“몰”의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증책임을 지지 않습니다.
 
제22조(저작권의 귀속 및 이용제한)
 
① “몰“이 작성한 저작물에 대한 저작권 기타 지적재산권은 ”몰“에 귀속합니다.
 
② 이용자는 “몰”을 이용함으로써 얻은 정보 중 “몰”에게 지적재산권이 귀속된 정보를 “몰”의 사전 승낙없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.
 
③ “몰”은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.
 
제23조(분쟁해결)
 
① “몰”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치․운영합니다.
 
② “몰”은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.
 
③ “몰”과 이용자간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시·도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.
 
제24조(재판권 및 준거법)
 
① “몰”과 이용자간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.
 
② “몰”과 이용자간에 제기된 전자상거래 소송에는 한국법을 적용합니다.

 제25조

 

#카카오 알림톡 시행에 관한 내용



① “몰”은 회원가입, 주문안내, 배송안내 등 비광고성 정보를 카카오톡 알림톡으로 알려드리며, 만약 알림톡 수신이 불가능하거나 수신 차단하신 경우에는 일반 문자메시지로 보내드립니다. 



② 카카오 알림톡을 통해 안내되는 정보를 와이파이가 아닌 이동통신망으로 이용할 경우, 알림톡 수신 중 데이터 요금이 발생할 수 있습니다. 



③ 카카오톡을 통해 발송되는 알림톡 수신을 원치 않으실 경우 반드시 알림톡을 차단하여 주시기 바랍니다.

 
 
<참 고 자 료>
 
 
1. 표준약관 현행
 
 
2. 한국소비자원의 심사청구 공문
 
 
3. 관련 사업자단체 의견
 
		 
		</textarea>
		
		
					
					<input type="checkbox" name="chk_doc" id="checkbox" value="이용약관에 동의하십니까?" >이용약관에 동의하십니까? <br>
					
						

		</div>
		<div style="text-align: center; margin: 0 auto:">
			<input type="submit" onClick="check()" value="회원가입"/>  <input type="button" value="회원가입취소"><br><br>
		</div>
		</form>
	</div>


	<br>
	<!--  <script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script> -->
	<script>
		function check(){
			var check = document.getElementById('checkbox').checked
			!check ? alert('이용약관에 동의하셔야 합니다.') : null
		}
	</script>
</body>
</html>