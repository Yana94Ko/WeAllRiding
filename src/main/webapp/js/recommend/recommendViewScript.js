
console.log($('textarea[id^=recommendSendData]').length+"개의 지도 생성 예정")
for(var z = 0; z < $('textarea[id^=recommendSendData]').length;z++){
	console.log(z+"번째 시작")
	//===================================> 지도/차트/코스정보 생성 Start <====================================================
	//-------------------> courseCreate에서 전달받은 데이터 저장 Start <--------------------------
	var recommendSendDataRecived = document.getElementById("recommendSendData" + z);
	if(recommendSendDataRecived.value){
		var recommendSendData = JSON.parse(recommendSendDataRecived.value);
		var startPointName = recommendSendData.startPointName;
		var endPointName = recommendSendData.endPointName;
		var waypointNames = recommendSendData.wayPointNames;
		var distance = recommendSendData.courseDistance;
		var duration = recommendSendData.courseDuration;
		var ascent = recommendSendData.courseAscent;
		var descent = recommendSendData.courseDescent;
		var points = recommendSendData.pointsChoiced;
		var firstPosition = new kakao.maps.LatLng(recommendSendData.position.Ma, recommendSendData.position.La);
		var level = recommendSendData.level;
		var markerPoditions = [];

		var mapContainer = document.getElementById('map' + z), // 지도를 표시할 div 
			mapOption = {
				center: firstPosition, // 지도의 중심좌표
				level: level, // 지도의 확대 레벨
				mapTypeId: kakao.maps.MapTypeId.ROADMAP, // 지도종류
				draggable: false,//마우스 드래그, 휠, 모바일 터치를 이용한 시점 변경(이동, 확대, 축소) 가능 여부
				scrollwheel: false,//마우스 휠, 모바일 터치를 이용한 확대 및 축소 가능 여부
				disableDoubleClick: false,//더블클릭 이벤트 및 더블클릭 확대 가능 여부
				keyboardShortcuts: false
			};
		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		// 마커 이미지 미리 생성
		var markerSize = new kakao.maps.Size(46, 46); // 출발 마커이미지의 크기입니다
		var markerOption = { offset: new kakao.maps.Point(21, 50) }; // 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다) 

		// 루트 마커 이미지를 생성합니다
		var startImage = new kakao.maps.MarkerImage('/images/course/startPin.png', markerSize, markerOption);
		var endImage = new kakao.maps.MarkerImage('/images/course/endPin.png', markerSize, markerOption);
		var waypointImage = new kakao.maps.MarkerImage('/images/course/waypointPin.png', markerSize, markerOption);
		// 마커 생성
		console.log(z+"번째 11111111111111111111111111111111111111")
		var boundsRoute = new kakao.maps.LatLngBounds();
		for (var i = 0; i < recommendSendData.markerPoditions.length; i++) {
			markerPoditions.push(recommendSendData.markerPoditions[i].replace("'", ""));
			var markerX = markerPoditions[i].replace("[", "").replace("]", "").split(',')[0]
			var markerY = markerPoditions[i].replace("[", "").replace("]", "").split(',')[1]
			if (i == 0) {
				var startMarker = new kakao.maps.Marker({
					position: new kakao.maps.LatLng(markerY, markerX),
					image: startImage
				});
				startMarker.setMap(map);
			} else if (i == 1) {
				var endMarker = new kakao.maps.Marker({
					position: new kakao.maps.LatLng(markerY, markerX),
					image: endImage
				});
				endMarker.setMap(map);
			} else {
				var wayPointMarker = new kakao.maps.Marker({
					position: new kakao.maps.LatLng(markerY, markerX),
					image: waypointImage
				});
				wayPointMarker.setMap(map);
			}
			
			boundsRoute.extend(new kakao.maps.LatLng(markerY, markerX));
			map.setBounds(boundsRoute);
		}
		console.log(z+"번째 22222222222222222222222222222222222222")
		// 마커 위에 표시할 인포윈도우를 생성한다
		var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });
		function displayInfowindow(marker, placeNname) {
			var content = '<div style="padding:5px;z-index:1;">' + placeNname + '</div>';

			infowindow.setContent(content);
			infowindow.open(map, marker);
		}
		//경로 생성
		var linepath = [];
		function setCourseLine(points) {
			$.each(points, function(index, v) {
				var p = new kakao.maps.LatLng(v[0], v[1]);
				linepath[index] = p;
			});
			var polyline = new kakao.maps.Polyline({
				path: linepath, // 선을 구성하는 좌표배열 입니다
				strokeColor: '#ee63ae',
				strokeOpacity: 0.8,
				strokeStyle: 'solid',
				strokeWeight: 6
			});
			polyline.setMap(map);
		}
		setCourseLine(points);
		//데이터 입력
		$("#startPoint" + z).text(startPointName);
		//경유지 정보 가공
		$("#endPoint" + z).text(endPointName);
		$("#distance" + z).text(distance);
		$("#duration" + z).text(duration);
		$("#descent" + z).text(descent);
		$("#ascent" + z).text(ascent);
		console.log(z+"번째 완료")
	}
}