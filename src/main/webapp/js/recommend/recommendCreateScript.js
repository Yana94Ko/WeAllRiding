console.log("작동중")
//--> 처음 실행시 주변 자전거샵 위치 표시해주기
var datas = null;
setTimeout(function() {
	gps_tracking();
	setTimeout(function() { searchPlacesNearBy(); }, 200);
}, 200);

function searchPlacesNearBy() {
	map.setLevel(5);
	map.setCenter(new kakao.maps.LatLng(gps_lat, gps_lng));
}
// 처음 실행시 주변 자전거샵 위치 표시해주기 <--

//--> 현재 위치 반환 관련 함수 모음
var gps_use = null; //gps의 사용가능 여부
var gps_lat = null; // 위도
var gps_lng = null; // 경도
var gps_position; // gps 위치 객체

gps_check();
// gps가 이용가능한지 체크하는 함수이며, 이용가능하다면 show location 함수를 불러온다.
// 만약 작동되지 않는다면 경고창을 띄우고, 에러가 있다면 errorHandler 함수를 불러온다.
// timeout을 통해 시간제한을 둔다.
function gps_check() {
	if (navigator.geolocation) {
		var options = { timeout: 60000 };
		navigator.geolocation.getCurrentPosition(showLocation, errorHandler, options);
	} else {
		alert("GPS_추적이 불가합니다.");
		gps_use = false;
	}
}

// gps 이용 가능 시, 위도와 경도를 반환하는 showlocation함수.
function showLocation(position) {
	gps_use = true;
	gps_lat = position.coords.latitude;
	gps_lng = position.coords.longitude;
}

// error발생 시 에러의 종류를 알려주는 함수.
function errorHandler(error) {
	if (error.code == 1) {
		alert("접근차단");
	} else if (err.code == 2) {
		alert("위치를 반환할 수 없습니다.");
	}
	gps_use = false;
}

function gps_tracking() {
	if (gps_use) {
		map.panTo(new kakao.maps.LatLng(gps_lat, gps_lng));
		var gps_content = '<div><img class="pulse" draggable="false" unselectable="on" src="https://ssl.pstatic.net/static/maps/m/pin_rd.png" alt=""></div>';
		var currentOverlay = new kakao.maps.CustomOverlay({
			position: new kakao.maps.LatLng(gps_lat, gps_lng),
			content: gps_content,
			map: map
		});
		currentOverlay.setMap(map);
		searchPlacesNearBy();
	} else {
		alert("접근차단하신 경우 새로고침, 아닌 경우 잠시만 기다려주세요.");
		gps_check();
	}
}

//현재 위치 반환 관련 <--

// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		level: 3 // 지도의 확대 레벨
	};

// 지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption);

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();

