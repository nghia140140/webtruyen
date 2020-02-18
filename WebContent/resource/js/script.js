
var A=[],i=1,n=7,S=[];	
function load(){
	var j;	
	for ( j = 1 ; j <= n ; j++){
		A[j]=new Image();
		A[j].src="${pageContext.servletContext.contextPath}/resources/images/liveshow/"+j+".jpg";
	}
}
	S[1] ="Nguồn Gốc Dị Nhân Người Sói WOLVERINE";
	S[2] ="Slam Dunk - Cao thủ bóng rổ";	
	S[3] ="Iron Man 2: Người Sắt 2";
	S[4] ="Quá nhanh quá nguy hiểm 7 - Fast & Furious 7";
	S[5] ="NARUTO";
	S[6] ="Huyền Thoại - Legendary";
	S[7] ="American Dreams In China: Giấc mơ Mỹ ở Trung Quốc";
function output(l){
	document.getElementById("img_film").src=A[l].src;
	document.getElementById("name").innerHTML=S[l];
	/*$(document).ready(function() {
		$(#img_film).slideUp()			
	});  */
	
}	
function next(){
	if(i<n){
		i++;
		output(i); 
	}
	else{
		i=1;
		output(i);
	}
}
function back(){
	if(i>1){
		i--;
		output(i); 
	}
	else{
		i=n;
		output(i); 
	}
}
setInterval("next()",7000);


function out(k){
	document.getElementById("f1").src=b[k].src;
	document.getElementById("h1").innerHTML=h[k];
	document.getElementById("f2").src=b[++k].src;
	document.getElementById("h2").innerHTML=h[k];
	document.getElementById("f3").src=b[++k].src;
	document.getElementById("h3").innerHTML=h[k];
	document.getElementById("f4").src=b[++k].src;
	document.getElementById("h4").innerHTML=h[k];
}
function next_footer(){
	if(l<m-3){	
		out(++l);
	}
}
function back_footer(){
	if(l>1){
		out(--l);
	}
}
/* End Web Home*/

/* Begin Web The_Loai */
	/* eq 0 */
    var ii = 0;
	$(document).ready(function() {
		$("#b1").click(function (){			
			if (ii == 0) {
					ii=-928;					
				}
			$("#t1").animate({
				marginLeft: ii +=232			
			},500)
		});
		$("#n1").click(function (){
			if (ii == -696) {
					ii=232;					
				}
			$("#t1").animate({
				marginLeft: ii -=232
			},700)
		});			
	});  
	/* eq 1 */
    var i1 = 0;
	$(document).ready(function() {
		$("#b2").click(function (){			
			if (i1 == 0) {
					i1=-928;					
				}
			$("#t2").animate({
				marginLeft: i1 +=232			
			},700)
		});
		$("#n2").click(function (){
			if (i1 == -696) {
					i1=232;					
				}
			$("#t2").animate({
				marginLeft: i1 -=232
			},700)
		});			
	});  
	var i2 = 0;
	/* eq 2 */
	$(document).ready(function() {
		$("#b3").click(function (){			
			if (i2 == 0) {
					i2=-928;					
				}
			$("#t3").animate({
				marginLeft: i2 +=232			
			},700)
		});
		$("#n3").click(function (){
			if (i2 == -696) {
					i2=232;					
				}
			$("#t3").animate({
				marginLeft: i2 -=232
			},700)
		});			
	});  
/* End Web The_Loai */

/*BEIGN Web Phim*/
var f=1;

	$(document).ready(function() {
		$(".play").click(function (){	
			if (f == 0) {
				document.pause.src="${pageContext.servletContext.contextPath}/resources/images/Phim/pause.png";
				f = 1;
				var p = document.getElementById("film");
				p.pause();				
				var img = document.getElementById("img_pause");
				$("#img_pause").css("display","block");
				img.src="${pageContext.servletContext.contextPath}/resources/images/Phim/pause.png";
			}
			else{
				document.pause.src="${pageContext.servletContext.contextPath}/resources/images/Phim/play.png";
				f = 0;
				var p = document.getElementById("film");
				var img = document.getElementById("img_pause");
				$("#img_pause").css("display","none");
				p.play();
			}
		});	
	});	
/*END Web Phim*/
