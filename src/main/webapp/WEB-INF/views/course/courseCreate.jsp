<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${url}/css/course/courseCreateStyle.css">
<!-- parallax START -->
<div class="home">
	<div class="homeBackground parallaxWindow" data-parallax="scroll" 
		 data-image-src="${url}/images/home_background.png"></div> <!-- 배경 이미지 -->
	<div class="homeContent">
		<div class="homeTitle">코스 만들기</div> <!-- 페이지 타이틀 -->
	</div>
</div>
<!-- parallax END -->
<main>
	<!-- kakao map API 불러오기(키 입력) -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d541fce355c305835dd7871d26048357&libraries=services,clusterer,drawing"></script>
	<div class="map_wrap">
		<div id="courseInput">
			<form>
				<div class="fromWrap"> <img src="${url}/images/fromIcon.png">
					<input id = "startPoint" type="text" placeholder="출발지를 입력하세요" class="placeInfoInsert"/>
				</div>
				<button type ="button" class="changeFromTo"><img src="${url}/images/swap.png"></button>
				<div class="waypoints"></div>
				<div class="toWrap">
					<img src="${url}/images/toIcon.png">
					<input id = "endPoint" type="text" placeholder="도착지를 입력하세요"/>	
				</div>
				<button type ="button" class ="hihi"><img src="${url}/images/addIcon.png" class ="btnAddWaypoint" onclick="addWaypoint()"></button>
				<button type ="button" class ="hihi"><img src="${url}/images/delete.png" onclick="deleteAllWaypoint()"></button>
				<br/><button type="button">경로 탐색하기</button>
			</form>
		</div>
		
    	<div id="map"></div>
    	
    	<div id="menu_wrap" class="bg_white">
        	<div class="option">
            	<div>
                	<form onsubmit="searchPlaces(); return false;">
                    	키워드 : <input type="text" value="" id="keyword" size="15"> 
                    	<button type="submit">검색하기</button> 
                	</form>
            	</div>
        	</div>
        	<hr>
        	<ul id="placesList"></ul>
        	<div id="pagination"></div>
    	</div>
	</div><!-- mapWrap -->
	<script type="text/javascript" src="${url}/js/course/courseCreateScript.js"></script>
</main>