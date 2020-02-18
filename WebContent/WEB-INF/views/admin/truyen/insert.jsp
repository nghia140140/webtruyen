<%@ page pageEncoding =  "utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri = "http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
	<base href="${pageContext.servletContext.contextPath}/">
    <head>
    <title>Thêm truyện</title>
        <meta charset="utf-8">
        <style type="text/css">
	        .container2 {
	        	width: 70%;
	            margin: auto;
			    border-radius: 5px;
			    background-color: #ccffff;
			    padding: 20px;
			    margin-top: 20px;
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
			.message{
			text-align:center;
			font-size: 18px;
			color: #ff0000;}
			/*  <p style="color: red;"> ${message1 } */
        </style>
</head>
<body  style="background: #f2f2f2">
<%@ include file="../a/header.jsp" %>
	<br>
		<div class="container2">
			
		    <form:form method="post" action="admin/truyen/insert.htm" enctype="multipart/form-data" >
			    <h4 class="message">${message }</h4>
			    <div>Mã truyện</div>
			     <input type="text" name="matruyen" value="${maTruyen }" placeholder="Nhập mã truyện..">
			    
			    <label>Tên truyện</label>
			    <input type="text" name="tentruyen" value="${tenTruyen }" placeholder="Nhập tên truyện..">
			    
			    <label>Mã Loại truyện</label>
			    <select id="maloai" name="maloai">
			    	<option value="TT">Truyện tranh</option>
			    	<option value="TC">Truyện Chữ</option>
			    </select>
			    <br>
			    <label>Tác giả truyện</label>
			    <input type="text"  name="tacgia" value="${tacGia }" placeholder="Nhập tên tác giả..">
			    
			    <label>Tình trạng</label>
			    <select id="tinhtrang" name="tinhtrang">
			    	<option value="0">Đang cập nhật</option>
			    	<option value="1">Đã xong</option>
			    </select>
			    <br>
			    <label>tóm tắt truyện</label>
			    <input type="text" name="tomtat" value="${tomTat }" placeholder="Nhập tóm tắt..">
			    <div class="form-group">
				    <label >Ảnh truyện</label>
				    <input type="file" name="anh">
			    </div>
			    <input type="submit" value="Submit">
			</form:form>
		</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>