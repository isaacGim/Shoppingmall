<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA등록완료</title>
<style type="text/css">
.insert_ok{
	width: 30%;
	height:300px;
	margin: 0 35%;
	margin-bottom:100px;
	padding:100 250;
	text-align: center;
	border: 1px solid lightgrey;
	padding-top: 120px;
	padding-bottom: 120;
}
.inse {
	background-color: lightgrey;
}
</style>
</head>
<body>

<div class="insert_ok">
	<c:if test="${result == 1}">
		<p>QNA가 등록되었습니다.</p>
	</c:if>
	<c:if test="${result == 0 }">
		<p>QNA 등록에 실패하였습니다.<p>
	</c:if>
	<br>
	<button class="inse" onclick="location.href='../main/index'">HOME</button>
</div>

</body>
</html>