// 지도 타입 변경 컨트롤을 생성한다
var mapTypeControl = new kakao.maps.MapTypeControl();

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {
	//검색 기능이 실현되면, 목록창(menu_wrap) 띄워주기
	menu_wrap.style.display = 'inline';
	var keyword = document.getElementById('keyword').value;

	if (!keyword.replace(/^\s+|\s+$/g, '')) {
		alert('키워드를 입력해주세요!');
		return false;
	}

	// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	ps.keywordSearch(keyword, placesSearchCB, {
		size: 10 //한 페이징 리스트에 표시될 장소 갯수
	});
}
// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
	if (status === kakao.maps.services.Status.OK) {
		// 정상적으로 검색이 완료됐으면
		// 검색 목록과 마커를 표출합니다
		displayPlaces(data);
		// 페이지 번호를 표출합니다
		displayPagination(pagination);

	} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
		alert('검색 결과가 존재하지 않습니다.');
		return;
	} else if (status === kakao.maps.services.Status.ERROR) {
		alert('검색 결과 중 오류가 발생했습니다.');
		return;
	}
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {
	var listEl = document.getElementById('placesList'),
		menuEl = document.getElementById('menu_wrap'),
		fragment = document.createDocumentFragment(),
		bounds = new kakao.maps.LatLngBounds(),
		listStr = '';

	// 검색 결과 목록에 추가된 항목들을 제거합니다
	removeAllChildNods(listEl);

	// 지도에 표시되고 있는 마커를 제거합니다
	removeMarker();

	for (var i = 0; i < places.length; i++) {
		// 마커를 생성하고 지도에 표시합니다
		var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
			marker = addMarker(placePosition, i),
			itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

		// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		// LatLngBounds 객체에 좌표를 추가합니다
		bounds.extend(placePosition);

		// 마커와 검색결과 항목 click 했을때
		// 해당 장소에 인포윈도우에 장소명을 표시합니다
		(function(marker, places) {
			kakao.maps.event.addListener(marker, 'click', function(event) {
				datas = places;
				infowindow.close();
				displayInfowindow(marker, places.place_name);
				map.setCenter(marker.getPosition());//클릭한 장소의 마커가 지도의 중심에 오도록 이동
				savePlaceInfo(datas);
				addWaypointMarker();
				//searchCourse();
			});
			itemEl.onclick = function(event) {
				datas = places;
				infowindow.close();
				displayInfowindow(marker, places.place_name);
				map.setCenter(marker.getPosition());//클릭한 장소의 마커가 지도의 중심에 오도록 이동
				savePlaceInfo(datas);
				addWaypointMarker();
				//searchCourse();
			};
		})(marker, places[i]);
		fragment.appendChild(itemEl);
	}
	// 검색결과 항목들을 검색결과 목록 Element에 추가합니다
	listEl.appendChild(fragment);
	menuEl.scrollTop = 0;

	// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {
	var el = document.createElement('li'),
		itemStr = '<span class="markerbg marker_' + (index + 1) + '"></span>' +
			'<div class="info">' +
			'<h5>' + places.place_name + '</h5>';

	if (places.road_address_name) {
		itemStr += '<span>' + places.road_address_name + '</span>' +
			'<span class="jibun gray">' + places.address_name + '</span>';
	} else {
		itemStr += '<span>' + places.address_name + '</span>';
	}

	itemStr += ' <span class="tel">' + places.phone + '</span>' + '</div>';
	el.innerHTML = itemStr;
	el.className = 'item';
	return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
	var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
		imgOptions = {
			spriteSize: new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
			spriteOrigin: new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
			offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
		},
		markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		marker = new kakao.maps.Marker({
			position: position, // 마커의 위치
			image: markerImage
		});

	marker.setMap(map); // 지도 위에 마커를 표출합니다
	markers.push(marker); // 배열에 생성된 마커를 추가합니다

	return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
	for (var i = 0; i < markers.length; i++) {
		markers[i].setMap(null);
	}
	markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
	var paginationEl = document.getElementById('pagination'),
		fragment = document.createDocumentFragment(),
		i;

	// 기존에 추가된 페이지번호를 삭제합니다
	while (paginationEl.hasChildNodes()) {
		paginationEl.removeChild(paginationEl.lastChild);
	}

	for (i = 1; i <= pagination.last; i++) {
		var el = document.createElement('a');
		el.href = "#";
		el.innerHTML = i;

		if (i === pagination.current) {
			el.className = 'on';
		} else {
			el.onclick = (function(i) {
				return function() {
					pagination.gotoPage(i);
				}
			})(i);
		}
		fragment.appendChild(el);
	}
	paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, placeNname) {
	var content = '<div style="padding:5px;z-index:1;">' + placeNname + '</div>';

	infowindow.setContent(content);
	infowindow.open(map, marker);
}

// 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {
	while (el.hasChildNodes()) {
		el.removeChild(el.lastChild);
	}
}

//--> 경유지 추가
var btnAddWaypoint = document.querySelector(".btnAddWaypoint");
var changeFromTo = document.querySelector(".changeFromTo");
var waypoints = document.querySelector(".waypoints");
var hihi = document.querySelector(".hihi");

