//코스 정보 존재시, 코스 생성 버튼 숨기고 코스정보 보여주기

//===================================> 지도/차트/코스정보 생성 Start <====================================================
//-------------------> courseCreate에서 전달받은 데이터 저장 Start <--------------------------
var courseSendDataRecived = document.getElementById("courseSendData");
console.log(!courseSendDataRecived.value);
if(!courseSendDataRecived.value){
	$(".hiddenIfNone").css("display","none");
	$(".hiddenIfNone2").css("display","none");
}else{
	console.log("들어왔냐")
	document.getElementById("courseMakeLst").style.display="none";
	var courseSendData = JSON.parse(courseSendDataRecived.value);
	
	var startPointName = courseSendData.startPointName;
	var endPointName = courseSendData.endPointName;
	var waypointNames = courseSendData.wayPointNames;
	var distance = courseSendData.courseDistance;
	var duration =  courseSendData.courseDuration;
	var ascent = courseSendData.courseAscent;
	var descent =  courseSendData.courseDescent;
	var points=courseSendData.pointsChoiced;
	var position = new kakao.maps.LatLng(courseSendData.position.Ma,courseSendData.position.La);
	var level = courseSendData.level;
	var markerPoditions=[];
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center: position, // 지도의 중심좌표
			level: level, // 지도의 확대 레벨
			mapTypeId: kakao.maps.MapTypeId.ROADMAP // 지도종류
		};
	// 지도를 생성한다 
	var map = new kakao.maps.Map(mapContainer, mapOption);
	// 지도 타입 변경 컨트롤을 생성한다
	var mapTypeControl = new kakao.maps.MapTypeControl();
	// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	// 지도에 확대 축소 컨트롤을 생성한다
	var zoomControl = new kakao.maps.ZoomControl();
	// 지도의 우측에 확대 축소 컨트롤을 추가한다
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	var markerSize = new kakao.maps.Size(46, 46); // 출발 마커이미지의 크기입니다
	var markerOption = { offset: new kakao.maps.Point(21, 50) }; // 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다) 
	
	// 루트 마커 이미지를 생성합니다
	var startImage = new kakao.maps.MarkerImage('/images/course/startPin.png', markerSize, markerOption);
	var endImage = new kakao.maps.MarkerImage('/images/course/endPin.png', markerSize, markerOption);
	var waypointImage = new kakao.maps.MarkerImage('/images/course/waypointPin.png', markerSize, markerOption);
	// 마커 생성
	var boundsRoute = new kakao.maps.LatLngBounds();
	for (var i = 0; i < courseSendData.markerPoditions.length; i++) {
		markerPoditions.push(courseSendData.markerPoditions[i].replace("'", ""));
		var markerX = markerPoditions[i].replace("[", "").replace("]", "").split(',')[0]
		var markerY = markerPoditions[i].replace("[", "").replace("]", "").split(',')[1]
		if(i==0){
			var startMarker = new kakao.maps.Marker({
				position: new kakao.maps.LatLng(markerY, markerX),
				image: startImage
			});
			startMarker.setMap(map);
		}else if(i==1){
			var endMarker = new kakao.maps.Marker({
				position: new kakao.maps.LatLng(markerY, markerX),
				image: endImage
			});
			endMarker.setMap(map);
		}else{
			var wayPointMarker = new kakao.maps.Marker({
				position: new kakao.maps.LatLng(markerY, markerX),
				image: waypointImage
			});
			wayPointMarker.setMap(map);
		}
		boundsRoute.extend(new kakao.maps.LatLng(markerY,markerX));
		map.setBounds(boundsRoute);
	} 
	// 마커 위에 표시할 인포윈도우를 생성한다
	var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });
	function displayInfowindow(marker, placeNname) {
		var content = '<div style="padding:5px;z-index:1;">' + placeNname + '</div>';
	
		infowindow.setContent(content);
		infowindow.open(map, marker);
	}
	//경로 생성
	var linepath=[];
	function setCourseLine(points){
		$.each(points, function(index, v) {
			var p = new kakao.maps.LatLng(v[0], v[1]);
			linepath[index]=p;
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
	$("#startPoint").text(startPointName);
	//경유지 정보 가공
	var waypointNamesSum="";
	for(var i = 0; i<waypointNames.length; i++){
		waypointNamesSum+=waypointNames[i]+" - ";
	}
	$("#waypoint").text(waypointNamesSum);
	$("#endPoint").text(endPointName);
	$("#distance").text(distance);
	$("#duration").text(duration);
	$("#descent").text(descent);
	$("#ascent").text(ascent);
	//차트 생성
	var myCharts;
	var chartLabel = [];
	var chartData = [];
	function plot(points) {
		//고도값 정제
		for (var i = 0; i < points.length; i++) {
			chartLabel.push("'" + points[i][0] + "," + points[i][1] + "'");
			chartData.push(points[i][2]);
		}
		charBorderColor = "rgba(238, 99, 174, 1)";
		charBackgroundColor = "rgba(238, 99, 174, 0.5)";
		chartLabel2 = chartLabel;
		chartData2 = chartData;
	
		var labels = chartLabel;
		myCharts = new Chart(
			document.getElementById('myChart'),
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
								display: true
							},
							grid: { //x축을 기준으로 그려지는(세로선)에 대한 설정
								display: true,
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
	plot(points);
}
//-------------------> courseCreate에서 전달받은 데이터 저장 End <--------------------------
$('#ridingKeyword').on("keyup", function(event) {
	let keyword = document.getElementById("ridingKeyword").value;
	if (window.event.keyCode == 32) {
		$('input[id=ridingKeyword]').val(keyword.substr(0, keyword.length - 1)+"#");
	}
	if(window.event.keyCode == 8){
		if(keyword==""){
			keyword.value="#"
		}
	}
});
$('#ridingKeyword').on("keyup", function(event) {
	let keyword = document.getElementById("ridingKeyword").value;
	if (keyword.substring(0,0)!="#" && keyword.length==0) {
		$('input[id=ridingKeyword]').val("#");
	}
});
$('#ridingKeyword').on("focus", function(event) {
	if($('input[id=ridingKeyword]').val()!="#"){
		$('input[id=ridingKeyword]').val($('input[id=ridingKeyword]').val( )+"#");
	}
});
$('#ridingKeyword').on("focusout", function(event) {
	let keyword = document.getElementById("ridingKeyword").value;
	if($('input[id=ridingKeyword]').val()=="#"){
		$('input[id=ridingKeyword]').val("");
	}
	if(keyword.substring(keyword.length-1)=='#'){
		$('#ridingKeyword').val(keyword.substring(0,keyword.length-1));
	}
})
function submitRidingFrm(){
	document.getElementById('ridingFrm').submit()
}
$(function() {
	$("#ridingFrm").submit(function() {
		if ($("#ridingSubject").val() == '') {
			alert("글 제목을 입력하세요");
			return false;
		}
		if ($("#ridingContent").val() == '') {
			alert("글내용을 입력하세요");
			return false;
		}
		if ($("#courseSendData").val() == '') {
			alert("코스를 입력하세요");
			return false;
		}
	});
});