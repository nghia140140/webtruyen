<%@ page pageEncoding =  "utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset = "utf-8"/>
<title>Insert title here</title>
	<link href="resource/css/trangchu.css" type="text/css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<style type="text/css">
		.container3 {
		    max-width: 380px!important;
		    margin: 0 auto;
		}
		.nen-thanhcongcu2{
			background-color: #e6ccff!important;
			
		}
		.quanly{
			color: red;
		}
		.quanly:focus,
		.quanly:hover{
			text-decoration:none
		}
		.quanly:hover{color:#c0c}
		.main-quanly{
			background-color:#f2e6ff;
		}
	</style>
</head>
<body>
	<section class="main-quanly">
	<div class= "container3">
			
			<nav class="thanhcongcu navbar-expand-lg navbar-light nen-thanhcongcu2">
				 <a class="item">
				 	<a class="quanly" href="quanly.htm">
				       	<strong><span><s:message code="menu.management"/></span></strong>
				    </a>
				 </a>
				 <a class="item"/>
				 <a class="item"/>
				 <a class="item">
				 	<a class="quanly" href="admin/taptc/${matruyenchu}.htm"><strong>
				 		<span><s:message code="menu.management2"/></span></strong></a>
				 </a>
			    </ul>
			  </div>
			</nav>
	</div>
	</section>
</body>
</html>