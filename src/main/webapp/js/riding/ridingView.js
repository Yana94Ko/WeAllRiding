//===================================> 지도/차트/코스정보 생성 Start <====================================================
//-------------------> courseCreate에서 전달받은 데이터 저장 Start <--------------------------
var courseSendDataRecived = document.getElementById("courseSendData");
var courseSendData = JSON.parse(courseSendDataRecived.value);

var startPointName = courseSendData.startPointName;
var endPointName = courseSendData.endPointName;
var waypointNames = courseSendData.wayPointNames;
var distance = "총 거리 : " + courseSendData.courseDistance;
var duration = "예상 소요 시간 : " + courseSendData.courseDuration;
var ascent = "상승 고도 : " + courseSendData.courseAscent;
var descent = "/ 하강 고도 : " + courseSendData.courseDescent;
var points = courseSendData.pointsChoiced;
var position = new kakao.maps.LatLng(courseSendData.position.Ma, courseSendData.position.La);
var level = courseSendData.level;
var markerPoditions = [];

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
$("#startPoint").text(startPointName);
//경유지 정보 가공
var waypointNamesSum = "";
for (var i = 0; i < waypointNames.length; i++) {
	waypointNamesSum += waypointNames[i] + " - ";
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
						suggestedMax: 10,
					},
				}
			},
		}
	);
}
plot(points);

var ridingNo = $("#dbRidingNo").val();
function ridingViewDel() {
	if (confirm('글을 삭제시겠습니까?')) {
		location.href = "/riding/ridingDel?ridingNo=" + ridingNo;
	}
}
function ridingViewEdit() {
	if (confirm('글을 수정하시겠습니까?')) {
		location.href = "/riding/ridingEdit?ridingNo=" + ridingNo;
	}
}
function ridingMember() {
	if($("#loginNickName").val()=="/" ) {
		alert("로그인 후 참가신청 해주세요..!")
		location.href = "/member/loginForm";
		return false;
	}
	if (confirm('참가 신청하시겠습니까? \n ※단, 라이딩은 개설자에 의해 취소될 수 있습니다.※')) {
		let url = "/riding/ridingMemberOk";
		let params = "ridingNo=" + ridingNo;
		$.ajax({
			url: url,
			data: params,
			success: function(result) {
				reserved = result;
				alert("라이딩 신청 완료! 안전한 라이딩 되세요!");
				location.href = "/riding/ridingView?ridingNo=" + ridingNo;
			},
			error: function(e) {
				reserved = result;
				alert("라이딩 신청에 실패했어요..");
			}
		});
	}
}
//참가신청 완료시, 신청하기 버튼 숨기기
if(document.getElementById('resolveStatus').value != 0){
	$("#ridingMemberBtn").css("display","none");
	$("#ridingdelBtn").css("display","block");
	
}
if(document.getElementById('resolveStatus').value == 0){
	$("#ridingMemberBtn").css("display","block");
	$("#ridingdelBtn").css("display","none");
}
function ridingMemberCancel() {
	if($("#loginNickName").val()=="/" ) {
		alert("로그인 후 참가신청 해주세요..!")
		location.href = "/member/loginForm";
		return false;
	}
	if (confirm('신청 취소 하시겠습니까?')) {
		let url = "/riding/ridingMemberCan";
		let params = "ridingNo=" + ridingNo;
		$.ajax({
			url: url,
			data: params,
			success: function(result) {
				alert("라이딩 참가를 취소했어요, 다음 기회에 함께해요!");
				location.href = "/riding/ridingView?ridingNo=" + ridingNo;
			},
			error: function(e) {
				alert("라이딩 신청취소를 못 했어요.. \n조금 질척여볼게요...(에러 사유 찾는 중)");
			}
		});
	}
}
//참가신청 수락 거절 여부에 따라 참가상태 바꿔주기
for(var aNum=0; aNum<60;aNum++){
	if($("#dbRidingState"+aNum).val()==0){
		$("#ridingState"+aNum).text("수락 대기중");
	}else if($("#dbRidingState"+aNum).val()==1){
		$("#ridingState"+aNum).text("참가 확정");
	}
}
for(var x=0; x<60;x++){
	if($("#dbForWriterRidingState"+x).val()==0){
		$("#forWriterRidingState"+x).text("수락 대기중");
	}else if($("#dbForWriterRidingState"+x).val()==1){
		$("#forWriterRidingState"+x).text("참가 확정");
	}
}
// 리뷰---
function ridingReviewListAll() { //현재글의 댓글을 모두 가져오기
	var url = "/riding/ridingReviewList";
	var params = "ridingNo=" + ridingNo; // 31번 글이면 no=31이 된다.

	$.ajax({
		url: url,
		data: params,
		success: function(result) {
			var $result = $(result); // vo, vo, vo, ,,,
			var tag = "<ul>";
			$result.each(function(idx, vo) {
				tag += "<li><div id='dddd' style='color:black;'><div id='NN'>" + vo.nickname + "</div>";
				tag += "<br/><div>" + vo.ridingReviewComent + "</div>";
				tag += "<div id='CRWD' style='color:lightgray;'>" + vo.ridingReviewWriteDate
					+ "</div></div>";
				tag += "</li><br/><hr style='backgrond-color:lightgray;'>";
			});
			tag += "</ul>";
			$("#ridingReviewList").html(tag);
		},
		error: function(e) {
			console.log(e.responseText)
		}
	});
}
ridingReviewListAll();
// 댓글----------------
function ridingReplyListAll() { //현재글의 댓글을 모두 가져오기
	var url = "/riding/ridingReplyList";
	var params = "ridingNo=" + ridingNo; // 31번 글이면 no=31이 된다.

	$.ajax({
		url: url,
		data: params,
		success: function(result) {
			var $result = $(result); // vo, vo, vo, ,,,
			var tag = "<ul>";
			$result.each(function(idx, vo) {
				tag += "<li id='replySet'><div id='replyView' style='color:black;'><div id='NN'>" + vo.nickname + "</div>";

				// 	 'goguma'== goguma
				if (vo.nickname == '${nickName}') {
					tag += "<input type='button' value='삭제' title='" + vo.ridingReplyNo + "'/>";
					tag += "<input type='button' value='수정' id='ridingReplyListEdit'/>";
				}
				tag += "<div>" + vo.ridingReplyComent + "</div>";
				tag += "<div id='CRWD' style='color:lightgray;'>" + vo.ridingReplyWriteDate
					+ "</div></div>";

				//본인글일때 수정폼이 있어야 한다.
				if (vo.nickname == '${nickName}') {
					tag += "<div style='display:none' id='abcd'><form method='post'>";
					tag += "<input type='hidden' name='ridingReplyNo' value='" + vo.ridingReplyNo + "'/>";
					tag += "<textarea name='ridingReplyComent' style='width:500px; height:50px;'>"
						+ vo.ridingReplyComent
						+ "</textarea>";
					tag += "<input type='submit' value='수정' id='ridingReplyListEditOk'/>";
					tag += "</form></div>";
				}
				tag += "</li><div id='replyDiv'>";
			});
			tag += "</ul>";
			$("#ridingReplyList").html(tag);
		},
		error: function(e) {
			console.log(e.responseText)
		}
	});
	// 댓글 수정(Edit)버튼 선택 시 해당폼 보여주기
	$(document).on('click', '#ridingReplyList input[value=수정]',
		function() {
			$(this).parent().css("display", "none"); //숨기기
			//보여주기
			$(this).parent().next().css("display", "block");
		});
	// 댓글 수정(DB)
	$(document).on('submit', '#ridingReplyList form', function() {
		event.preventDefault();
		//데이터 준비
		var params = $(this).serialize();
		var url = '/riding/ridingReplyEditOk';
		$.ajax({
			url: url,
			data: params,
			type: 'POST',
			success: function(result) {
				console.log(result);
				ridingReplyListAll();
			},
			error: function() {
				console.log('수정에러발생');
			}
		});
	});
	// 댓글 삭제
	$(document).on('click', '#ridingReplyList input[value=삭제]', function() {
		if (confirm('댓글을 삭제하시겠습니까?')) {
			var params = "ridingReplyNo=" + $(this).attr("title");
			$.ajax({
				url: '/riding/ridingReplyDel',
				data: params,
				success: function(result) {
					console.log(result);
					ridingReplyListAll();
				},
				error: function() {
					console.log("댓글삭제에러발생")
				}
			});
		}
	});
}

