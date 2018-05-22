<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<form action="Intro_notice_InsertReg" method="post">


<!-- <script>
	link_list = function(page) { 
		location.href= "Intro_notice_listForm?page="+page
	}

</script> -->

	<div style="background-color: pink;">제목</div>
	
	<div><input type="text" name="title" /></div>
	
	
	<div>내용</div>
	
	<div style="background-color: lime;"><textarea name="content" rows="5" cols="30">내용</textarea></div>
	
	
	<div>
		<input type="submit" value="작성"/>
		<input type="reset" value="초기화" /> 
		<input type="button" value="목록으로" onclick="location.href='Intro_notice_listForm?page=${param.page}'">
	</div>
 <!-- onclick="link_list()"  -->

</form>