function addWaypoint() {
	if ($(".waypoints").children().length < 18) {//경유지 추가 가능 갯수 : 10개
		//console.log($(".waypoints").children().length);
		//추가될 태그들을 감쌀 부모(div) 엘리먼트 - 생성
		var waypointWrap = document.createElement('div');
		//추가될 태그들을 감쌀 부모(div) 엘리먼트 - 설정
		waypointWrap.className = "waypointWrap";
		//추가될 태그 엘리먼트들 - 생성
		var img1 = document.createElement('img');
		var input1 = document.createElement('input');
		var input2 = document.createElement('input');
		var input3 = document.createElement('input');
		var img2 = document.createElement('img');
		//추가될 태그 엘리먼트들 - 설정
		img1.src = '/images/course/waypointIcon.png';
		input1.setAttribute('type', 'text');
		input1.setAttribute('id', 'pointName');
		input1.setAttribute('style', 'z-index:900');
		input2.setAttribute('type', 'text');
		input2.setAttribute('id', 'pointCoordinate');
		input2.setAttribute('name', 'pointCoordinate');
		input3.setAttribute('type', 'text');
		input3.setAttribute('id', 'pointAddr');
		img2.className = "minusBtn";
		img2.setAttribute('style', 'margin-left:194px;');
		img2.src = '/images/course/minusIcon.png';

		//부모엘리먼트에 자식 추가
		waypointWrap.appendChild(img1);
		waypointWrap.appendChild(input1);
		waypointWrap.appendChild(input2);
		waypointWrap.appendChild(input3);
		waypointWrap.appendChild(img2);

		//html에 추가
		waypoints.appendChild(waypointWrap);

		changeFromTo.style.display = 'none';
		//hihi.style.margin=$(".waypoints").children().length+'0 0 0';
		$('input[id=pointName]').on("keyup focusout", function(event) {
			keyword.value = this.value;
			if (window.event.keyCode == 13) {
				$('#targetId').val(event.target.id);
				eventthis = this;
				// 엔터키가 눌렸을 때 실행할 내용
				searchPlaces();
			}
		});
		//--> 경유지 개별 삭제
		$('.minusBtn').on("click", function(event) {
			idxNo = $(this).parent().index();
			$(this).parent().remove();
			if ($(".waypoints").children().length == 0) {
				changeFromTo.style.display = 'inline';
			}
			infowindow.close();
			addWaypointMarker();
		});
		// 경유지 개별 삭제 <--
	} else {
		alert("경유지는 최대 10개까지 밖에 만들 수 없어요..!");
	}
}
var idxNo = 0;
//-> 출발지 도착지 경유지 전체 삭제
function deleteAllWaypoint() {
	infowindow.close()
	//경유지 삭제
	$(".waypoints").empty();
	$(".fromWrap").children().val(null);
	$(".toWrap").children().val(null);
	changeFromTo.style.display = 'inline';
	//console.log("너 살아있니?")

	//차트 삭제
	removeChart();
}

//-> 출발지/도착지/경유지 입력 이벤트가 발생한 input의 id 를 저장
var placeInfoInsert = document.querySelector(".fromWrap");
var keyword = document.getElementById("keyword");
var targetId = document.getElementById("targetId");
var eventthis;
$('#startPoint, #endPoint, #pointName').on("keyup", function(event) {
	eventthis = this;
	keyword.value = this.value;
	if (window.event.keyCode == 13) {
		// 엔터키가 눌렸을 때 실행할 내용
		searchPlaces();
	}
});
var boundsRoute = new kakao.maps.LatLngBounds();
//클릭한 장소의 정보 받아와 저장하기
function savePlaceInfo(datas) {
	var savedTargetId = $('#targetId').val();
	boundsRoute.extend(new kakao.maps.LatLng(datas.y, datas.x));
	map.setBounds(boundsRoute);
	eventthis.value = datas.place_name;
	eventthis.nextElementSibling.value = "[" + datas.x + "," + datas.y + "]";
	eventthis.nextElementSibling.nextElementSibling.value = datas.address_name;
	//console.log(eventthis.nextElementSibling.value);
	//console.log(eventthis.nextElementSibling.nextElementSibling.value);
	//리스트가 클릭되면, 목록창(menu_wrap) 가리기
	menu_wrap.style.display = 'none';
}

//출발지 도착지 교환 버튼 클릭시 값 뒤바꿔주기
$('.changeFromTo').on("click", function() {
	var temp = document.getElementById("startPoint").value;
	document.getElementById("startPoint").value = document.getElementById("endPoint").value;
	document.getElementById("endPoint").value = temp;
	var temp = document.getElementById("startCoordinate").value;
	document.getElementById("startCoordinate").value = document.getElementById("endCoordinate").value;
	document.getElementById("endCoordinate").value = temp;
	addWaypointMarker();
});

// 자전거 도로 표시 온오프 처리
function setOverlayMapTypeId() {
	var chkBicycle = document.getElementById("chkBicycle");
	var mapType = kakao.maps.MapTypeId.BICYCLE;

	if (chkBicycle.checked) {
		map.addOverlayMapTypeId(mapType);
	} else {
		map.removeOverlayMapTypeId(mapType);
	}
};

