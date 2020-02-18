<%@ page pageEncoding =  "utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri = "http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset = "utf-8"/>
	<title>Insert title here</title>
	<base href="${pageContext.servletContext.contextPath}/">
	<link href="resource/css/them.css" type="text/css" rel="stylesheet">
	<style type="text/css">
		.message{
			text-align:center;
			font-size: 18px;
			color: #ff0000;}
	</style>
</head>
<body  style="background: #f2f2f2">
<%@ include file="../a/header.jsp" %>
<%@ include file="../a/quanlyTC.jsp" %>
	<div class="container2">
		<div class="message">${message }</div>
		<form action="luutruyenchu/${matruyen}.htm" method="post" enctype="multipart/form-data">
			<div>
				<label>Tập</label>
				<input type="text" name="tap" value="${Tap }" placeholder="Nhập tập...">
			</div>	
			<br>
			<div>
				<label>Tên Tập</label>
				<input type="text" name="tentapTC" value="${tenTap }" placeholder="Nhập tên tập...">
			</div>
			<br>
			<div class="form-group">
				<label>Nội dung</label>
				<input type="file" name="noidung">
			</div>
			<br>
			
			<div>
				 <input type="submit" value="Thêm">
		
		</form>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>