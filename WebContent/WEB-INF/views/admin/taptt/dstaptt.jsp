<%@ page pageEncoding =  "utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
	<base href="${pageContext.servletContext.contextPath}/">
	<meta charset = "utf-8"/>
	<title>Danh sách tập</title>
	
	<link href="resource/css/danhsach.css" type="text/css" rel="stylesheet">
</head>
<body  style="background: #f2f2f2">
<%@ include file="../a/header.jsp" %>
<%@ include file="../a/quanlyTT.jsp" %>

	<h2 style="text-align: center;">Truyện: ${taptt[0].truyen.getTentruyen() }</h2>
	<table class="table table-hover">
	<tr>
		<th>Tập</th>
		<th>Tên tập</th>
		<th>Danh sách ảnh</th>
		<th>Xóa/ Sửa</th>
	</tr>
	<c:forEach var="t" items="${taptt}">
	<tr>
		<td>${t.tap}</td>
		<td>${t.tentapTT}</td>
		<td>
				<a  class="insert2" href="showanhtap/${t.matap}.htm">Xem Ảnh</a>
		</td>
		<td>
			<a class="insert2" href="update/${t.matap}/${t.truyen.getMatruyen()}.htm">Chỉnh sửa</a>
			<br>
			<a  class="insert2" onclick="return confirm('Are you sure you want to delete this ${t.truyen.getMatruyen()} from TapTT')"
					href="delete/${t.matap}/${t.truyen.getMatruyen()}.htm">
					Xóa tập
			</a>
		</td>
	</tr>
	</c:forEach>
	</table>
	<div class="insert">
		<button>
			<a class="insert2" href="admin/taptt/insert/${matruyen}.htm"><h2>Thêm tập</h2></a>
		</button>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>