//=======================================> 경로 생성/삭제 관련 start <============================================
//-----------------> OpenRouteService inmport Start <------------------------
var coordinates = ""; // 검색할 위치 정보
var preference;// 검색할 경로 타입 : 빠른 경로 - fastest 최단경로 - shortest 추천 경로 - recommended
var preferences = ["recommended", "fastest", "shortest"];

var radiuses = "800";// 각 웨이포인트마다 주변 도로를 검색할 범위 제한(m) / -1 : 최대 검색 반경 사용 / 값을 1개만 입력시 모든 웨이포인트에 적용
var courseData = ""; //경로 검색 후 돌려받은 String 데이터를 저장할 변수
var points = [];
var geocode = "";
var temp = "";
var distances = [];
var durationes = [];
var allPoints = [];
var myCharts = [];
var geocodes = [];
var chartLabel = [];
var chartData = [];
var ascents = [];
var descents = [];
var bikeType = "cycling-regular";
function chagebikeType() {
	bikeType = document.getElementById("bikeType").options[document.getElementById("bikeType").selectedIndex].value;
	//console.log("bikeType : " + bikeType);
}
//모든 경로 탐색 및 데이터 생성
function searchAllCourse() {
	var cnt = 0;
	clearAllPolylines();
	$.each(preferences, function(routeNo, value) {
		preference = value;
		searchCourse(preference, routeNo);
	});
	//--------> 경로 정보 표시 관련 Start <-------
	$(".routeInfoWrap div").css("display", "inline-block");
	//---------> 경로 정보 표시 관련 End <--------
}

function searchCourse(preference, routeNo) {
	if (!document.getElementById("startPoint").value || !document.getElementById("endPoint").value) {
		return false;
	}
	//출발지 좌표 추가
	coordinates = "[" + document.getElementById("startCoordinate").value;
	//경유지 좌표 추가
	for (var i = 0; i < $(".waypoints").children().length; i++) {
		coordinates += "," + $("input[name=pointCoordinate]").eq(i).val();
	}
	//도착지 좌표 추가
	coordinates += "," + document.getElementById("endCoordinate").value + "]";

	//--- > 경로 타입 : OpenRouteService 중에서 경유지를 가지는 경로탐색 
	let request = new XMLHttpRequest();

	//1) cycling-regular 기준으로 경로 탐색
	request.open('POST', "https://api.openrouteservice.org/v2/directions/" + bikeType);

	request.setRequestHeader('Accept', 'application/json, application/geo+json, application/gpx+xml, img/png; charset=utf-8');
	request.setRequestHeader('Content-Type', 'application/json');
	//내 Authorization key니까... 소중히 쓰도록.... -yana
	request.setRequestHeader('Authorization', '5b3ce3597851110001cf62481bb5a71b56e44657aadab2fd7357a24e');

	request.onreadystatechange = function() {
		if (this.readyState === 4) {
			////console.log('Status:', this.status);
			////console.log('Headers:', this.getAllResponseHeaders());
			//console.log('Body:', this.responseText);

			courseData = this.responseText;//courseData에 되돌려 받은 String값 저장
			var courseDataParse = JSON.parse(courseData);//입력받은 String값을 json Data로 파싱
			var course = courseDataParse.routes;

			distances[routeNo]=course[0].summary.distance.toFixed(2);
			$("#routeDistance"+routeNo).html(distances[routeNo]+"km");
			durationes[routeNo]=(course[0].summary.duration/60/60).toFixed(0)+"시간 "+(course[0].summary.duration%60).toFixed(0)+"분";//초를 분단위로 변환
			$("#routeDuration"+routeNo).html(durationes[routeNo]);
			ascents[routeNo]=course[0].summary.ascent;
			$("#routeAscent"+routeNo).html(ascents[routeNo]+"m");
			descents[routeNo]=course[0].summary.descent;
			$("#routeDescent"+routeNo).html(descents[routeNo]+"m");

			//console.log(preference+"의 총거리" + distances[routeNo]);
			//console.log(preference+"의 소요시간" + durationes[routeNo]);
			//console.log(preference+"의 상승고도" + ascents[routeNo]);
			//console.log(preference+"의 하강고도" + descents[routeNo]);

			//Geomery값 추출
			points = decodeGeometry(course[0].geometry, true);

			allPoints[routeNo]=[];//경로 데이터 전달을 위한 경로 데이터 배열 저장
			allPoints[routeNo]=points;
			chartLabel = [];
			chartData = [];
			//고도값 정제
			for (var i = 0; i < points.length; i++) {
				chartLabel.push("'" + points[i][0] + "," + points[i][1] + "'");
				chartData.push(points[i][2]);
			}
			var myChart;
			//차트 그리기
			plot(chartLabel, chartData, routeNo);

			//경로 생성
			setCourseLine(points, preference, routeNo);

			geocodes[routeNo] = course[0].geometry;
			/*$("#distance").text(route[0].summary.distance.toFixed(2));
			$("#ascent").text(route[0].summary.ascent);
			$("#descent").text(route[0].summary.descent);
			$("#duration").text(route[0].summary.duration);*/

		}
	};

	var body = '{ "coordinates":' + coordinates + ',';
	body += '"attributes": ["percentage", "detourfactor", "avgspeed"],';//detourfactor : 직선거리 대비 생성된 루트 비율 & avgspeed : 평균 속도
	body += '"elevation": "true",';//경사도(웨이포인트 사이의 경사도를 반환)
	body += '"extra_info": ["surface", "waytype", "steepness"],'; //surface - 길의 포장 표면 & waytype - 자전거길 여부 & steepness - 경사도
	body += '"geometry_simplify": "false",'//옵션들을 사용하기 위해 false
	body += '"id": "routing_", ';//옵션값 ID
	body += '"maneuvers": "true", ';//maneuvers - 각 세그멘트 별로 기동 방향(네비게이션)
	body += '"preference": "' + preference + '",'; //: 빠른 경로 - fastest 최단경로 - shortest 추천 경로 - recommended
	body += '"radiuses": ' + radiuses + ',';//각 웨이포인트마다 주변 도로를 검색할 범위 제한(m) / -1 : 최대 검색 반경 사용 / 값을 1개만 입력시 모든 웨이포인트에 적용
	body += '"units": "km", ';//거리 단위
	body += '"geometry": "true" }';//경로 지도 표시 여부(poly)
	request.send(body);

	//// 경로 타입 : OpenRouteService 중에서 경유지를 가지는 경로탐색 <--
}
//-----------------> OpenRouteService inmport end <------------------------

