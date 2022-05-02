<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${url}/css/shop/shopViewStyle.css">
<!-- parallax START -->
<div class="home">
	<div class="homeBackground parallaxWindow" data-parallax="scroll"
		data-image-src="${url}/images/home/home_background12.png"></div>
	<!-- 배경 이미지 -->
	<div class="homeContent">
		<div class="homeTitle">정비샵 찾기</div>
		<!-- 페이지 타이틀 -->
	</div>
</div>
<!-- parallax END -->
<main>
		<!-- kakao map API 불러오기(키 입력) -->
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d541fce355c305835dd7871d26048357&libraries=services,clusterer,drawing"></script>
		<div class="map_wrap">
		<div id="map" style="width: 80%; height: 100%; position: relative; left:20%; overflow: hidden;"></div>
		<div id="menu_wrap" class="bg_white">
			<div class="option">
				<div class="optionTitle">
					<span>정비샵 찾기</span>
				</div>

				<form onsubmit="searchPlaces(); return false;">
					<div class="optionForm">
							<input type="text" class="inputSearch" value="" id="keyword" size="25" placeholder="검색할 지역을 입력해주세요..">
						<button class="btn btnSearch" type="submit"><i class="fas fa-search"></i></button>
					</div>
				</form>
			</div>
			<ul id="placesList"></ul>
			<div id="pagination"></div>
			</div>
		</div><!-- map_wrap -->
		<script type="text/javascript" src="${url}/js/shop/shopViewScript.js"></script>
<!-- 		<button onclick="gps_tracking()">내위치 검색</button> -->
</main>

