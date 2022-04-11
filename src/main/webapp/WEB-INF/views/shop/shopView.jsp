<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${url}/css/shop/shopViewStyle.css">
<main>
	<img src="https://submergemag.com/wp-content/uploads/2013/05/Submerge-No-Coast-IMG_0113-624x416.jpg" width="100%"/>
	<!-- kakao map API 불러오기(키 입력) -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d541fce355c305835dd7871d26048357&libraries=services,clusterer,drawing"></script>
	<div class="map_wrap">
		<div id="map" 
		style="width: 80%; height: 100%; position: relative; left:20%; overflow: hidden;"></div>
		<div id="menu_wrap" class="bg_white">
			<div class="option">
				<div>
					<form onsubmit="searchPlaces(); return false;">
						<input type="text" value="" id="keyword" size="25" placeholder="검색할 지역을 입력해주세요..">
						<button type="submit">검색</button>
					</form>
				</div>
			</div>
			<hr>
			<ul id="placesList"></ul>
			<div id="pagination"></div>
		</div>
	</div><!-- map_wrap -->
	<script type="text/javascript" src="${url}/js/shop/shopViewScript.js"></script>
	<button onclick="gps_tracking()">내위치 검색</button>
</main>