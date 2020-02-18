<%@ page pageEncoding =  "utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
	<base href="${pageContext.servletContext.contextPath}/">
	<meta charset = "utf-8"/>
	<title>Xem Ảnh</title>
	
	<link href="resource/css/them.css" type="text/css" rel="stylesheet">
	<style type="text/css">
		.themanh{
			text-align: center;
			margin-top: 20px;
		}
		.form-group{
			text-align: center;	
		}
		.submit{
		text-align: center;	
		}
	</style>
</head>
<body  style="background: #f2f2f2">
<%@ include file="../a/header.jsp" %>
	<br>
	<section class="themanh">
		<img alt="" src="${pageContext.servletContext.contextPath}${anh}">
	</section>
	<section class="container2">
		<form action="themanhtruyen/${matruyen}.htm" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label>Thay đổi ảnh: </label>
				<input type="file" name="anh" >
			</div>
			<div class="submit"><input type="submit" value="Cập nhật"></div>
			 
		</form>
	</section>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>