<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#cList{overflow:auto;}
	#cList>li{float:left; width:10%; border-bottom:solid 1px gray;}
	#cList>li:nth-child(5n+2){width:60%;}
</style>
<main>
	<div class="comtyContainer">
		<h1>게시판 글목록</h1>
		<div>
			<a href="/comty/comtyWrite">글쓰기</a>
		</div>
		<ul id="cList">
			<li>번호</li>
			<li>제목</li>
			<li>글쓴이</li>
			<li>조회수</li>
			<li>등록일</li>

			<c:forEach var="vo" items="${lst }">
				<li>${vo.comtyNo }</li>
				<li><a href="/comty/comtyView?comtyNo=${vo.comtyNo}">${vo.comtySubject }</a></li>
				<li>${vo.nickname }</li>
				<li>${vo.comtyHit }</li>
				<li>${vo.comtyWriteDate }</li>
			</c:forEach>
		</ul>
	</div>
</main>