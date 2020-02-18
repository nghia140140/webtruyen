<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html >
<html>
<head>
	<meta charset="utf-8">
	<base href="${pageContext.servletContext.contextPath}/">
	<title>Đăng nhập</title>

		
	<style>
	
		  .khung{
			background-color:#ffffe6;
			height: 80vh;
			display: flex;
			justify-content: center;
			align-items: center;}
		.formstyle{
			width: 500px;
			background-color: #CAD3C8;
			padding: 20px;
			border-radius: 10px;
		}
		
		.button{
			margin-left: 180px;
			background-color: #e67e22;
			padding: 10px 30px;
			border-radius: 10px;
		}
		.message{
			text-align:center;
			font-size: 18px;
			color: #ff0000;}
	
	</style>

</head>
<body  style="background-color:#ffffe6">
<%@ include file="../a/header.jsp" %>
	<section class = "khung">
	<div class="formstyle">
		<%-- <form action="/WebBaoCao/login.htm" method="post"> --%>
		<form class="login" action="dangnhap.htm" method="post">
			<div class="message">${message}</div>
			<div class="form-group">
				<label for="exampleInputEmail1"><span><s:message code="login.username"/></span></label> <input
					name="taikhoan" type="email" class="form-control"
					placeholder="Enter Username">
			</div>

			<div class="form-group">
				<label for="exampleInputPassword1"><span><s:message code="login.password"/></span></label> <input
					type="Password" class="form-control" name="matkhau"
					placeholder="Password">
			</div>
			
			<button type="submit" value="login" class="btn btn-primary"><span><s:message code="menu.login"/></span></button>
		</form>
		<br>
		<div class="form-group">
			<button type="submit" class="btn btn-primary"><a href="dangky.htm" style="color:black"><span><s:message code="login.signup"/></span><a/></button>
		</div>
	</div>
	</section>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
</body>
</html>