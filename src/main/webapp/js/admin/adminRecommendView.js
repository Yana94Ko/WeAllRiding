console.log($('textarea[id^=adminRecommendSendData]').length+"개의 지도 생성 예정")
for(var z = 0; z < 10;z++){
	var adminRecommendSendData = document.getElementById("adminRecommendSendData" + z);
	if(adminRecommendSendData.value){	
		var adminRecommendSendData = JSON.parse(adminRecommendSendData.value);

		var startPointName = adminRecommendSendData.startPointName;
		var endPointName = adminRecommendSendData.endPointName;

		console.log(adminRecommendSendData.startPointName)
		//데이터 입력
		$("#startPoint" + z).text(startPointName);
		$("#endPoint" + z).text(endPointName);
	}
} 