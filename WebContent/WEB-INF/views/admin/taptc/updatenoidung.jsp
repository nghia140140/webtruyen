<%@ page pageEncoding =  "utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset = "utf-8"/>
	<title>Insert title here</title>
	<base href="${pageContext.servletContext.contextPath }/">
	<link href="resource/css/them.css" type="text/css" rel="stylesheet">
	<style type="text/css">
		.form-group{
			margin: 5px;
		}
	</style>
</head>
<body  style="background: #f2f2f2">
<%@ include file="../a/header.jsp" %>
<%@ include file="../a/quanlyTC.jsp" %>
	<section class="container2">
		${message}
		<form action="updateNoidung/${matruyen}" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<div>Nội dung</div>
				<input type="file" name="noidung">
			</div>
			<div>
			<input type="submit" value="Thay đổi">
			</div>
		</form>
	</section>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>