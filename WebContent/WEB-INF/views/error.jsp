<%@ page pageEncoding =  "utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset = "utf-8"/>
	<title>Lỗi truy cập</title>
	<base href="${pageContext.servletContext.contextPath}/">
	<style type="text/css">
		.error{
			text-align: center;
			margin-left:50px;
		}
	</style>
</head>
<body>
<%@ include file="../views/a/header.jsp" %>
	<h3 style="text-align:center; color:red">Bạn không có quyền truy cập trang web vui lòng đăng nhập!!</h3>
	<div class="error">
		<img alt="" src="${pageContext.servletContext.contextPath}/resource/images/error.png" style="height: 700px;width:1400px;">
	</div>
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
</body>
</html>