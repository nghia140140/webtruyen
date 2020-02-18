<%@ page pageEncoding =  "utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
	<base href="${pageContext.servletContext.contextPath}/">
	<meta charset = "utf-8"/>
	<title>Truyện tranh</title>
</head>
<body  style="background: #805e00">
<%@ include file="../a/header.jsp" %>
		<section class = "moi-cap-nhap">
		<div class= "container">
			<div class="anhdau">
				<ul class="danh-sach">
					<c:forEach var="t" items="${truyentranh}">
						<li>
							<div class="story-item">
							
								<a href="${pageContext.servletContext.contextPath}/${t.matruyen}.htm">
									<img class="story-cover" src="${pageContext.servletContext.contextPath}${t.anh}">
									<strong>${t.tentruyen}</strong>
								</a>
								<%-- <br>
								<a href="${pageContext.servletContext.contextPath}/boruto/tap38.htm">
									<h6>Tập ${t.matruyen}</h6>
								</a> --%>
							</div>
						</li>
					</c:forEach>
					
				</ul>

				
			</div>
		</div>
	
	</section>
	
	</section>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
</body>
</html>