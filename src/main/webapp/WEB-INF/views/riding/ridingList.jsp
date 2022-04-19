<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="${url}/css/riding/ridingList.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d541fce355c305835dd7871d26048357&libraries=services,clusterer,drawing"></script>
<!-- parallax START -->
<div class="home">
	<div class="homeBackground parallaxWindow" data-parallax="scroll"
		data-image-src="${url}/images/home/home_background.png"></div>
	<!-- 배경 이미지 -->
	<div class="homeContent">
		<div class="homeTitle">라이딩 리스트</div>
		<!-- 페이지 타이틀 -->
	</div>
</div>
<!-- parallax END -->

<main>
	<div class="ridingListFrm" id="ridingListFrm">
		&nbsp;<h1>&nbsp;&nbsp;&nbsp;&nbsp;라이딩 리스트</h1>
		<c:set var="num" value="1" />
		<c:forEach var="vo" items="${lst }" varStatus="st">
			<textarea style="display:none" id="courseSendData${st.index}">${vo.courseSendData}</textarea>
			<a href="/riding/ridingView?ridingNo=${vo.ridingNo }"> <!-- 클릭 시 링크 설정 -->
			<div class="card">
				<!-- 카드 헤더 -->
				<div class="card-header">
					<div id="map${st.index}" style="height: 100%;"></div>
					<div class="card-header-is_closed">
						<div class="card-header-nNumbe">${vo.applicantCnt }/${vo.maxUser }</div>
					</div>
				</div>
				<!--  카드 바디 -->
				<div class="card-body">
					<!--  카드 바디 헤더 -->
					<div class="card-body-header">
						<h1>${vo.ridingSubject }</h1>
						<p class="card-body-hashtag">${vo.ridingKeyword }</p>
						<p class="card-body-nickname">${vo.nickname }</p>
					</div>
					<%-- <p class="card-body-description">${ridingSubject }</p> --%>
					<!--  카드 바디 본문 -->
					<!--  카드 바디 푸터 -->
					<div class="card-body-footer">
						<hr	style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">
						<i class="icon icon-view_count">${vo.ridingHit }</i> 
						<i class="reg_date">${vo.ridingWriteDate } </i>
					</div>
				</div>
			</div>
			</a>
		<c:set var="num" value="${num + 1}" />
		</c:forEach>
		<c:if test="${userId != null && userId != ''}">
			<div id="ridingwriteBTN">
				<button id="ridingwriteBtn" onclick="location.href='/riding/ridingWrite' ">글 작성하기</button>
			</div>
		</c:if>
	</div>
	<script type="text/javascript" src="${url}/js/riding/ridingList.js"></script>
</main>