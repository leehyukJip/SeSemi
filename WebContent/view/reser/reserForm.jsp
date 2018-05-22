<%@page import="model.UserVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	/* 	request.setAttribute("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date())); */
%>

<fmt:parseDate var="day" value="${today }" pattern="yyyy-MM-dd" />
<fmt:parseDate var="tt" value="${today }" pattern="yyyy-MM-dd" />
<%-- <c:set var="todate" value="${day.date }" /> --%>
<%-- <c:if test="${resDate eq null }">
<c:set var="resDate" value="${day }" />
</c:if> --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
.r_matching {
	float: left;
	margin-right: 20px;
}

.r_tr {
	width: 150pt;
}

.r_td {
	float: left;
	text-align: center;
	width: 20pt;
	height: 20pt;
	color: maroon;
}

.r_sun {
	float: left;
	text-align: center;
	width: 20pt;
	height: 20pt;
	color: fuchsia;
	text-align: center;
	width: 20pt;
	height: 20pt;
}

.r_sat {
	float: left;
	text-align: center;
	width: 20pt;
	height: 20pt;
	color: aqua;
}

.r_resible {
	cursor: pointer;
	float: left;
	text-align: center;
	width: 20pt;
	height: 20pt;
}

.r_gpic {
	width: 300px;
	height: 200px;
	margin-right: 10px;
}

.r_imgs {
	width: 100%;
	height: 100%;
	overflow: visible;
}
</style>

<script type="text/javascript">

	mclick = function(ii) {

		location.href = "ReserEngi?uid=${user.userId}&day=" + ii;
	}

	reserbtn = function() {
		document.frm.submit();
	}
	/* 	part1 = function(){
			alert();	
		} */
</script>

<!-- 예약신청 폼 -->
<div align="center">
	신청자 정보 입력
	<!-- 어차피 로그인한 애만 예약할 수 있는데 이름, 번호, 주소 입력할  필요가?
		 입력 안해도 로그인 정보에서 뽑아쓰면 되는데?
		  / 번호,주소 바꿔서 적는 경우 생각 해야하나? -->
	<form action="reser">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="username"
					<c:if test='${user!=null }'>value='${user.name }'</c:if> /></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="userphone"
					<c:if test='${user!=null }'>value='${user.phone }'</c:if> /></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address"
					<c:if test='${user!=null }'>value='${user.address }'</c:if> /></td>
			</tr>
			<tr>
				<td>시간</td>
				<td id="time">${time }</td>

			</tr>
			<tr>
				<td>제품</td>
				<td><select name="category">
						<option>카테고리 선택</option>
						<c:forEach items="${cate}" var="cc">
							<option>${cc }</option>
						</c:forEach>
				</select> <select name="product">
						<option>제품 선택</option>
						<option></option>

				</select></td>
			</tr>
			<tr>
				<td>증상</td>
				<td><select name="symptom">
						<!-- 선택된걸 잡아서 -->
						<option>증상 선택</option>
						<c:forEach items="${prod.list(pp) }" var="ss">
							<option>${ss }</option>

						</c:forEach>
						<option>기타</option>
				</select></td>
			</tr>
			<tr>
				<td>상세내용</td>
				<td><textarea cols="30" rows="5" name="content"></textarea></td>
			</tr>
			<tr>
				<td>전달사항</td>
				<td><input type="text" name="call" /></td>
			</tr>
			<!-- 		<tr>
			<td colspan="2">

			<a href="reserForm.jsp">뒤로가기</a>
			<a href="?">위로가기</a>
			<input type="reset" value="리셋"/>
			<input type="submit" value="작성"/>
			
			</td>
		</tr> -->
		</table>
	</form>
</div>

<!-- 달력 날짜선택 -->
<div class="r_matching">
	<c:set var="color" value="black"></c:set>
	<div class="r_tr">
		<c:forTokens var="week" items="일,월,화,수,목,금,토" delims=",">
			<div class="r_td">${week }</div>
		</c:forTokens>
	</div>


	<!-- 달력 첫째줄 -->
	<div class="r_tr">
		<c:if test="${day.day > 0 }">
			<c:forEach begin="0" end="${day.day-1}" var="i">
