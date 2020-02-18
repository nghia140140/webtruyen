<%@ page pageEncoding =  "utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
	<base href="${pageContext.servletContext.contextPath}/">
	<meta charset = "utf-8"/>
	<title>Quản lý truyện</title>
	<link href="resource/css/ds.css" type="text/css" rel="stylesheet">
	<style>
		
	</style>
</head>
<body  style="background: #FFFFFF">
<%@ include file="../a/header.jsp" %>
	<br>
	<div class="insert">
		<button>
			<a class="insert2" href="admin/truyen/insert.htm"><h2><span><s:message code="admin.insert.story"/></span></h2></a>
		</button>
	</div>
	<table class="table table-hover">
	<tr>
		<th><span><s:message code="story.code"/></span></th>
		<th><span><s:message code="story.name"/></span></th>
		<th><span><s:message code="story.kind"/></span></th>
		<th><span><s:message code="story.author"/></span></th>
		<th><span><s:message code="story.status"/></span></th>
		<th><span><s:message code="story.summary"/></span></th>
		<th></th>
		<th></th>
		<th></th>
	</tr>
	<c:forEach var="t" items="${truyen}">
	<tr>
		<td style="background: #9999ff">${t.matruyen}</td>
		<td>${t.tentruyen}</td>
		<td>
			${t.theloai.getTenloai()}
			<%-- <c:choose>
				<c:when test="${t.maloai=='TT'}">Truyện tranh</c:when>
				<c:otherwise>Truyện chữ</c:otherwise>
			</c:choose> --%>
		</td>
		<td>${t.tacgia}</td>
		<td>
			<c:choose>
				<c:when test="${t.tinhtrang=='1'}">Đã xong</c:when>
				<c:otherwise>Đang cập nhật</c:otherwise>
			</c:choose>
		</td>
		<td>${t.tomtat}</td>
		<td>
			<a href="admin/truyen/update/${t.matruyen}.htm"><span><s:message code="admin.update.story"/></span></a>
			<a 	onclick="return confirm('Are you sure you want to delete this ${t.tentruyen}')"
				href="admin/truyen/delete/${t.matruyen}.htm"><span><s:message code="admin.delete.story"/></span></a>
		</td>
		<td>
			<a href="xemanh/${t.matruyen}.htm">
				<img alt="" src="${pageContext.servletContext.contextPath}/${t.anh}" style="height:100px;width:75px;">
				<span><s:message code="admin.view"/></span>
<%-- 				<c:if test="${t.anh==null}">Thêm Ảnh</c:if> --%>
			</a>
		</td>
		<td>
			<c:choose>
				<c:when test="${t.theloai.getMaloai()=='TT'}">
					<a href="admin/taptt/${t.matruyen}.htm"><span><s:message code="menu.management"/></span></a>
				</c:when>
				<c:otherwise>
					<a href="admin/taptc/${t.matruyen}.htm"><span><s:message code="menu.management"/></span></a>
				</c:otherwise>
			</c:choose>
			
		</td>
	</tr>
	</c:forEach>
	</table>
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>