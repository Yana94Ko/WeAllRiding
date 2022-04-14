//--> 처음 실행시 주변 자전거샵 위치 표시해주기
var datas = null;
setTimeout(function(){
	gps_tracking();
	setTimeout(function(){searchPlacesNearBy();},200);
	},200);
	
function searchPlacesNearBy() {
	map.setLevel(5);
	map.setCenter(new kakao.maps.LatLng(gps_lat,gps_lng));
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
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

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
    ps.keywordSearch( keyword, placesSearchCB,{
		size : 10 //한 페이징 리스트에 표시될 장소 갯수	
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
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목 click 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        (function(marker,places) {
            kakao.maps.event.addListener(marker, 'click', function(event) {
				datas = places;
                infowindow.close();
                displayInfowindow(marker, places.place_name);
				map.setCenter(marker.getPosition());//클릭한 장소의 마커가 지도의 중심에 오도록 이동
				savePlaceInfo(datas);
        		searchCourse();
            });
            itemEl.onclick =  function (event) {
				datas = places;
                infowindow.close();
                displayInfowindow(marker, places.place_name);
				map.setCenter(marker.getPosition());//클릭한 장소의 마커가 지도의 중심에 오도록 이동
				savePlaceInfo(datas);
        		searchCourse();
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
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +'</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';
    
    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
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
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
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
        el.removeChild (el.lastChild);
    }
}

//--> 경유지 추가
var btnAddWaypoint = document.querySelector(".btnAddWaypoint");
var changeFromTo = document.querySelector(".changeFromTo");
var waypoints = document.querySelector(".waypoints");
var hihi = document.querySelector(".hihi");

function addWaypoint(){
	if($(".waypoints").children().length<10){//경유지 추가 가능 갯수 : 10개
		console.log($(".waypoints").children().length);
		//추가될 태그들을 감쌀 부모(div) 엘리먼트 - 생성
		var waypointWrap = document.createElement('div');
		//추가될 태그들을 감쌀 부모(div) 엘리먼트 - 설정
		waypointWrap.className="waypointWrap";
		//추가될 태그 엘리먼트들 - 생성
		var img1 = document.createElement('img');
		var input1 = document.createElement('input');
		var input2 = document.createElement('input');
		var input3 = document.createElement('input');
		var img2 = document.createElement('img');
		//추가될 태그 엘리먼트들 - 설정
		img1.src = '/images/waypointIcon.png';
		input1.setAttribute('type','text');
		input1.setAttribute('id','pointName');
		input1.setAttribute('style','z-index:900');
		input2.setAttribute('type','text');
		input2.setAttribute('id','pointCoordinate');
		input2.setAttribute('name','pointCoordinate');
		input3.setAttribute('type','text');
		input3.setAttribute('id','pointAddr');
		img2.className="minusBtn";
		img2.setAttribute('style','margin-left:194px;');
		img2.src = '/images/minusIcon.png';
		
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
		$('input[id=pointName]').on("keyup focusout",function(event) {
			keyword.value = this.value;
			if (window.event.keyCode == 13) {
        		$('#targetId').val(event.target.id);
        		eventthis = this;
    			// 엔터키가 눌렸을 때 실행할 내용
        		searchPlaces();
    		}
		});
		//--> 경유지 개별 삭제
		$('.minusBtn').on("click",function(event) {
			$(this).parent().remove();
			if($(".waypoints").children().length==0){
			changeFromTo.style.display = 'inline';
			}
		});
		// 경유지 개별 삭제 <--
	}else{
		alert("경유지는 최대 10개까지 밖에 만들 수 없어요..!")
	}
}

//-> 출발지 도착지 경유지 전체 삭제
function deleteAllWaypoint(){
	//경유지 삭제
	$(".waypoints").empty();
	document.getElementById("startPoint").value="";
	document.getElementById("endPoint").value="";
	changeFromTo.style.display = 'inline';
}

//-> 출발지/도착지/경유지 입력 이벤트가 발생한 input의 id 를 저장
var placeInfoInsert = document.querySelector(".fromWrap");
var keyword = document.getElementById("keyword");
var targetId = document.getElementById("targetId");
var eventthis;
$('#startPoint, #endPoint, #PointName').keyup(function(event) {
	eventthis = this;
	keyword.value = this.value;
	if (window.event.keyCode == 13) {
    	// 엔터키가 눌렸을 때 실행할 내용
        searchPlaces();
    }
});

//클릭한 장소의 정보 받아와 저장하기
function savePlaceInfo(datas){
	var savedTargetId = $('#targetId').val();
	eventthis.value= datas.place_name;
	eventthis.nextElementSibling.value= "["+datas.x+","+datas.y+"]";
	eventthis.nextElementSibling.nextElementSibling.value= datas.address_name;
	console.log(eventthis.nextElementSibling.value);	
	console.log(eventthis.nextElementSibling.nextElementSibling.value);
	//리스트가 클릭되면, 목록창(menu_wrap) 가리기
	menu_wrap.style.display = 'none';
}

//출발지 도착지 교환 버튼 클릭시 값 뒤바꿔주기
$('.changeFromTo').on("click",function() {
	var temp = document.getElementById("startPoint").value;
	document.getElementById("startPoint").value=document.getElementById("endPoint").value;
	document.getElementById("endPoint").value=temp;
});

// 자전거 도로 표시 온오프 처리
function setOverlayMapTypeId(){
    var chkBicycle = document.getElementById("chkBicycle");
    var mapType = kakao.maps.MapTypeId.BICYCLE;
    
    if(chkBicycle.checked){
        map.addOverlayMapTypeId(mapType);
    }else{
        map.removeOverlayMapTypeId(mapType);
    }
};

// ------------------------------------------------------------------
// 경로 등록을 위한 OpenRouteService inmport

var coordinates = "";  // 검색할 위치 정보
var preference = "recommended";   // 검색할 경로 타입  : 빠른 경로 - fastest 최단경로 - shortest 추천 경로 - recommended
var radiuses = "-1";     // 각 웨이포인트마다 주변 도로를 검색할 범위 제한(m) / -1 : 최대 검색 반경 사용 / 값을 1개만 입력시 모든 웨이포인트에 적용
var courseData=""; //경로 검색 후 돌려받은 String 데이터를 저장할 변수
var points="";
var geocode="";

function searchCourse(){
	if(!document.getElementById("endPoint").value){
		return false;
	}
	//출발지 좌표 추가
	coordinates  = "["+ document.getElementById("startCoordinate").value;
		//	경유지 좌표 추가
		for(var i = 0; i < $(".waypoints").children().length; i++ ){
			coordinates  += ","+ $("input[name=pointCoordinate]").eq(i).val();
		}
		//도착지 좌표 추가
		coordinates  += ","+ document.getElementById("endCoordinate").value +"]";
	
	
	console.log(coordinates);
	
	//--- > 경로 타입 : OpenRouteService 중에서 경유지를 가지는 경로탐색 
	let request = new XMLHttpRequest();

	//1) cycling-regular 기준으로 경로 탐색
	request.open('POST', "https://api.openrouteservice.org/v2/directions/cycling-regular/json");
	
	request.setRequestHeader('Accept', 'application/json, application/geo+json, application/gpx+xml, img/png; charset=utf-8');
	request.setRequestHeader('Content-Type', 'application/json');
	//내 Authorization key니까... 소중히 쓰도록.... -yana
	request.setRequestHeader('Authorization', '5b3ce3597851110001cf62481bb5a71b56e44657aadab2fd7357a24e');

	request.onreadystatechange = function() {
		if (this.readyState === 4) {
			//console.log('Status:', this.status);
			//console.log('Headers:', this.getAllResponseHeaders());
			//console.log('Body:', this.responseText);
			
			courseData = this.responseText;//courseData에 되돌려 받은 String값 저장
			
			var courseDataParse = JSON.parse(courseData);//입력받은 String값을 json Data로 파싱
			var course = courseDataParse.routes;
			
			console.log("총거리"+course[0].summary.distance.toFixed(2));
		    console.log("상승고도"+course[0].summary.ascent);
		    console.log("하강고도"+course[0].summary.descent);
		    console.log("소요시간"+(course[0].summary.duration)/60);
			points = decodeGeometry(course[0].geometry,true);
			setCourseLine(points);
			
			geocode = course[0].geometry;
			
			/*$("#distance").text(route[0].summary.distance.toFixed(2));
		    $("#ascent").text(route[0].summary.ascent);
		    $("#descent").text(route[0].summary.descent);
		    $("#duration").text(route[0].summary.duration);*/
		}
	};
	
	var   body = '{ "coordinates":'+ coordinates+',';
		  body +='"attributes": ["percentage", "detourfactor", "avgspeed"],';//detourfactor : 직선거리 대비 생성된 루트 비율 & avgspeed : 평균 속도
		  body +='"elevation": "true",';//경사도(웨이포인트 사이의 경사도를 반환)
		  body +='"extra_info": ["surface", "waytype", "steepness"],'; //surface - 길의 포장 표면 & waytype - 자전거길 여부 & steepness - 경사도
		  body +='"geometry_simplify": "false",'//옵션들을 사용하기 위해 false
		  body +='"id": "routing_", ';//옵션값 ID
		  body +='"maneuvers": "true", ';//maneuvers - 각 세그멘트 별로 기동 방향(네비게이션)
		  body +='"preference": "'+preference+'",'; //: 빠른 경로 - fastest 최단경로 - shortest 추천 경로 - recommended
		  body +='"radiuses": '+radiuses+',';//각 웨이포인트마다 주변 도로를 검색할 범위 제한(m) / -1 : 최대 검색 반경 사용 / 값을 1개만 입력시 모든 웨이포인트에 적용
		  body +='"units": "km", ';//거리 단위
		  body +='"geometry": "true" }';//경로 지도 표시 여부(poly)
	console.log(body);
	request.send(body);
	//// 경로 타입 : OpenRouteService 중에서 경유지를 가지는 경로탐색 <--
}
function decodeGeometry(encodedPolyline, includeElevation){
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
        console.log(e)
      }
    }
    return points
}

// 경로 라인 생성하기
var polyline = "";
var linePath = [];/*
// Load the Visualization API and the columnchart package.
google.load("visualization", "1", { packages: ["columnchart"] });*/
function setCourseLine(points){
	// 기존에 경로 객체가 있을 경우, 맵 상에서 지우기
    	if(polyline != "") {
    		polyline.setMap(null);
		}
    	
    	linePath = [];
    	// 좌표 정보를 바탕으로 경로 배열 입력하기
    	$.each(points, function(index, v){
    		var p = new kakao.maps.LatLng(v[0], v[1]);
    		linePath.push(p);
    	});
    	
    	// 경로 객체 생성
	    polyline = new kakao.maps.Polyline({
						    path: linePath, // 선을 구성하는 좌표배열 입니다
						    strokeWeight: 6, // 선의 두께 입니다
						    strokeColor: '#FF0162', // 선의 색깔입니다
						    strokeOpacity: 0.6, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
						    strokeStyle: 'solid' // 선의 스타일입니다
		});
		
		// 지도 위에 세팅!
		polyline.setMap(map);
		removeMarker(markers);
		
		// 경로 정보 제공
				
        /*// Create an ElevationService.
        const elevator = new google.maps.ElevationService();
        
        // 고저도 그릴 경로 세팅
        var path =[];
        $.each(points, function(idx, v){
        	var p = new google.maps.LatLng(v[0], v[1]);
        	path.push(p);
        });
        
        // Draw the path, using the Visualization API and the Elevation service.
        elevator.getElevationAlongPath(
          {
            path: path,
            samples: 256,
          },
          plotElevation
        );*/
}