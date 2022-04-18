
//--> 처음 실행시 주변 자전거샵 위치 표시해주기

setTimeout(function(){
	gps_tracking();
	setTimeout(function(){searchPlacesNearBy();},200);
	},200);
	
function searchPlacesNearBy() {
	// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	ps.keywordSearch(" 자전거 판매", placesSearchCB,{
		size:10,//리스트에 표시될 장소 갯수
		location:new kakao.maps.LatLng(gps_lat,gps_lng),//현재 
		radius:3000
	});
	map.setLevel(5);
}
// 처음 실행시 주변 자전거샵 위치 표시해주기 <--


//-->  현재 위치 반환 관련 함수 모음
var gps_use = null; //gps의 사용가능 여부
var gps_lat = null; // 위도
var gps_lng = null; // 경도
var gps_position; // gps 위치 객체

gps_check();
// gps가 이용가능한지 체크하는 함수이며, 이용가능하다면 show location 함수를 불러온다.
// 만약 작동되지 않는다면 경고창을 띄우고, 에러가 있다면 errorHandler 함수를 불러온다.
// timeout을 통해 시간제한을 둔다.
function gps_check(){
    if (navigator.geolocation) {
        var options = {timeout:60000};
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
    if(error.code == 1) {
        alert("접근차단");
    } else if( err.code == 2) {
        alert("위치를 반환할 수 없습니다.");
    }
    gps_use = false;
}

function gps_tracking(){
    if (gps_use) {
        map.panTo(new kakao.maps.LatLng(gps_lat,gps_lng));
        var gps_content = '<div><img class="pulse" draggable="false" unselectable="on" src="https://ssl.pstatic.net/static/maps/m/pin_rd.png" alt=""></div>';
        var currentOverlay = new kakao.maps.CustomOverlay({
            position: new kakao.maps.LatLng(gps_lat,gps_lng),
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
		level: 3// 지도의 확대 레벨
};

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption);

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
	zIndex: 1
});

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {
	var keyword = document.getElementById('keyword').value;
	if (!keyword.replace(/^\s+|\s+$/g, '')) {
		alert('키워드를 입력해주세요!');
		return false;
	}
	// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	ps.keywordSearch(keyword+" 자전거 판매", placesSearchCB,{//자전거 판매점이 자동으로 검색되도록 키워드 설정
		size:10 //한 페이징 리스트에 표시될 장소 갯수
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

	var listEl = document.getElementById('placesList'), menuEl = document
		.getElementById('menu_wrap'), fragment = document
			.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

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
        // 해당 장소 커스텀 오버레이에 장소명을 표시합니다
		(function(marker, places) {
			// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
			kakao.maps.event.addListener(marker, 'click', function() {
				displayOverlay(marker,places);
				map.setCenter(marker.getPosition());//클릭한 장소의 마커가 지도의 중심에 오도록 이동
			});
			itemEl.onclick = function() {
				displayOverlay(marker,places);
				map.setCenter(marker.getPosition());//클릭한 장소의 마커가 지도의 중심에 오도록 이동
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

	var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
		+ (index + 1)
		+ '"></span>'
		+ '<div class="info">'
		+ '   <h5>' + places.place_name + '</h5>';

	if (places.road_address_name) {
		itemStr += '    <span>' + places.road_address_name + '</span>';//도로명 주소가 있는 경우 지번 주소는 띄우지 않게함.
	} else {
		itemStr += '    <span>' + places.address_name + '</span>';
	}

	itemStr += '  <span class="tel">' + places.phone + '</span>';
	itemStr += '<a href ="https://map.kakao.com/link/to/'+places.id+'"target="_blank"><button> 길찾기 </button></a>'
		+ '</div>';

	el.innerHTML = itemStr;
	el.className = 'item';

	return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx) {
	var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
		imgOptions = {
			spriteSize: new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
			spriteOrigin: new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
			offset: new kakao.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
		}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
			imgOptions), marker = new kakao.maps.Marker({
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

// 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {
	while (el.hasChildNodes()) {
		el.removeChild(el.lastChild);
	}
}

var overlay;
function displayOverlay(marker,places) {
	//기존에 열려있는 커스텀 오버레이 제거
	if(overlay){
		closeOverlay();
	} 
	
	var url = "/shopInfoLoad";
	var params = "shopId="+places.id;
	
	$.ajax({
		url:url,
		data:params,
		success:function(result){
			var shopInfo = result.shopInfo;
			var shopAuthors= result.shopAuthors;
			if(shopAuthors!=null){
				$(".shopInfo").html("<span style='color:#000; font-weight:bold;'>정비샵 정보</span><br/>"+"<textarea>"+shopInfo+"</textarea>");
				$(".shopAuthors").html("작성자 : "+shopAuthors);	
			}
		}, error:function(e){
			console.log(e.responseText);
		}
	});
	
	// 커스텀 오버레이에 표시할 컨텐츠 입니다
	// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
	// 별도의 이벤트 메소드를 제공하지 않습니다 
	var content = '<div class="wrap">' +
		'    <div class="infoOverlay">' +
		'        <div class="title">' + places.place_name +
		'            <div class="close" onclick="closeOverlay()" title="닫기"></div>' +
		'        </div>' +
		'        <div class="body">' +
		'            <div class="desc">' +
		'                <div class="ellipsis"><span style="color:#000; font-weight:bold;">주소:</span> '+places.road_address_name+'</div>' +
		'                <div class="jibun ellipsis">'+places.address_name+'</div>' +
		'                <div class="tel"><span style="color:#000; font-weight:bold;">전화번호: </span> ' + places.phone + '</div>'+		
		'                <div class="shopInfo"><span style="color:#000; font-weight:bold;">정비샵 정보</span> <br/><textarea>등록된 정비샵 정보가 없어요</textarea></div>'+
		'                <div class="shopAuthors">정보를 등록해주세요!</div>'+
		'                <div><a href="/shopCheck?shopId='+places.id+
													  '&shopName='+places.place_name+
													  '&shopRoadAddress='+places.road_address_name+
													  '&shopPhone='+places.phone+
						'" class="link">공임비 정보 업데이트</a></div>' +
		'            </div>' +
		'        </div>' +
		'    </div>' +
		'</div>';
	// 마커 위에 커스텀오버레이를 표시합니다
	// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
	overlay = new kakao.maps.CustomOverlay({
		content: content,
		map: map,
		position: marker.getPosition(),
		zIndex: 0,
		
	});
	overlay.setMap(map);
}

// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
function closeOverlay() {
	overlay.setMap(null);
}