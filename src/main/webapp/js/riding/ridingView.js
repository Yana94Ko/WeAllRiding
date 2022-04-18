console.log("작동확인");
function ridingViewDel() {
		if (confirm('글을 삭제시겠습니까?')) {
			location.href = "/riding/ridingDel?ridingNo=${vo.ridingNo}";
		}
	}
	function ridingViewEdit() {
		if (confirm('글을 수정하시겠습니까?')) {
			location.href = "/riding/ridingEdit?ridingNo=${vo.ridingNo}";
		}
	}
	function ridingStateOk() {
		if (confirm('승낙 하시겠습니까?')) {
			location.href = "/riding/ridingStateOk?ridingNo=${vo.ridingNo}";
		}
	}
	
	function ridingMember() {
		event.preventDefault();//form 기본 이벤트 제거
		if (confirm('참가 신청하시겠습니까? \n 신청 후 취소는 어려우니 신중히 생각해주세요. \n ※단, 라이딩은 개설자에 의해 취소될 수 있습니다.※')){
			location.href = "/riding/ridingMemberOk?ridingNo=${vo.ridingNo}";
		}
	}
	
	function ridingMemberCancel() {
		event.preventDefault();//form 기본 이벤트 제거
		if (confirm('신청 취소 하시겠습니까?')){
			location.href = "/riding/ridingMemberCan?ridingNo=${vo.ridingNo}";
		}
	}