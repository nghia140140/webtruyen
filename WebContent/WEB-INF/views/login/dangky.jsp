<%@ page pageEncoding =  "utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri = "http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
	<base href="${pageContext.servletContext.contextPath}/">
	<meta charset = "utf-8"/>
	<title>Đăng ký tài khoản</title>
	<link href="resource/css/them.css" type="text/css" rel="stylesheet">
	<style type="text/css">
		input[type=email] {
			    width: 100%;
			    padding: 12px;
			    border: 1px solid #ccc;
			    border-radius: 4px;
			    box-sizing: border-box;
			    margin-top: 6px;
			    margin-bottom: 16px;
			    resize: vertical;
			}
			input[type=Password] {
			    width: 100%;
			    padding: 12px;
			    border: 1px solid #ccc;
			    border-radius: 4px;
			    box-sizing: border-box;
			    margin-top: 6px;
			    margin-bottom: 16px;
			    resize: vertical;
			}
		.submit{
			text-align: center;
		}
		.message{
			text-align:left;
			font-size: 18px;
			color: #ff0000;}
	</style>
</head>
<body  style="background: #f2f2f2">
<%@ include file="../a/header.jsp" %>
	<div class="container2">
	${message }
		<form:form action="dangky.htm" method="post" modelAttribute="tk">
			<div >
			<label><span><s:message code="login.fullname"/></span></label>
			<form:input type="text" path="ten"/>
			<form:errors path="ten" cssStyle="color:red;"/>
			</div>
			<div >
			<label><span><s:message code="login.username"/></span></label>
			<form:input type="email" path="taikhoan"/>
			<form:errors path="taikhoan" cssStyle="color:red;"/>
			</div>
			<div >
			<label><span><s:message code="login.password"/></span></label>
			<form:input type="Password" path="matkhau"/>
			<form:errors path="matkhau" cssStyle="color:red;"/>
			</div>
			<label><span><s:message code="login.retype.password"/></span></label>
			<input type="Password" name="matkhau2" value="${mk }"/>
			<div class="message">${message2 }<div/>
			</div>
			<div class="submit">
			<input type="submit" value="Submit">
			</div>
		</form:form>
	</div>
</body>
</html>