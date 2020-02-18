<%@ page pageEncoding =  "utf-8"%>
<%@ taglib uri = "http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
	<title>Ảnh</title>
        <meta charset="utf-8">
	<base href="${pageContext.servletContext.contextPath}/">
        <style type="text/css">
	        .container {
	        	width: 80%;
	            margin: auto;
			    border-radius: 5px;
			    background-color: #f2f2f2;
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
			.message{
			font-size: 18px;
			color: #ff0000;}
			/*  <p style="color: red;"> ${message1 } */
        </style>
    </head>
    <body> 
   
		<div class="container">
		    <form action="themanhtruyen/${matruyen }.htm" method="post" enctype="multipart/form-data">
			    
			    <div class="form-group">
				    <label >Ảnh truyên</label>
				    <input type="file" name="anh">
			    </div>
			    <br>
			    <input type="submit" value="Submit">
			    <p class="message">${message }</p>
			</form>
		</div>
    </body>
</html>