<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${url}/css/course/courseRecommendStyle.css" />
<!-- parallax START -->
<div class="home">
	<div class="homeBackground parallaxWindow" data-parallax="scroll" 
		 data-image-src="${url}/images/home_background.png"></div> <!-- 배경 이미지 -->
	<div class="homeContent">
		<div class="homeTitle">추천 코스</div> <!-- 페이지 타이틀 -->
	</div>
</div>
<!-- parallax END -->

<main>
	<a href=""> <!-- 클릭 시 링크 설정 -->
		<div class="card">
			<!-- 카드 헤더 -->
			<div class="cardHeader">
				<img class="cardThumbnail" src="${url}/images/courseImg.png">
			</div>

			<!--  카드 바디 -->
			<div class="cardBody">
				<!--  카드 바디 헤더 -->
				<div class="cardBodyHeader">
					<h1>아라뱃길 입문 코스</h1>
					<p class="cardBodyHashtag">#아라뱃길 #입문 </p>
					<p class="cardBodyNickname">내용 2</p>
				</div>

				<!--  카드 바디 본문 -->
				<p class="cardBodyDescription">추천코스 설명입니다아아</p>

				<!--  카드 바디 푸터 -->
				<div class="cardBodyFooter">
					<hr style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">
					<i class="icon iconViewCount"></i>조회 38회 
					<i class="icon iconCommentsCount"></i>댓글 4개 
					<i class="regDate">2018/04/12</i>
				</div>
			</div>
		</div>
	</a> 
</main>