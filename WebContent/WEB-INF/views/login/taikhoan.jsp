<%@ page pageEncoding =  "utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
	<base href="${pageContext.servletContext.contextPath}/">
	<meta charset = "utf-8"/>
	<title>Danh sách người dùng</title>
	<link href="resource/css/ds.css" type="text/css" rel="stylesheet">
	<style>
		
	</style>
</head>
<body  style="background: #FFFFFF">
<%@ include file="../a/header.jsp" %>
	<table class="table table-hover">
	<tr>
		<th>Tên</th>
		<th>Tài khoản</th>
		<th></th>
	</tr>
	<c:forEach var="t" items="${taikhoan}">
	<tr>
		<td>${t.ten }</td>
		<td>${t.taikhoan }</td>
		<td><a onclick="return confirm('Are you sure you want to delete this ${t.ten}')" href="xoaTK/${t.taikhoan}.htm">Xóa</a></td>
	</tr>
	</c:forEach>
	</table>
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>