//-------------------------> geometry 디코딩 관련 start <----------------------
function decodeGeometry(encodedPolyline, includeElevation) {
	/*
	* Decode an x,y or x,y,z encoded polyline
	* @param {*} encodedPolyline
	* @param {Boolean} includeElevation - true for x,y,z polyline
	* @returns {Array} of coordinates
	*/
	// array that holds the points
	let points = []
	let index = 0
	const len = encodedPolyline.length
	let lat = 0
	let lng = 0
	let ele = 0
	while (index < len) {
		let b
		let shift = 0
		let result = 0
		do {
			b = encodedPolyline.charAt(index++).charCodeAt(0) - 63 // finds ascii
			// and subtract it by 63
			result |= (b & 0x1f) << shift
			shift += 5
		} while (b >= 0x20)

		lat += ((result & 1) !== 0 ? ~(result >> 1) : (result >> 1))
		shift = 0
		result = 0
		do {
			b = encodedPolyline.charAt(index++).charCodeAt(0) - 63
			result |= (b & 0x1f) << shift
			shift += 5
		} while (b >= 0x20)
		lng += ((result & 1) !== 0 ? ~(result >> 1) : (result >> 1))

		if (includeElevation) {
			shift = 0
			result = 0
			do {
				b = encodedPolyline.charAt(index++).charCodeAt(0) - 63
				result |= (b & 0x1f) << shift
				shift += 5
			} while (b >= 0x20)
			ele += ((result & 1) !== 0 ? ~(result >> 1) : (result >> 1))
		}
		try {
			let location = [(lat / 1E5), (lng / 1E5)]
			if (includeElevation) location.push((ele / 100))
			points.push(location)
		} catch (e) {
			//console.log(e)
		}
	}
	return points;
}
//-------------------------> geometry 디코딩 관련 end <-------------------------

//-----------------> Chart.js 차트 생성 Start <------------------------
//차트 생성
var charBorderColor = '';
var charBackgroundColor = '';
var chartLabel0;
var chartLabel1;
var chartLabel2;
var chartData0;
var chartData1;
var chartData2;

