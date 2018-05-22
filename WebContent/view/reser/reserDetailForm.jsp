<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body> -->
	<table border="1">
		<tr>
			<td>신청자 이름</td>
			<td>${user.name }</td>
		</tr>
		<tr>
			<td>신청자 폰번호</td>
			<td>${user.phone }</td>
		</tr>
		<tr>
			<td>신청자 주소</td>
			<td>우편번호 : ${user.address }</td>
		</tr>
		<tr>
			<td>상세주소</td>
			<td>${user.address }</td>
		</tr>
		<tr>
			<td>더 상세주소</td>
			<td>${user.address }</td>
		</tr>
		<tr>
			<td>기사님 이름</td>
			<td>${engi.id }</td>
		</tr>
		<tr>
			<td>기사님 사진</td>
			<td>${engi.picture }</td>
		</tr>
		<tr>
			<td>기사님 번호</td>
			<td>${engi.phone}</td>
		</tr>
		<tr>
			<td>날짜</td>
			<td>${reser.resDate}</td>
		</tr>
		<tr>
			<td>시간</td>
			<td>
			<c:if test="${reser.part==1}">10-12시</c:if>
			<c:if test="${reser.part==2}">13-15시</c:if>
			<c:if test="${reser.part==3}">15-17시</c:if>
			</td>
		</tr>

<!-- 		<tr>
			<td>파일</td>
			<td></td>
		</tr> -->
		<tr>
			<td colspan="2">
			<a href="Reserlist">예약 내역(마이페이지)</a> <a href="intro">홈으로</a> <a href="ReserDelete?rid=${reservo.rid }">예약취소</a></td>
		</tr>
	</table>
<!-- </body>
</html> -->