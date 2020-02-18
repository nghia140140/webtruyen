<%@ page pageEncoding =  "utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
	<base href="${pageContext.servletContext.contextPath}/">
	<meta charset = "utf-8"/>
	<title>Theo Dõi</title>
	<style type="text/css">
		.container {
		    max-width: 1200px!important;
		    margin: 0 auto;
		}
		.anhdau{
		    margin-right: -10px;
		    margin-left: -10px;
		}
		.danh-sach{
		    display: flex;
		    flex-wrap: wrap;
		    justify-content: flex-start;
		    margin-bottom: 10px;
		}
		.story-item {
		    text-align: center;
		    position: relative;
		    margin-bottom: 50px;
		}
		.story-item img{
			width: 170px;
		    height: 240px;
		}
		.story-item .story-cover {
		    object-fit: cover;
		    border-radius: 6px;
		    border: 1px solid #ccc;
		    width:170px;
		    height:240px;
		}
		ul {
			list-style: none;
		}
		li {
		    flex: 0 0 calc((100% / 6) - 10px);
		}
		/* img{
			max-width: 100%;
		    vertical-align: middle;
		    border: 0;
		} */
	</style>
</head>
<body  style="background: #805e00">
<%@ include file="../views/a/header.jsp" %>
	<section class = "moi-cap-nhap">
		<div class= "container">
			<div class="anhdau">
				<ul class="danh-sach">
					<c:forEach var="t" items="${truyen}">
						<li>
							<div class="story-item">
								<a href="${pageContext.servletContext.contextPath}/${t.truyen.getMatruyen()}.htm">
									<img class="story-cover" src="${pageContext.servletContext.contextPath}${t.truyen.getAnh()}">
									<strong>${t.truyen.getTentruyen()}</strong>
								</a>
							</div>
						</li>
					</c:forEach>
					
				</ul>

				
			</div>
		</div>
	
	</section>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
</body>
</html>