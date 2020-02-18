<%@ page pageEncoding =  "utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset = "utf-8"/>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<base href="${pageContext.servletContext.contextPath}/">
	<title>Insert title here</title>
	<link href="resource/css/main.css" type="text/css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		
	<script type="text/javascript">
        jQuery(document).ready(function($) {
            var $filter = $('.head_nav');
            var $filterSpacer = $('<div />', {
                "class": "vnkings-spacer",
                "height": $filter.outerHeight()
            });
            if ($filter.size())
            {
                $(window).scroll(function ()
                {
                    if (!$filter.hasClass('fix') && $(window).scrollTop() > $filter.offset().top)
                    {
                        $filter.before($filterSpacer);
                        $filter.addClass("fix");
                    }
                    else if ($filter.hasClass('fix')  && $(window).scrollTop() < $filterSpacer.offset().top)
                    {
                        $filter.removeClass("fix");
                        $filterSpacer.remove();
                    }
                });
            }
 
        });
    </script>
    <style type="text/css">
	    .head_nav.fix {
		  left: 0;
		  max-width: 100%;
		  overflow: visible;
		  position: fixed !important;
		  top: 0;
		  width: 100%;
		  z-index: 1000;
		}
		.letren{
		  margin-bottom: 80px;
		}
    </style>
</head>
<body  style="background-color:#ffffe6">
	<section class = "head_nav fix">
	<div class= "main-menu">
	<div class= "container">
			
			<nav class="thanhcongcu navbar-expand-lg navbar-light nen-thanhcongcu">
				<img src="${pageContext.servletContext.contextPath}/resource/images/top/logo.jpg" style="width: 40px;border-radius: 20px">
				<a class="trang-chu" href="trangchu/doctruyen.htm">
					<h2><span><s:message code="menu.home"/></span></h2>
				</a>
	
			  <div class="collapse navbar-collapse" id="navbarSupportedContent">
			    <ul class="navbar-nav mr-auto">
					<div class="dropdown">
							<c:choose>
								<c:when test="${admin=='1'}">
									<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						
									<strong><span><s:message code="menu.user"/></span></strong>
									</button>
								</c:when>
								<c:when test="${admin=='false'}">
									<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									<strong><span><s:message code="menu.login"/></span></strong>
									</button>
								</c:when>
								<c:otherwise>
									<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						
									<strong>Admin</strong>
									</button>
								</c:otherwise>
							</c:choose>
							
						
							<c:choose>
								<c:when test="${admin=='1'}">
									<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
										<a class="dropdown-item" href="logout.htm">
											<span><s:message code="menu.logout"/></span></a>
										<a class="dropdown-item" href="xemTK/${taikhoan }.htm">
											<span><s:message code="menu.information"/></span></a>
									</div>
								</c:when>
								<c:when test="${admin=='false'}">
									<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
										<a class="dropdown-item" href="login.htm">
											<span><s:message code="menu.login"/></span></a>
									</div>
								</c:when>
								<c:otherwise>
									<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
										<a class="dropdown-item" href="quanly.htm">
											<span><s:message code="menu.management"/></span></a>
										<a class="dropdown-item" href="dxadmin.htm">
											<span><s:message code="menu.logout"/></span></a>
										<a class="dropdown-item" href="xuatTK.htm">
											<span><s:message code="menu.accountmanagement"/></span></a>
									</div>
								</c:otherwise>
							</c:choose>
						
					</div>
					 <div class="item">
        					<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" 
        					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        					<strong><span><s:message code="menu.language"/></span></strong>
							</button>
            				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item" href="trangchu/doctruyen.htm?language=en" style = "margin-right: 10px">English</a>
			            		<a class="dropdown-item" href="trangchu/doctruyen.htm?language=vi">Tiếng Việt</a>
							</div>
			          </div>
			          <a class="item">
				        <a class="nav-link" href="${pageContext.servletContext.contextPath}/trangchu/truyentranh.htm">
				       		<strong><span><s:message code="menu.comics"/></span></strong>
				        </a>
				      
				      <a class="item">
				        <a class="nav-link" href="${pageContext.servletContext.contextPath}/trangchu/truyenchu.htm">
				        	<strong><span><s:message code="menu.manga"/></span></strong>
				        </a>
				      </a>
				      
				      <c:choose>
						<c:when test="${admin=='1'}">
							<a class="item">
						        <a class="nav-link" href="theodoi.htm">
						        	<strong><span><s:message code="menu.follow"/></span></strong>
						        </a>
					      	</a>
						</c:when>
						<c:otherwise></c:otherwise>
				      </c:choose>
			    </ul>
			   <%--  <form class="form-inline my-2 my-lg-0">
			      <input class="form-control mr-sm-2" type="search" name="search" placeholder="Search" aria-label="Search">
			      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
			      	<span><s:message code="menu.search"/></span></button>
			    </form> --%>
			  </div>
			</nav>
	

	</div>
	</div>
	</section>
	<div class="letren"></div>

</body>
</html>