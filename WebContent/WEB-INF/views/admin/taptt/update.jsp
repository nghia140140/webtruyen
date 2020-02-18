<%@ page pageEncoding =  "utf-8"%>	
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri = "http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
	<base href="${pageContext.servletContext.contextPath}/">
	<meta charset = "utf-8"/>
	<title>Chỉnh sửa truyện</title>
	<style type="text/css">
	        .container2 {
	        	width: 60%;
	            margin: auto;
			    border-radius: 5px;
			    background-color: #ccffff;
			    padding: 20px;
	        }
          	input[type=text] {
			    width: 100%;
			    padding: 12px;
			    border: 1px solid #ccc;
			    border-radius: 4px;
			    box-sizing: border-box;
			    margin-top: 6px;
			    margin-bottom: 16px;
			    resize: vertical;
			}

			input[type=submit] {
			    background-color: #4CAF50;
			    color: white;
			    padding: 12px 20px;
			    border: none;
			    border-radius: 4px;
			    cursor: pointer;
			}

			input[type=submit]:hover {
			    background-color: #45a049;
			}
        </style>
</head>
<body  style="background: #f2f2f2">
<%@ include file="../a/header.jsp" %>
<%@ include file="../a/quanlyTT.jsp" %>
	<section class="container2">
		${message }
		<form:form action="update/${matruyen}.htm" modelAttribute="taptt">
			<%-- <div>
				<label>Mã Tập</label>
				<form:input path="matap"/>
			</div> --%>
			<%-- <br>
			<div>
				<label>Tập
				<form:input path="tap"/>
				</label>
				 <form:errors path="tap" cssStyle="color:red;"/>
			</div>
			<br> --%>
			<div>
				<label>Tên Tập</label>
				<form:input path="tentapTT"/>
				 <form:errors path="tentapTT" cssStyle="color:red;"/>
			</div>
			<br>
			<div>
				<button class="btn btn-default">Update</button>
			</div>
		
		</form:form>
	</section>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>