${day.setDate(day.date-day.day+i) }
			<c:choose>
					<c:when test="${i==0 }">
						<div class="r_sun">${day.date}</div>
					</c:when>
					<c:otherwise>
						<div class="r_td">${day.date}</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		${day.setDate(day.date+1) }
		</c:if>

		<!-- 달력 둘째줄 -->
		<c:forEach begin="${day.date }" end="${day.date+14 }" var="ii">
			<div
				style="color: 
				<c:choose>
					<c:when test="${day.day==0 }">
						fuchsia
					</c:when>
					<c:when test="${day.day==6 }">
						aqua
					</c:when>
					<c:otherwise>
						maroon
					</c:otherwise>
				</c:choose>
				;background-color: 
						yellow;"
				class="r_resible" onclick='mclick(${day.date})'>${day.date }</div>
			<c:if test="${day.day==6 }">
	</div>
	<div class="r_tr">
		</c:if>
		${day.setDate(day.date+1) }

		</c:forEach>

		<!-- 달력 셋째줄 -->
		<c:if test="${day.day>0 }">
			<c:forEach var="i" begin="${day.day }" end="6">
				<c:choose>
					<c:when test="${i==6 }">
						<div class="r_sat">${day.date}</div>
					</c:when>
					<c:otherwise>
						<div class="r_td">${day.date}</div>
					</c:otherwise>
				</c:choose>
				${day.setDate(day.date+1) }
			</c:forEach>
		</c:if>
		${day.setMonth(tt.month) } ${day.setDate(tt.date) }
	</div>
</div>


<!-- 기사 및 시간선택 -->
<c:if test="${slist != null }">
	<div class="r_matching" style="float: left">

		<%-- 		<c:set var="resDate" value="${day }" />
		${resDate.setDate(date) } --%>

		<form name='frm' action="Reservation"
			method="post">
			<c:forEach items="${slist }" var="svo">
				<div style="float: left">
					<%
						System.out.println("포이치");
					%>
					<div class="r_gpic">
						<img class="r_imgs" alt="기사님얼굴"
							src="../photo/engineer/g${svo.gid }.PNG">
					</div>
					<div>
						10시
						<c:choose>
							<c:when test="${svo.part1==0 }">
								<font color="green">● </font>
								<input type="radio" name="part" id="p1"
									onclick="${schevo.setGid(svo.gid)};${schevo.setPart(1)}" value="p1" />
							</c:when>
							<c:otherwise>
								<font color="red"> ● </font>
								<input type="radio" name="part" disabled="disabled" value="p1" />
							</c:otherwise>
						</c:choose>
						13시

						<c:choose>
							<c:when test="${svo.part2==0 }">
								<font color="green"> ● </font>
								<input type="radio" name="part" id="p2"
									onclick="${schevo.setGid(svo.gid)};${schevo.setPart(2)}" value="p2" />
							</c:when>
							<c:otherwise>
								<font color="red"> ● </font>
								<input type="radio" name="part" disabled="disabled" value="p2" />
							</c:otherwise>
						</c:choose>
						15시
						<c:choose>
							<c:when test="${svo.part3==0 }">
								<font color="green">● </font>
								<input type="radio" name="part" id="p3"
									onclick="${schevo.setGid(svo.gid)};${schevo.setPart(3)}" value="p3" />
							</c:when>
							<c:otherwise>
								<font color="red"> ● </font>
								<input type="radio" name="part" disabled="disabled" value="p3" />
							</c:otherwise>
						</c:choose>
					</div>
				</div>
<%-- 				<input type="hidden" name="part" value="<%=part%>" />
				<input type="hidden" name="gid" value="<%=gid%>" /> --%>

			</c:forEach>
			<input type="hidden" name="userid" value="${user.userId }" />
			 <input type="hidden" name="resdate" value="118-4-21"
			  <%-- ${day.year }-${day.month}-${day.date} --%> />
			<input type="hidden" name="gid" value="${schevo.gid }" />
			<input type="hidden" name="part" value="${schevo.part }" />

			<div align="center" style="clear: both">
				<input type="button" onclick="reserbtn()" value="예약하기" />
			</div>
		</form>
	</div>
</c:if>



