<%@ page pageEncoding =  "utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
	<base href="${pageContext.servletContext.contextPath}/">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content= "width=device-width, initial-scale=1">
	<meta property = "og:url" content="https://doctruyen.com/">
	<title>Web đọc truyện hay nhất Việt Nam</title>
	
</head>
<body  style="background: #805e00">
<%@ include file="../a/header.jsp" %>
	<section class = "showpic">
		<div class = "container">
			<div class="anhdau">
			
				<div class="row">
					<div class="col-md-3">
						<div class="row">
							<div class="that-dai-toi">
								<a href="THAT.htm">
									<img class="avatar" src="${pageContext.servletContext.contextPath}/resource/images/top/Avatar Nanatsu No TaiZai.jpg">
									<div class="bong"></div>
									<div class="tentruyen">
		                                <h5>Thất Hình Đại Tội</h5>
		                            </div>
		                            <div class="chapter red">Chương 614</div>
								</a>
								
								
							</div>
						</div>
						<br>
						<div class="row">
							<div class="naruto">
							<a href="NAR.htm">
									<img class="avatar" src="${pageContext.servletContext.contextPath}/resource/images/top/Naruto.jpg">
									<div class="bong"></div>
									<div class="tentruyen">
		                                <h5>Naruto</h5>
		                            </div>
		                            <div class="chapter red">Chương 701</div>
							</a>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="dao-hai-tac">
							<a href="ONEPI.htm">
									<img class="avatar" src="${pageContext.servletContext.contextPath}/resource/images/top/Dao hai tac.jpg">
									<div class="bong"></div>
									<div class="tentruyen">
		                                <h5>Đảo Hải Tặc</h5>
		                            </div>
		                            <div class="chapter red">Chương 1001</div>
							</a>
						</div>
					</div>
					<div class="col-md-3">
						<div class="row">
							<div class="black-clover">
								<a href="BLACK.htm">
									<img class="avatar" src="${pageContext.servletContext.contextPath}/resource/images/top/Black Clover.jpg">
									<div class="bong"></div>
									<div class="tentruyen">
		                                <h5>Black Clover</h5>
		                            </div>
		                            <div class="chapter red">Chương 614</div>
								</a>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="one-punch-man">
								<a href="ONEPU.htm">
									<img class="avatar" src="${pageContext.servletContext.contextPath}/resource/images/top/One Punch Man.jpg">
									<div class="bong"></div>
									<div class="tentruyen">
		                                <h5>One Punch Man</h5>
		                            </div>
		                            <div class="chapter red">Chương 392</div>
								</a>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		
		</div>
	
	</section>
	
	<section class="khung-loai">
		<div class="loai-truyen" >
				<a class="nav-link" href="trangchu/truyentranh.htm">
					<h2><span><s:message code="menu.comics"/></span></h2>
				</a>
		</div>
	</section>
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
	
	<section class="khung-loai">
		<div class="loai-truyen" >
				<a class="nav-link" href="trangchu/truyenchu.htm">
					<h2><span><s:message code="menu.manga"/></span></h2>
				</a>
		</div>
	</section>
	<section class = "moi-cap-nhap">
		<div class= "container">
			<div class="anhdau">
				<ul class="danh-sach">
					<c:forEach var="t" items="${truyenchu}">
						<li>
							<div class="story-item">
							
								<a href="${pageContext.servletContext.contextPath}/${t.matruyen}.htm">
									<img class="story-cover" src="${pageContext.servletContext.contextPath}${t.anh}">
									<strong>${t.tentruyen}</strong>
									<br>
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
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>