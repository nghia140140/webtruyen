<%@ page pageEncoding =  "utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<base href="${pageContext.servletContext.contextPath}/">
	<meta charset = "utf-8"/>
	<title>Insert title here</title>
	<!-- <link href="resource/css/botruyen/boruto/tap.css" type="text/css" rel="stylesheet"> -->
	<style type="text/css">
		body{
			background-color: #FFFFFF;
		}
		.tap{
			margin: 0 auto;
		}
		.thong-tin-tap {
		    background-color: #fff;
		    border-radius: 6px;
		    box-shadow: 0 2px 3px rgba(10,10,10,.1), 0 0 0 1px rgba(10,10,10,.1);
		    color: #4a4a4a;
		    display: block;
		    padding: 1.25rem;
		    text-align: center;
		}
		.danh-sach-anh{
		    text-align: center;
		    padding: 30px;
		    margin-bottom: 30px;
		}
		.lazy {
		    background-image: url(../images/loading.gif);
		    background-repeat: no-repeat;
		    background-position: 50% 50%;
		}
		img {
		    height: auto;
		    max-width: 100%;
		}
		.anhtap{
			text-align: center;
		}
	</style>
</head>
<body  style="background: #aaa444">
<%@ include file="../a/header.jsp" %>
	<section>
		<div class="tap">
			<div class ="thong-tin-tap">Tập ${tapso }</div>
			<div class="danh-sach-anh">
				<c:forEach var="a" items="${anh}">
					<img class="anhtap" alt="" src="${pageContext.servletContext.contextPath}${a.getTenAnh()}">
					<br>
				</c:forEach>
									
			</div>
		</div>
	
	</section>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>