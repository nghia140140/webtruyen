<%@ page pageEncoding =  "utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset = "utf-8"/>
	<title>Danh sách ảnh</title>

	<base href="${pageContext.servletContext.contextPath}/">
	<style>
		/* table{
			border-collapse: collapse;
			width:100%;
		}
		tr, td{
			line-height: 25px;
			border:3px solid black;
			padding: 5px;
		}
		th{
			background-color: gray;
			line-height: 30px;
			border: 3px solid black;
		} */
		.ds-anh{
			margin-top: 20px;
		}
		.anh{
			margin-left: 50px;
			margin-bottom: 20px;
		}
		.button2{
			text-align: center;
			margin-bottom: 100px;
		}
		.button2:focus,
		.button2:hover{
			text-decoration:none
		}
		.button2:hover{color:#c0c}
		.insert{
			text-align: center;
			margin-top: 20px;
		}
	</style>
</head>
<body  style="background: #aaa444">
<%@ include file="../a/header.jsp" %>
<%@ include file="../a/quanlyTT.jsp" %>
	<section class="ds-anh">
		<div class="insert">
			<button><a class="button2" href ="insert/anh/${matap}.htm"><h3>Thêm ảnh</h3></a></button>
		</div>
		<c:forEach var="a" items="${anh}">
			<div class = "anh">
				<img alt="" src="${pageContext.servletContext.contextPath}/${a.getTenAnh()}" style="height: 500px; width:1200px">
				<button>
					<a onclick="return confirm('Are you sure you want to delete this ${a.getTenAnh()} from anh')"
					class="button2" href="xoaanh/${matap}/${a.maAnh}.htm">Xóa ảnh</a>
				</button>
				<button><a class="button2" href="chinhsuaanh/${matap}/${a.maAnh}.htm">Thay đổi</a></button>
			</div>
		</c:forEach>
		
	</section>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>