<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">

	var ohclick = function(i){
		alert(i);
	} 
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
	margin: 0;
	padding: 0;
}
html,body{
	width:100%;
	height: 100%;
}
.favorite{
	width: 100%;
	height: 30%;
	position: relative;
	background-color: #224;
	border: 5px outset #224;
}
.imgs{
	height: 100%;
	width: 30%;
	position: relative;
	float: right;
}
.H_down_img{
	width: 50%;
	height: 90%;
}
#cate{
	margin-top: 10px;
	position: relative;
	width: 100%;
	height: 60%;
	border:5px outset #224;
	clear: both;
}
#alter{
	
	width: 30px;
	height: 100%;
}

</style>
</head>
<body>
<div style="width: 100%; height: 3%; border-bottom: 1px inset gray;">
	<jsp:include page="inc/hightop.jsp"></jsp:include>
</div>
<div style="width: 100%; height: 10%; border-bottom: 1px inset gray; position: relative;">
	<jsp:include page="inc/top.jsp"></jsp:include>
</div>
<div style="width: 50%; height:80%; margin-left: 25%; position:relative;">
<jsp:include page="../view/bb/${main }"></jsp:include>
</div>
<div style="width: 100%; height: 5%; border-bottom: 1px inset gray; position: relative;">
</div>
<div style="width: 100%; height: 10%; position: relative; margin-top:1%; border-bottom: 1px inset gray;">
<jsp:include page="inc/bottom.jsp"></jsp:include>
</div>
<c:forEach items="${data }" var="i" varStatus="no">
	<a onclick="ohclick(${data.id},${data.userid })"> ${i }</a>
</c:forEach>
</body>
</html>