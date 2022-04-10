<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.comtyContainer {
	margin: 0 auto;
	padding: 0 auto;
	width:80%;
	height:100%;
}
#cList {
	overflow: auto;
}

#cList>li {
	float: left;
	height: 40px;
	line-height: 40px;
	border-bottom: 1px solid #ddd;
	width: 10%;
	color: black;
}

#cList>li:nth-child(5n+2) {
	width: 50%;
	white-space: nowrap; /*줄 안바꿈*/
	overflow: hidden; /*넘친내용 숨기기*/
	text-overflow: ellipsis; /*넘침시 ...표시*/
}
#cList>li:nth-child(5n) {
	width: 20%;
}
#cListFirst {
	background-color: rgba(234, 234, 234);
}

#writeBtn {
	background-color: rgba(255, 217, 102);
	padding: 10px 50px;
	margin: 0px;
	border-radius: 6px;
	border-color: rgba(204, 204, 204);
	float: right;
}

</style>
<main>
	<div class="comtyContainer">
		<h1 style="margin:0 auto; padding:40px;">커뮤니티</h1>
		<ul id="cList">
			<li id="cListFirst">번호</li>
			<li id="cListFirst">제목</li>
			<li id="cListFirst">글쓴이</li>
			<li id="cListFirst">조회수</li>
			<li id="cListFirst">등록일</li>
			<c:forEach var="vo" items="${lst }">
				<li>${vo.comtyNo }</li>
				<li><a href="/comty/comtyView?comtyNo=${vo.comtyNo}">${vo.comtySubject }</a></li>
				<li>${vo.nickname }</li>
				<li>${vo.comtyHit }</li>
				<li id="comtyWD">${vo.comtyWriteDate }</li>
			</c:forEach>
		</ul>
		<c:if test="${logId != null && logId != ''}">
			<div id="writeBTN">
				<button id="writeBtn" onclick="location.href='/comty/comtyWrite' ">글 작성하기</button>
			</div>
		</c:if>
	</div>
</main>