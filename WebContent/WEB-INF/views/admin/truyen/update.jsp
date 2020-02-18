<%@ page pageEncoding =  "utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri = "http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
	<base href="${pageContext.servletContext.contextPath}/">
	<meta charset = "utf-8"/>
	<title>Chỉnh sửa thông tin</title>
	<link href="resource/css/them.css" type="text/css" rel="stylesheet">
</head>
<body  style="background: #f2f2f2">
<%@ include file="../a/header.jsp" %>
	<section class="container2">
		${message }
		<form:form action="admin/truyen/update1/${matruyen1}.htm" modelAttribute="truyen">
			<%-- <div>
				<img alt="" src="${pageContext.servletContext.contextPath}${anh}">
				<label>File ảnh</label>
				<form:input path="anh"/>
			</div>
			<br> --%>
			<div>
				<label>Tên truyện</label>
				<form:input path="tentruyen"/>
				<form:errors path="tentruyen" cssStyle="color:red;"/>
			</div>
			<div>
				<label>Tác Giả</label>
				<form:input path="tacgia"/>
				<form:errors path="tacgia" cssStyle="color:red;"/>
			</div>
			<div>
				<label>Tình Trạng: </label>
				<form:errors path="tinhtrang" cssStyle="color:red;"/>
				<form:radiobutton path="tinhtrang" value="1" label="Đã xong"/>
				<form:radiobutton path="tinhtrang" value="0" label="Đang cập nhật"/>
			</div>
			<div>
				<label>Tóm Tắt</label>
				<form:input path="tomtat"/>
				<form:errors path="tomtat" cssStyle="color:red;"/>
			</div>
			 <input type="submit" value="Cập nhật">
		
		</form:form>
	</section>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>