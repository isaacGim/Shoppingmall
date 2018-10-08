<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload = function() {
	if(${result} > 0){
		location.href="/Shoppingmall/review/reviewList?pg="+${pg};
	}
}
</script>
</head>
<body>

</body>
</html>