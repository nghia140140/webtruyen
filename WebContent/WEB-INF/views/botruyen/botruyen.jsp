<%@ page pageEncoding =  "utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri = "http://www.springframework.org/tags/form" prefix="form" %>
<%-- <%@ page isELIgnored="false" %> --%>
<!DOCTYPE html>
<html>
<head>
	<base href="${pageContext.servletContext.contextPath}/">
	<meta charset = "utf-8"/>
	<title>${truyen[0].tentruyen}</title>
	
	<style type="text/css">
		.container {
			background-color: #ffffff;
		    max-width: 1200px!important;
		    margin: 0 auto;
		}
		p{
			margin-bottom: 0;
		}
		.duong-dan{
			font-size: 13px;
   			color: #424242;	
			
		}
		.block01 {
			    width: 100%;
			    float: left;
			    padding-bottom: 30px;
			    position: relative;
			    
			}
		
		.block01 .left {
			margin: 0 12px 0 4px;
			width: 225px;
		    float: left;
		    text-align: center;
		    
		}
		.block01 .left img{
		    box-shadow: 0 0 8px 0 #757575;
   			border-radius: 6px;
		}
		.block01 .center {
		    width: calc(100% - 246px);
		    float: right;
		    text-align: left;
		}
		.block01 .center .txt {
		    line-height: 30px;
		    color: #000;
		    padding-bottom: 10px;
		}
		img {
		    height: auto;
		    max-width: 100%;
		}
		.readmore-js-section {
		    overflow: hidden;
		}
		.readmore-js-section {
		    display: block;
		    width: 100%;
		}
		.story-detail-info {
		    margin-top: 5px;
		}
				.readmore {
		    text-align: center;
		    padding-top: 7px;
		    border-top: 1px solid #ccc;
		}
		.readmore-js-toggle, .readmore-js-section {
		    display: block;
		    width: 100%;
		}

	.block02 {
	    clear: both;
	    padding-bottom: 30px;
	}
	.block02 .box {
	    max-height: 500px;
	    overflow-y: auto;
	}
	.box {
	    background-color: #fff;
	    border-radius: 6px;
	    box-shadow: 0 2px 3px rgba(10,10,10,.1), 0 0 0 1px rgba(10,10,10,.1);
	    color: #4a4a4a;
	    display: block;
	    padding: 1.25rem;
	}
	.block02 .box .works-chapter-item {
	    border-bottom: 1px solid #eee;
	    padding: 5px 0;
	}

	</style>
<!-- <body style="background-color: #eeeeee;"> -->
</head>
<body  style="background-color: #eeeeee;">
<%@ include file="../a/header.jsp" %>
	<!-- Thanh trang chu -->
	<section style="background-color: #eeeeee;">
		<div class="container">
			<div class="duong-dan" >
				<ol class="breadcrumb">
				      <a href="${pageContext.servletContext.contextPath}/trangchu/doctruyen.htm">
				        <span>Trang Chủ</span>
				      </a>
				      >
				      <a href="${pageContext.servletContext.contextPath}/${truyen[0].matruyen}.htm">
				        <span>${truyen[0].tentruyen}</span>
				      </a>
				</ol>
			</div>
			<div class="block01">
	            <div class="left">
	            	<img src="${pageContext.servletContext.contextPath}${truyen[0].anh}" style="height:247px;width:190px;">
	            </div>
	            <div class="center">
	                <h1>${truyen[0].tentruyen}</h1>
	                <div class="txt">
	                	<p>Tác Giả: ${truyen[0].tacgia}</p>
	                	<c:if test="${truyen[0].tinhtrang == 0}">Tình trạng: Đang cập nhật</c:if>
	                	<c:if test="${truyen[0].tinhtrang == 1}">Tình trạng: Đã xong</c:if>
	                	<br>
	                	<p>Thể loại: ${truyen[0].theloai.getTenloai() }</p>
	                <%-- 	<c:if test="${truyen[0].maloai == 'TT'}">Thể loại: Truyện tranh</c:if>
	                	<c:if test="${truyen[0].maloai == 'TC'}">Thể loại: Truyện chữ</c:if> --%>
	                </div>
	                <c:if test="${admin =='1'}">
		                <c:choose>
		                	<c:when test="${theodoi=='0'}">
			                	<div>
				                	<button><a href="theodoi/${truyen[0].matruyen}.htm">Theo dõi</a></button>
				                </div>
			                </c:when>
		                	<c:otherwise>
		                		<div>
				                	<button><a href="huytheodoi/${truyen[0].matruyen}.htm">Hủy Theo dõi</a></button>
				                </div>
		                	</c:otherwise>
		                </c:choose>
	                </c:if>
	                <div>
	                    <p>${truyen[0].tomtat}</p>
	                </div>
	                   <!--  <p class="readmore readmore-js-toggle">
	                    <a href="#">Xem Thêm</a>
	                    </p> -->
           		</div>
        	</div>
			<div class="block02">
            <div class="title">
                <h2 class="story-detail-title">Danh sách chương</h2>
            </div>
            <div class="box">
                <div class="works-chapter-list">
                	<c:forEach var="t" items="${tap}">
	                	<div class="works-chapter-item row">
	                    	<div class="col-md-10 col-sm-10 col-xs-8 ">
	                    		<c:choose>
									<c:when test="${truyen[0].theloai.getMaloai()=='TT'}">
										<a target="_blank" href="xem/${t.matap }.htm">Tập ${t.tap}</a>
									</c:when>
									<c:otherwise>
	                                	<a target="_blank" href="xemtc/${t.matap}.htm">Tập ${t.tap}</a>
									</c:otherwise>
								</c:choose>
	                        </div>
	                    	<!-- <div class="col-md-2 col-sm-2 col-xs-4 text-right">
	                                10/10/2019                            
	                        </div> -->
	                    </div>
                    </c:forEach>
                 </div>
            </div>
      		</div>
		
		
		</div>
	
	</section>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	
	
</body>
</html>