<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload = function() {
	var review_num = ${review_num};
	var pg = ${pg};
	if(${result} > 0){
		location.href="/Shoppingmall/review/reviewView?no="+review_num+"&pg="+pg;
	}
}
</script>
</head>
<body>
</body>
</html>