// 댓글등록
function ridingReplyFrm() {
	event.preventDefault();//form 기본 이벤트 제거
	if ($("#ridingReplyComent").val() == "") {//댓글 안쓴경우
		alert("댓글을 입력후 등록하세요");
		return;
	} else {//댓글 입력한경우
		var params = $("#ridingReplyFrm").serialize();
		$.ajax({
			url: '/riding/ridingReplyWriteOk',
			data: params,
			type: 'POST',
			success: function() {
				//폼을초기화
				$("#ridingReplyComent").val("");
				//댓글 목록 refresh되어야 한다.
				ridingReplyListAll();
			},
			error: function(e) {
				console.log(e.responseText);
			}
		});
	}
}
ridingReplyListAll();

$(".applicantSave").on("click", function(event) {
	if (confirm('같이 달리시겠습니까?')) {
		$('input[name=applicantNickName]').val($(this).parent().prev().prev().prev().prev().text());
		let applicantNickName = $('input[name=applicantNickName]').val();
		$.ajax({
			url: "/riding/ridingStateOk",
			type: "GET",
			data:  "ridingNo="+ridingNo+"&applicantNickName="+applicantNickName,
			success: function(result) {
				alert("유저와 라이딩을 함께합니다.");
				location.href = "/riding/ridingView?ridingNo=" + ridingNo;
			}, error: function(request, status, error) {
				console.log("code=" + request.status + "message=" + request.responseText + "error=" + errors);
			}
		});
	}
});

$(".applicantDel").on("click", function(event) {
	if (confirm('다음에 함께하시겠습니까?')) {
		$('input[name=applicantNickName]').val($(this).parent().prev().prev().prev().prev().text());
		let applicantNickName = $('input[name=applicantNickName]').val();
		$.ajax({
			url: "/riding/ridingStateDel",
			type: "GET",
			data:  "ridingNo="+ridingNo+"&applicantNickName="+applicantNickName,
			success: function(result) {
				alert(applicantNickName+"님의 라이딩 신청을 거절했습니다.");
				location.href = "/riding/ridingView?ridingNo=" + ridingNo;
			}, error: function(request, status, error) {
				console.log("code=" + request.status + "message=" + request.responseText + "error=" + errors);
			}
		});
	}
});

//참가신청 완료시, 신청하기 버튼 숨기기
for(let indexA=0; indexA<100; indexA++){
	if(document.getElementById('dbForWriterRidingState'+indexA)!=null){
		if(document.getElementById('dbForWriterRidingState'+indexA).value != 0){
			$("#ridingStateUpdateBtn"+indexA).css("display","none");
			$("#ridingStateDeleteBtn"+indexA).css("display","none");
			$("#togetherRiding"+indexA).text("참가 확정 완료");
			console.log(document.getElementById('dbForWriterRidingState'+indexA).value)
		}
	}

}