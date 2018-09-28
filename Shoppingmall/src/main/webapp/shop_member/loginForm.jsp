<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/bg.css" />
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('.click_loginbox').click(function(event) {
			event.preventDefault();
			event.stopPropagation();
			// event.preventDefault : 본래 기능을 상실시켜준다.
			// event.stopPropagation : 부모 태그들에게 이벤트가 복산된다.(Bubble up)
			// return false : 두개를 동시에 해준다.
			$('#loginForm').submit();
		});
	});
</script>
</head>
<body id="loginForm_body" style="text-align: center;">
<form action="/Shoppingmall/shop_member/login" id="loginForm" name="loginForm" method="post">
<p style="text-align: right;"><a href="../main/index.jsp">HOME</a> > 로그인</p>
<h2  >MEMBER LOGIN</h2>
<hr width="100px">
<div class="loginForm">
 <fieldset>
<legend>MEMBER LOGIN</legend>
            <label class="id" for="member_id"  ><span style="margin-right: 2em;" >ID</span>
            	<input size="20" type="text" id="member_id" name="member_id"  >
            </label><br>
            
            <label class="passwd" for="member_passwd"><span style="margin-right: 2em;" >PW</span>
            	<input  type="password" id="member_passwd" name="member_passwd" >
            </label>
            <p class="security" style="font-size: 11px;">
                <input id="checkbox"  type="checkbox" >
                	<label for="checkbox" >아이디 저장</label>                
                 <img src="../image/access.gif" alt="보안접속"  style="padding-left: 20px;"> 보안접속
                 </p>
            <a class="click_loginbox">LOGIN</a><br><br>
            
            <ul>
            	<li>아이디를 잊어버리셨나요?<a href="">FIND ID</a></li>
                <li>비밀번호를 잊어버리셨나요?<a href="">FIND PASSWORD</a></li>
            </ul>                         
            <br><br>
            
		<ul class="snsArea">
			<li class=""><a href="" onclick=""><img src="../image/naver.gif" alt="네이버 로그인"></a></li>
			 <li class=""> <a href="" onclick=""><img src="../image/facebook.gif" alt="페이스북 로그인"></a></li>
		        <li class=""><a href="" onclick=""><img src="../image/google.gif" alt="구글 로그인"></a></li>
		        <li class=""><a href="" onclick=""><img src="../image/kakao.gif" alt="카카오 로그인"/></a></li>
		</ul>
			
	<p class="link">                
                <a class="click_joinbox">JOIN US </a>
                <br><br>
                회원가입을 하시면 다양하고 특별한 혜택이 준비되어 있습니다.
            </p>
     
      <br><br>
        </fieldset>
</div>
</form>
</body>
</html>