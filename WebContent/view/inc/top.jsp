<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	
</script>

<style>
.H_submenu{
	line-height:80px;
	margin-top: 5px;
	width: 100%;
	height: 20%;
	background-color: green;
	border-bottom: 5px inset #224;
}
</style>

<div style="width: 50%; height: 100%; margin-left: 25%;">
	<div style="height: 95%; width: 30%; float: left">
		<a href="../center/Main">
			<img style="height: 100%;" alt="여자친구" src="data:image/png;base64,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">
		</a>
	</div>
	<c:forEach begin="1" end="4" var="i">
		<div align="center" class="H_menudiv" style="display:block; z-index:1; margin-left:20px; line-height:80px; overflow:hidden; position:relative; width:120px; height: 380%; float: right;">
			<c:choose>
				<c:when test="${i==4 }">intro</c:when>
				<c:when test="${i==3 }">Reservation</c:when>
				<c:when test="${i==2 }">Download</c:when>
				<c:otherwise>Q&A</c:otherwise>
			</c:choose>
			<img style="width: 20px; height: 20px;" src="http://www.pkicon.com/icons/30984/Plus-Vector-256.png">
			<c:choose>
				<c:when test="${i==4 }">
					<a><div class="H_submenu">공지사항</div></a>
					<a><div class="H_submenu">회사소개</div></a>
					<a><div class="H_submenu">경영진소개</div></a>
				</c:when>
				<c:when test="${i==3 }">
					<a><div class="H_submenu" >방문예약</div></a>
					<a><div class="H_submenu" >출장예약</div></a>
				</c:when>
				<c:when test="${i==2 }">
					<a href="../center/Download"><div class="H_submenu">제품설명</div></a>
				</c:when>
				<c:otherwise>
					<a><div class="H_submenu">방문예약</div></a>
					<a><div class="H_submenu">출장예약</div></a>
				</c:otherwise>
			</c:choose>
		</div>
	</c:forEach>
</div>