
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
#s_title{

	cursor: pointer;
	float: left;
	width: 250px;
}
#s_bak{
	width: 600px;
	height: 100px;
	background-color: purple;
}

.s_num{

	float:left;
	width:100px;
}
.s_tit{

	float:left;
	width:250px;
}
.s_cnt{

	float:left;
	width:100px;
}
.s_dat{

	float:left;
	width:150px;
}
.s_bott{

	width: 500px;
}
</style>

비비크림파파파<br>
<%-- <c:forEach items="${data }" var="ee" varStatus="no">
${ee.cnt}
${ee.title}<br>
${ee.admin}<br>
비비크림파파파<br>
</c:forEach> --%>
<br>
<div class="s_num">번호</div>
<div class="s_cnt" >조회수</div>
<div class="s_tit">제목</div>
<div class="s_dat" >작성일</div>




<script>
link_detail = function(page,id) { 
	location.href= "Intro_notice_detail?page="+page+"&id="+id;
}
link_write = function(page){
	location.href="Intro_notice_InsertForm?page="+page;
}
</script>


<div id=s_bak>
<c:choose>
	<c:when test="${data.size()==0}"><div>내용없어 없다고없어!</div></c:when>
	
	<c:otherwise>
	
		<c:forEach items="${data }" var="ee" varStatus="no">
		 <%-- begin="${total}" end=0 step=-1  --%>
		<div class="s_num" style="background-color: red">${no.index+start }</div>
		<div class="s_cnt" style="background-color: pink" >${ee.cnt }</div>
		<div id = "s_title" style="background-color: white" onclick="link_detail(${page},${ee.id})" >${ee.title}</div>
		<%-- <a href="Intro_notice_detail?id=${ee.id}">제목 : ${ee.title }</a> --%>
		<div><fmt:formatDate value="${ee.reg_Date }" pattern="yyyy-MM-dd"/></div>
		</c:forEach>
		
		
		<div class="s_bott">
			<c:if test="${startPage >1}">
					<a href="Intro_notice_listForm?page=1">[처음]</a>
					<a href="List?page=${startPage-1}"><</a>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:choose>
					<c:when test="${i==page }">
							[${i }]
					</c:when>
					<c:otherwise>
						<a href="Intro_notice_listForm?page=${i }">${i }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
					
			<c:if test="${endPage<totalPage }">
				<a href="Intro_notice_listForm?page=${endPage+1}">></a>
				<a href="Intro_notice_listForm?page=${totalPage }">[마지막]</a>
			</c:if>
		</div>	
	</c:otherwise>
</c:choose>

<!-- 관리자 계정일경우 글쓰기 자체를 막음 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
<c:choose>
	<c:when  test="${data.size()>0 }">
	<div>관리자 아니라서 글쓰기가 안됨  </div>
	일단 관리자계정아이디이면  <div class="bott"><input type="button" value="글쓰기" onclick="link_write(${page})" ></div>
	</c:when>

	<c:otherwise>
	<div>관리자 아니라서 글쓰기가 안됨</div>
	</c:otherwise>
	
</c:choose>
</div>