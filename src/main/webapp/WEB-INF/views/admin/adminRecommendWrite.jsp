<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${url}/css/recommend/recommendCreateStyle.css" />
<!-- parallax START -->
<div class="home">
	<div class="homeBackground parallaxWindow" data-parallax="scroll" 
		 data-image-src="${url}/images/home_background.png"></div> <!-- 배경 이미지 -->
	<div class="homeContent">
		<div class="homeTitle">추천 코스 생성</div> <!-- 페이지 타이틀 -->
	</div>
</div>
<!-- parallax END -->

<main>
	<form id="recommendSendDataFrm" action="/admin/adminRecommendWriteOk" method="post">
		<label>제목</label>
		<input type="text" id="recTitle" name="recTitle"/>
		<label>해시태그</label>
		<input type="text" id="recHashtag" name="recHashtag"/>
		<label>설명</label>
		<textarea id="recDescription" name="recDescription"></textarea> 
		<select id="recLevel" name="recLevel" class="recLevel">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
         </select>
		<textarea style="display:none" name="recommendSendData"></textarea>
	</form>
	<!-- kakao map API 불러오기(키 입력) -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d541fce355c305835dd7871d26048357&libraries=services,clusterer,drawing"></script>
	<div class="map_wrap">
		<div id="courseInput">
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
				<br/>
				<select id="bikeType" onchange="chagebikeType()">
					<option value="cycling-regular">일반</option>
					<option value="cycling-road">로드</option>
					<option value="cycling-mountain">산악</option>
					<option value="cycling-electric">전기</option>
				</select>
				<button type="button" class="w-btn w-btn-blue btnSearchCourse" onclick="searchAllCourse()">경로 탐색하기</button>
				<div style="width:100%; position:relative;">
					<input type="checkbox" id="chkBicycle" onclick="setOverlayMapTypeId()" style="left: 3px; height: 15px; width: 15px; position: relative;"/>
					<span class="grayTxt" style="position:relative; left: 4px; top:3px;">자전거도로 정보 보기</span>
				</div>
				<div class="routeInfoWrap">
					<div id="routeInfo0" onclick="selectRoute(0)">
						<h2 class="routeInfoRgt" style="width: 200px; font-weight:10px; font-weight: bold; font-size: 20px; top: 6px; position: relative; ">추천경로</h2>
						<span class="routeInfoRgt" style="font-size: 1.2em; font-weight: bold; width: 200px; top: 6px; position: relative;">
							<span id="routeDistance0"></span>
							<span class="routeInfoRgt" id="routeDuration0"></span>
						</span> <br />
						<span class="routeInfoRgt" style="font-size: 0.7em; color: #d0cfcf;"> 상승고도 
							<span id="routeAscent0"></span>&nbsp;/ &nbsp;하강고도
							<span id="routeDescent0"></span>
						</span>
						<canvas id="myChart0" width="300" height="60"></canvas>
						<button class="ridingWriteBtn" onclick="return recommendDataSend(0)" type="button" style="position: absolute;top: 5px; left: 204px; width: 50px; height: 40px;"><i class="fas fa-biking"></i></button>
					</div>
					<div id="routeInfo1" onclick="selectRoute(1)">
						<h2 class="routeInfoRgt" style="width: 200px; font-weight:10px; font-weight: bold; font-size: 20px; top: 6px; position: relative; ">빠른경로</h2>
						<span class="routeInfoRgt" style="font-size: 1.2em; font-weight: bold; width: 200px; top: 6px; position: relative;">
							<span id="routeDistance1"></span>
							<span class="routeInfoRgt" id="routeDuration1"></span>
						</span> <br />
						<span class="routeInfoRgt" style="font-size: 0.7em; color: #d0cfcf;"> 상승고도 
							<span id="routeAscent1"></span>&nbsp;/ &nbsp;하강고도
							<span id="routeDescent1"></span>
						</span>
						<canvas id="myChart1" width="300" height="60"></canvas>
						<button class="ridingWriteBtn" onclick="return recommendDataSend(1)" type="button" style="position: absolute;top: 5px; left: 204px; width: 50px; height: 40px;"><i class="fas fa-biking"></i></button>

					</div>
					<div id="routeInfo2" onclick="selectRoute(2)">
						<h2 class="routeInfoRgt" style="width: 200px; font-weight:10px; font-weight: bold; font-size: 20px; top: 6px; position: relative; ">최단경로</h2>
						<span class="routeInfoRgt" style="font-size: 1.2em; font-weight: bold; width:200px;top: 6px; position: relative;">
							<span id="routeDistance2"></span>
							<span class="routeInfoRgt" id="routeDuration2"></span>
						</span> <br />
						<span class="routeInfoRgt" style="font-size: 0.7em; color: #d0cfcf;"> 상승고도 
							<span id="routeAscent2"></span>&nbsp;/ &nbsp;하강고도
							<span id="routeDescent2"></span>
						</span>
						<canvas id="myChart2" width="300" height="60"></canvas>
						<button class="ridingWriteBtn" onclick="return recommendDataSend(2)" type="button" style="position: absolute;top: 5px; left: 204px; width: 50px; height: 40px;"><i class="fas fa-biking"></i></button>
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
		<script type="text/javascript" src="${url}/js/admin/adminRecommendCreate.js"></script>
</main>