function plot(chartLabel, chartData, routeNo) {
	removeChart(routeNo);

	if(routeNo==0){
		charBorderColor="rgba(0, 206, 125, 1)";
		charBackgroundColor="rgba(0, 206, 125, 0.5)";
		chartLabel0=chartLabel;
		chartData0=chartData;
	}else if(routeNo==1){
		charBorderColor="rgba(51, 150, 255, 1)";
		charBackgroundColor="rgba(51, 150, 255, 0.5)";
		chartLabel1=chartLabel;
		chartData1=chartData;
	}else if(routeNo==2){
		charBorderColor="rgba(238, 99, 174, 1)";
		charBackgroundColor="rgba(238, 99, 174, 0.5)";
		chartLabel2=chartLabel;
		chartData2=chartData;

	}
	var labels = chartLabel;
	myCharts[routeNo] = new Chart(
		document.getElementById('myChart' + routeNo),
		{
			type: 'line',
			data: {
				labels: labels,
				datasets: [{
					label: '고도 정보',
					borderColor: charBorderColor,
					borderWidth: 0.5,
					backgroundColor: charBackgroundColor,
					fill: true,
					lineTension: 0.1,
					data: chartData,
					pointRadius: 2,
					pointBorderColor: 'rgba(0, 0, 0, 0)',
					pointBackgroundColor: 'rgba(0, 0, 0, 0)',
				}]
			},
			options: {
				plugins: {
					legend: {
						display: false
					}
				},
				scales: {
					x: {
						label: {
							display: false,
						},
						grid: { //x축을 기준으로 그려지는(세로선)에 대한 설정
							display: false,
						},
						ticks: { //텍스트 제거
							display: false
						},
					},
					y: {
						ticks: {
							display: false
						},
						grid: { //x축을 기준으로 그려지는(세로선)에 대한 설정
							display: false,
						},
						beginAtZero: true,   // minimum value will be 0.
						// the data minimum used for determining the ticks is Math.min(dataMin, suggestedMin)
						suggestedMin: 30,
						// the data maximum used for determining the ticks is Math.max(dataMax, suggestedMax)
						suggestedMax: 300,
					},
				}
			},
		}
	);
}

function removeChart(routeNo) {
	if (myCharts[routeNo] instanceof Chart) {
		myCharts[routeNo].destroy();
	}
}
//-----------------> Chart.js 차트 생성 End <---------------------------------

//------------------------> 다중경로 생성 관련 Start <------------------------
var linepath0 = [];
var linepath1 = [];
var linepath2 = [];

//객체 선언
var polyline0 = new kakao.maps.Polyline({
	path: linepath0,
	strokeWeight: 6 // 선의 두께 입니다
});
var polyline1 = new kakao.maps.Polyline({
	path: linepath1,
	strokeWeight: 13 // 선의 두께 입니다
});
var polyline2 = new kakao.maps.Polyline({
	path: linepath2,
	strokeWeight: 13 // 선의 두께 입니다
});


function setCourseLine(points, preference, routeNo) {
	//console.log("setCourseLine : 조건문 들어가기 전 " + preference + "routeNo" + routeNo);
	//console.log("현재 속성은 : " + preference);
	if (routeNo == 0) {
		$.each(points, function(index, v) {
			var p = new kakao.maps.LatLng(v[0], v[1]);
			linepath0.push(p);
		});
		polyline0.setOptions({
			strokeColor: '#00ce7d',
			strokeOpacity: 0.8,
			strokeStyle: 'solid'
		});
		polyline0.setZIndex(3);
		polyline0.setPath(linepath0);
		polyline0.setMap(map);
		chartLabelChoiced = chartLabel0;

	 	chartDataChoiced = chartData0;
	 	pointsChoiced = allPoints[routeNo];
	} else if (routeNo == 1) {
		$.each(points, function(index, v) {
			var p = new kakao.maps.LatLng(v[0], v[1]);
			linepath1.push(p);
		});
		polyline1.setOptions({
			strokeColor: '#3396ff',
			strokeOpacity: 0.8,
			strokeStyle: 'solid'
		});
		polyline1.setZIndex(1);
		polyline1.setPath(linepath1);
		polyline1.setMap(map);
		chartLabelChoiced = chartLabel1;
	 	chartDataChoiced = chartData1;
	 	pointsChoiced = allPoints[routeNo];
	} else if (routeNo == 2) {
		$.each(points, function(index, v) {
			var p = new kakao.maps.LatLng(v[0], v[1]);
			linepath2.push(p);
		});
		polyline2.setOptions({
			strokeColor: '#ee63ae',
			strokeOpacity: 0.8,
			strokeStyle: 'solid'
		});
		polyline2.setZIndex(1);
		polyline2.setPath(linepath2);
		polyline2.setMap(map);
		chartLabelChoiced = chartLabel2;
	 	chartDataChoiced = chartData2;
	 	pointsChoiced = allPoints[routeNo];
	}
}

