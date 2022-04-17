<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${url}/css/course/courseRecommendStyle.css" />
<!-- parallax START -->
<div class="home">
	<div class="homeBackground parallaxWindow" data-parallax="scroll" 
		 data-image-src="${url}/images/home_background.png"></div> <!-- 배경 이미지 -->
	<div class="homeContent">
		<div class="homeTitle">추천 코스 수정</div> <!-- 페이지 타이틀 -->
	</div>
</div>
<!-- parallax END -->

<main>
	<h1>추천 코스 수정</h1>
	<form action="/adminRecommendEditOk" method="post">
		<input type="hidden" name="recNo" value="${recommendVO.recNo}"/>
		<h3>제목</h3>
		<input type="text" id="recTitle" name="recTitle" value="${recommendVO.recTitle}"/>
		<h3>해시태그</h3>
		<input type="text" id="recHashtag" name="recHashtag" value="${recommendVO.recHashtag}"/>
		<h3>설명</h3>
		<input type="text" id="recDescription" name="recDescription" value="${recommendVO.recDescription}"/>
		
		<h3>난이도</h3>
		<input type="text" id="recLevel" name="recLevel" value="${recommendVO.recLevel}"/>
		<h3>예상 시간</h3>
		<input type="text" id="recTime" name="recTime" value="${recommendVO.recTime}"/>
		<h3>전체 거리</h3>
		<input type="text" id="recDistance" name="recDistance" value="${recommendVO.recDistance}"/>
		<h3>코스</h3>
		출발지 : <input type="text" id="recStartPoint" name="recStartPoint" value="${recommendVO.recStartPoint}"/>
		경유지 : <input type="text" id="recPoint1" name="recPoint1" value="${recommendVO.recPoint1}"/>
		도착지 : <input type="text" id="recEndPoint" name="recEndPoint" value="${recommendVO.recEndPoint}"/>
		<input type="submit" value="수정"></input>
	</form>
</main>