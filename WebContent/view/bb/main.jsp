<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  


<style>

 *{
	margin: 0;
	padding: 0;
}

/* html,body{
	width:100%;
	height: 100%;
} */

.tot{
 	margin:50px auto;
	width:100%;
	padding:100px;
	border: 1px solid white;
	height: 400px;
	background-color: pink;
}



.btns{
	width:100%;
	height: 50px;
	text-align: center;
	line-height: 50px;
	background-color: blue;
}

button{
	width:58px;
	height: 40px;
}

.big{
 	position:relative;
	width:250px;
	height: 340px;
	background-color: green;
	float: left;
	overflow: hidden;
}

#imgs{
	left:0px;
	position:absolute;
	width:1300%;
	height: 340px;
	float:left;
	background-color: blue;
}

img{
	width:250px;
	height: 340px;
	float: left;
}

  .aside{
  	position:absolute; 
	width:400px;
	height: 70px;
	display: inline; 
 	float: right; 
	background-color: red;
}

.nav{
	width:10px;
	height: 10px;
	/* background: #fff; */
	/* display: inline; */
	float:left;
	border-radius: 5px;
	margin: 10px ;
}
</style>



<!-- 주석 ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ여기 내일해보자 -->

<script>

	var currIndex =0;


	function moveImg(pos){
		currIndex=pos;
		currIndex%=12;
		if(currIndex<0) currIndex=11;

		imgs = document.getElementById("imgs");
		imgs.style.left=-currIndex*100+"%";

		var navArr = document.getElementsByClassName("nav");
		for(k in navArr){
			navArr.item(k).style.background='white';
		}
		navArr.item(currIndex).style.background='gray';
	}

	function back(){
		moveImg(currIndex-1);
	}

	function next(){
		moveImg(currIndex+1);
	}

	var roll=setInterval(next, 1000);
	
	imgs.onmouseover=function(){
		clearInterval(roll);
	}
	
	imgs.onmouseout=function(){
		roll =setInterval(next,1000);
	}
	
	//슬라이드
		var pos = 0;
/* 		function move(){
			m = setInterval(function(){
			pos--;
			imgs.style.left=pos*1+'%';
			}, 50);
		} 
		//슬라이드멈춤
		function movestop(){
			clearInterval(m)
		} */
	moveImg(5);
</script>


<!-- 무빙222222222222222222끝주석 끝 -->



<div class="tot">

	<div class="big">
		<div id="imgs">
			<script>
				for(var i=0;i<12;i++){
		 			document.write("<img src='../imgs/comp/"+i+".png'>");
				}
			</script>
		</div>
	</div>
 	<div class="aside">어사이드어사이드
		<script>
			for(var i=0;i<12;i++){
				document.write("<div class='nav' onclick='moveImg("+i+")'></div>");
			}
		</script>
	 </div>
	<div class="btns">
		<button onclick="back()">뒤로</button>
		<button onclick="next()">다음</button>
	</div>
	
</div>


<div>
	<table style="text-align: center;">
		<tr>

		</tr>
			
		
		 <tr>
			<td> 방문예약<br>
				
				<a href=""><img alt="" src="/../imgs/comp/건1_센터방문예약.JPG"></a>
				
			</td>
		 	<td> 출장 예약<br>
		 		<a href=""><img alt="" src="../imgs/comp/건2_출장방문예약.JPG"></a>
		 	</td> 
		</tr>

		
		<tr>
			<td>예약 Q&A<br>
				<a href=""><img alt="" src="../imgs/comp/상1_예약 Q&A.JPG"></a><br>
			</td>
		 	
		 	
		 	<td>제품 Q&A<br>
		 		<a href=""><img alt="" src="../imgs/comp/상3_제품질문.JPG"></a>
		 	</td>
		 	
		<!--  	
		 	
		 	<td>자주찾는 질문 F&A
		 		<a href=""><img alt="" src="../imgs/comp/준1_회사소개.JPG" ></a>
		 	</td>	
		 -->
		</tr>
		
		
		<tr>
			<td>회사소개<br>
			<a href="about_sangsung"><img alt="" src="../imgs/comp/준1_회사소개.JPG" ></a>
			</td>
			<td>경영진소개<br>
				<a href="about_CEO"><img alt="" src="../imgs/comp/준3_경영진소게.JPG"></a>
			</td>
			<td>공지사항<br>
				<a href="Intro_notice_listForm"><img alt="" src="../imgs/comp/준2_공지사항.JPG"></a>
			</td>
		</tr>
		
	</table>
</div>