//------------------------> 다중경로 생성 관련 end <------------------------

//-------------------------> 다중 경로 삭제start <-------------------------

function clearAllPolylines() {
	nowPreference = "";
	linepath0 = [];
	linepath1 = [];
	linepath2 = [];
	polyline0.setPath(linepath0);
	polyline0.setMap(map);
	polyline1.setPath(linepath1);
	polyline1.setMap(map);
	polyline2.setPath(linepath2);
	polyline2.setMap(map);
}
//--------------------------> 다중 경로삭제 end <--------------------------
//--------------------------> 코스 선택 start <--------------------------
function selectRoute(routeNo) {
	if (routeNo == 0) {
		//console.log('selectRecommend');
		polyline0.setOptions({
			strokeOpacity: 0.8,
			strokeColor: '#00ce7d'
		});
		polyline1.setOptions({
			strokeOpacity: 0.8,
			strokeColor: '#9d9d9d'
		});
		polyline2.setOptions({
			strokeOpacity: 0.8,
			strokeColor: '#9d9d9d'
		});
		polyline0.setZIndex(3);
		polyline1.setZIndex(1);
		polyline2.setZIndex(1);
		polyline0.setMap(map);
		polyline1.setMap(map);
		polyline2.setMap(map);
		linePathChoiced = linepath0;
	} else if (routeNo == 1) {
		//console.log('selectFastest');
		polyline0.setOptions({
			strokeOpacity: 0.8,
			strokeColor: '#9d9d9d'
		});
		polyline1.setOptions({
			strokeOpacity: 0.8,
			strokeColor: '#3396ff'
		});
		polyline2.setOptions({
			strokeOpacity: 0.8,
			strokeColor: '#9d9d9d'
		});
		polyline0.setZIndex(1);
		polyline1.setZIndex(3);
		polyline2.setZIndex(1);

		polyline0.setMap(map);
		polyline1.setMap(map);
		polyline2.setMap(map);
		linePathChoiced = linepath1;
	} else if (routeNo == 2) {
		//console.log('selectShortest');
		polyline0.setOptions({
			strokeOpacity: 0.8,
			strokeColor: '#9d9d9d'
		});
		polyline1.setOptions({
			strokeOpacity: 0.8,
			strokeColor: '#9d9d9d'
		});
		polyline2.setOptions({
			strokeOpacity: 0.8,
			strokeColor: '#ee63ae'
		});
		polyline0.setZIndex(1);
		polyline1.setZIndex(1);
		polyline2.setZIndex(3);

		polyline0.setMap(map);
		polyline1.setMap(map);
		polyline2.setMap(map);
		linePathChoiced = linepath2;
	}
}
//--------------------------> 코스 선택 end <----------------------------

//=======================================> 마커 생성/삭제 관련 start <============================================
// 마커 이미지 미리 생성
var markerSize = new kakao.maps.Size(46, 46); // 출발 마커이미지의 크기입니다
var markerOption = { offset: new kakao.maps.Point(21, 50) }; // 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다) 

// 루트 마커 이미지를 생성합니다
var startImage = new kakao.maps.MarkerImage('/images/course/startPin.png', markerSize, markerOption);
var endImage = new kakao.maps.MarkerImage('/images/course/endPin.png', markerSize, markerOption);
var waypointImage = new kakao.maps.MarkerImage('/images/course/waypointPin.png', markerSize, markerOption);

//경로의 각 지점별 마커 생성
var startMarker;
var endMarker;
var allPointMarkers = [];// 모든 마커를 저장할 배열
var waypointPositions = [];

