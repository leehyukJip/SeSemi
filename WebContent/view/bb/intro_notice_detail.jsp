<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ct" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	.detail{
		margin: 10px;			
	}
</style>



<script>

link_modify = function(page,id){
	location.href="Intro_notice_ModifyForm?page="+page+"&id="+id
}

link_delete = function(page,id){
	 if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			location.href="Intro_notice_DeleteReg?page="+page+"&id="+id
	 }else{   //취소
	     return false;
	 }
}

</script>




<div>디테일 페이지 입니다.
	<div class="detail" style="background-color: pink">text_id 입니다 : ${data.id}</div>
	<div class="detail" style="background-color: yellow">글 제목 입니다 : ${data.title }</div>
	<div style="background-color: white;">조회수 입니다 : ${data.cnt}</div>
 	<div>날짜 : <fmt:formatDate value="${data.reg_Date }" pattern="yyyy-MM-dd HH:mm:ss" /></div>
	
	<div style="background-color: green;">내용내용내용 ${data.content }</div>
	

	
	<div>
		<input type="button" value="목록" onclick="location.href='Intro_notice_listForm?page=${param.page}'">
		
		<!-- 	여기에 관리자일경우 넣자 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
		<input type="button" value="수정" onclick="location.href='Intro_notice_ModifyForm?page=${param.page}&id=${data.id}'" >
<!-- 		location.href="Intro_notice_ModifyForm?page="+page+"&id="+id-->		
		<input type="button" value="삭제" onclick="link_delete(${param.page},${data.id})" >
	</div>

	<%-- ?page=${param.page } --%>
</div>
