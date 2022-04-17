<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${url}/css/course/courseCreateStyle.css">

<!-- parallax START -->
<div class="home">
	<div class="homeBackground parallaxWindow" data-parallax="scroll"
		data-image-src="${url}/images/home_background.png"></div>
	<!-- 배경 이미지 -->
	<div class="homeContent">
		<div class="homeTitle">코스 만들기</div>
		<!-- 페이지 타이틀 -->
	</div>
</div>
<!-- parallax END -->


<main>
	<input type="checkbox" id="chkBicycle" onclick="setOverlayMapTypeId()" />
	<span class="grayTxt">자전거도로 정보 보기</span>
	<!-- kakao map API 불러오기(키 입력) -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d541fce355c305835dd7871d26048357&libraries=services,clusterer,drawing"></script>
	<div class="map_wrap">
		<div name="courseSendData"></div>
		<div id="courseInput">
			<form>
				<div class="fromWrap">
					<img src="${url}/images/course/fromIcon.png"> 
					<input id="startPoint" type="text" value="남위례" placeholder="출발지를 입력하세요" class="placeInfoInsert" />
						<input id="startCoordinate" type="hidden"> <input id="startAddr" type="hidden">
				</div>
				<button type="button" class="changeFromTo">
					<img src="${url}/images/course/swap.png">
				</button>
				<div class="waypoints"></div>
				<div class="toWrap">
					<img src="${url}/images/course/toIcon.png"> 
					<input id="endPoint" type="text" value="경포해변" placeholder="도착지를 입력하세요" />
					<input id="endCoordinate" type="hidden"> 
					<input id="endAddr" type="hidden">
				</div>
				<button type="button" class="hihi">
					<img src="${url}/images/course/addIcon.png" class="btnAddWaypoint" onclick="addWaypoint()">
				</button>
				<button type="button" class="hihi">
					<img src="${url}/images/course/delete.png" onclick="deleteAllWaypoint(), removeAllMarkers(), clearAllPolylines()">
				</button>
				<br />
				<button type="button" onclick="searchAllCourse()">경로 탐색하기</button>
				<select id="bikeType" name="bikeType" onchange="chagebikeType()">
					<option value="cycling-regular">일반</option>
					<option value="cycling-road">로드</option>
					<option value="cycling-mountain">산악</option>
					<option value="cycling-electric">전기</option>
				</select>
				<div class="rourouteInfoWrap">
					<div id="routeInfo0" onclick="selectRoute(0)">
						<h2 class="routeInfoRgt" style="width: 200px;">추천 경로</h2>
						<span class="routeInfoRgt" style="font-size: 1.2em; font-weight: bold; width: 200px;">
							<span id="routeDistance0"></span>
							<span class="routeInfoRgt" id="routeDuration0"></span>
						</span> <br />
						<span class="routeInfoRgt" style="font-size: 0.7em; color: #d0cfcf;"> 상승고도 
							<span id="routeAscent0"></span>&nbsp;/ &nbsp;하강고도
							<span id="routeDescent0"></span>
						</span>
						<canvas id="myChart0" width="300" height="60"></canvas>
						<button class="ridingWriteBtn" type="button" style="position: absolute; bottom: 100px;">라이딩 개설</button>
					</div>
					<div id="routeInfo1" onclick="selectRoute(1)">
						<h2 class="routeInfoRgt" style="width: 200px;">빠른 경로</h2>
						<span class="routeInfoRgt" style="font-size: 1.2em; font-weight: bold; width: 200px;">
							<span id="routeDistance1"></span>
							<span class="routeInfoRgt" id="routeDuration1"></span>
						</span> <br />
						<span class="routeInfoRgt" style="font-size: 0.7em; color: #d0cfcf;"> 상승고도 
							<span id="routeAscent1"></span>&nbsp;/ &nbsp;하강고도
							<span id="routeDescent1"></span>
						</span>
						<canvas id="myChart1" width="300" height="60"></canvas>
						<button class="ridingWriteBtn" type="button" style="position: absolute; bottom: 100px;">라이딩 개설</button>
					</div>
					<div id="routeInfo2" onclick="selectRoute(2)">
						<h2 class="routeInfoRgt" style="width:200px;">최단 경로</h2>
						<span class="routeInfoRgt" style="font-size: 1.2em; font-weight: bold; width:200px;">
							<span id="routeDistance2"></span>
							<span class="routeInfoRgt" id="routeDuration2"></span>
						</span> <br />
						<span class="routeInfoRgt" style="font-size: 0.7em; color: #d0cfcf;"> 상승고도 
							<span id="routeAscent2"></span>&nbsp;/ &nbsp;하강고도
							<span id="routeDescent2"></span>
						</span>
						<canvas id="myChart2" width="300" height="60"></canvas>
						<button class="ridingWriteBtn" type="button" style="position: absolute; bottom: 100px;">라이딩 개설</button>
					</div>
				</div>
			</form>
			<div class="courseWrap"></div>
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
	</div>
	<!-- mapWrap -->
	<button type="button" onclick="generateThumbnail(polyTest, linepathTest);">썸네일 생성</button>
	<div id="ridingMap01" style="width:250px;height:200px;"></div>   
	
	<script type="text/javascript"
		src="${url}/js/course/courseCreateScript.js"></script>
</main>