function addWaypointMarker() {
	removeAllMarkers();
	removeMarker();
	// 출발지 마커 만들기 [x,y]
	if ($("#startCoordinate").val()) {
		if (startMarker) {
			startMarker.setMap(null);
		}
		var startXY = $("#startCoordinate").val().replace('[', "").replace(']', "").split(",");
		startMarker = new kakao.maps.Marker({
			position: new kakao.maps.LatLng(startXY[1], startXY[0]),
			image: startImage
		});
		startMarker.setMap(map);
	}

	// 도착지 마커 만들기
	if ($("#endCoordinate").val()) {
		//console.log("도착지 맹글러 왔음")
		if (endMarker) {
			endMarker.setMap(null);
		}
		var endXY = $("#endCoordinate").val().replace('[', "").replace(']', "").split(",");
		endMarker = new kakao.maps.Marker({
			position: new kakao.maps.LatLng(endXY[1], endXY[0]),
			image: endImage
		});
		endMarker.setMap(map);
	}

	// 경유지들 위지 객체 배열 저장
	for (var i = 0; i < $(".waypoints").children().length; i++) {
		if ($("input[name=pointCoordinate]").eq(i).val()) {
			//console.log("경유지 맹글러 왔음")
			var waypointXY = $("input[name=pointCoordinate]").eq(i).val().replace('[', "").replace(']', "").split(",");
			var p = new kakao.maps.LatLng(waypointXY[1], waypointXY[0]);
			waypointPositions[i] = p;
			waypointPositions[i + 1] = null;
		}
	}

	//경유지들 마커 생성
	if (waypointPositions.length == 2) {
		for (var i = 0; i < waypointPositions.length - 1; i++) {
			if (allPointMarkers[i]) {
				allPointMarkers[i].setMap(null);
			}
			var waypointMarker = new kakao.maps.Marker({
				position: waypointPositions[i],
				image: waypointImage
			});
			waypointMarker.setMap(map);
			allPointMarkers[i] = waypointMarker;
		}
	} else {
		for (var i = 0; i < waypointPositions.length; i++) {
			if (allPointMarkers[i]) {
				allPointMarkers[i].setMap(null);
			}
			var waypointMarker = new kakao.maps.Marker({
				position: waypointPositions[i],
				image: waypointImage
			});
			waypointMarker.setMap(map);
			allPointMarkers[i] = waypointMarker;
		}
	}
}
//마커 삭제
function removeAllMarkers() {//출발지, 도착지, 경유지의 모든 마커를 삭제함.
	if (startMarker) {
		startMarker.setMap(null);
		startMarker = null;
	}
	if (endMarker) {
		endMarker.setMap(null);
		endMarker = null;
	}
	for (var i = 0; i < allPointMarkers.length; i++) {
		allPointMarkers[i].setMap(null);
		allPointMarkers[i] = null;
		waypointPositions[i] = null;
	}
}
//========================================> 마커 생성/삭제 관련 end <=============================================
//===================================> 코스 정보 표시 및 라이딩 개설 관련 Start <=====================================

var waypointNames=[];
var linePathChoiced=[];
var chartLabelChoiced;
var chartDataChoiced;

function setWaypointNames(){
	for (var i = 0; i < $(".waypoints").children().length; i++) {
		if ($("input[name=pointCoordinate]").eq(i).val()) {
			waypointNames[i]=$("input[id=pointName]").eq(i).val()
		}
	}
}

function recommendDataSend(routeNo){
	var position = map.getCenter();
	var level = map.getLevel();
	var markerPoditions=[];
	markerPoditions.push($("#startCoordinate").val());
	markerPoditions.push($("#endCoordinate").val());
	for (var i = 0; i < $(".waypoints").children().length; i++) {
		if ($("input[name=pointCoordinate]").eq(i).val()) {
			markerPoditions.push($("input[name=pointCoordinate]").eq(i).val());
		}
	}
	setCourseLine();
	setWaypointNames();
	console.log("경유지 확인"+waypointNames);
	setTimeout(function() {
		var sendDataSum={};		
		sendDataSum.startPointName=document.getElementById("startPoint").value;
		sendDataSum.endPointName =  document.getElementById("endPoint").value;
		sendDataSum.wayPointNames = waypointNames;
		sendDataSum.courseDistance = document.getElementById("routeDistance" + routeNo).innerText;
		sendDataSum.courseDuration= document.getElementById("routeDuration" + routeNo).innerText;
		sendDataSum.courseAscent= document.getElementById("routeAscent" + routeNo).innerText;
		sendDataSum.courseDescent= document.getElementById("routeDescent" + routeNo).innerText;
		sendDataSum.pointsChoiced= pointsChoiced;
		sendDataSum.position = position;
		sendDataSum.level = level;
		sendDataSum.markerPoditions = markerPoditions;
		
		
		var sendDatajson = JSON.stringify(sendDataSum);
		$("textarea[name=recommendSendData]").val(sendDatajson);
		$("#recommendSendDataFrm").submit();
		
		console.log(sendDatajson);

	}, 300);
}

//====================================> 코스 정보 표시 및 라이딩 개설 관련 End <======================================