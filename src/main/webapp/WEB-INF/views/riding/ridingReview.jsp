<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="${url}/css/riding/ridingReview.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	//댓글등록
	function ridingReviewFrm(){
		event.preventDefault();//form 기본 이벤트 제거
		if ($("#ridingReviewComent").val() == "") {//댓글 안쓴경우
			alert("후기를 입력후 등록하세요");
			return;
		} else {//댓글 입력한경우
			confirm("후기는 작성 후 수정이 불가하니 신중히 작성해주세요 \n후기를 작성하시겠습니까?");
			var params = $("#ridingReviewFrm").serialize();
			$.ajax({
				url : '/riding/ridingReviewWriteOk?ridingNo=${vo.ridingNo}',
				data : params,
				type : 'POST',
				success : function(res) {
					if(res==0){
						alert("이미 후기를 등록하셨습니다")
						location.href="/"
					} else{
						alert("후기 등록이 완료되었습니다.");
						$("#ridingReviewComent").val("");
						location.href="/"
					}
				},
				error : function(e) {
					alert("에러");
				}
			});
		}
	}
</script>

<main>
	<div class="container">
		<div class="containerWrap">
			<div class="ridingViewContainer">
				<form method='post'>
					<ul>
						<h1 id="ridingViewTitle">라이딩 후기</h1>
						<br>
						<br>
						<h2>제목</h2>
						<input type="text" name="ridingSubject" class="ridingSubject" value="${vo.ridingSubject }" readonly>

						<br>

						<br>
						<h2 id="ridingViewTitle">키워드</h2>
						<input type="text" class="ridingSubject" value="${vo.ridingKeyword }" readonly>
						<br>

						<li id="dateAll" style="color: black;"><br>
							<h2 id="ridingViewTitle">일정</h2>
							<input type="text" name="startDate" class="ridingDate" value="${vo.startDate }" readonly> -
							<input type="text" name="endDate" class="ridingDate" value="${vo.endDate }" readonly>
						</li><br>


						<h2 style="margin:0 auto; padding:20px 0px;">참가자 평가</h2>
						<c:forEach var="vo" items="${lst2 }">
							<div id="reviewTextImg" class="userReview">
								<input type="text" value="${vo.nickname }" id="reviewListText" class="ridingDate" readonly/>
								<img src="../../images/smile.png" class="reviewImg1">
								<img src="../../images/sad.png" class="reviewImg2">
							</div>
						</c:forEach>
					</ul>

					<script>
						$(".reviewImg1").on("click", function(event) {
							const nickname = $(this).prev().val();
							const body = {
								nickname: nickname,
								scored: "${nickName}",
								ridingNo: ${vo.ridingNo}
							}
							axios.post("/riding/ridingScoreUpOk" , body)
									.then((res) => {
										if(res.data==1){
											alert("평가 완료")
										} else {
											alert("이미 평가하셨습니다");
										}
									})
									.catch((error) => {
										alert(error);
									})
						});
						$(".reviewImg2").on("click", function(event) {
							const nickname = $(this).prev().prev().val();
							const body = {
								nickname: nickname,
								scored: "${nickName}",
								ridingNo: ${vo.ridingNo}
							}
							axios.post("/riding/ridingScoreDownOk", body)
									.then((res) => {
										if(res.data==1){
											alert("평가 완료")
										} else {
											alert("이미 평가하셨습니다")
										}
									})
									.catch((error) => {
										alert(error);
									})
						});
					</script>
					<form id="nicknameTest">
						<input type="text" name="applicantNickName" id="applicantNickName" style="display:none;" >
					</form>

					<br><br><br>
					<h2>라이딩 후기</h2><br>
					<form method='post' id="ridingReviewFrm">
						<input type="hidden" name="ridingNo" value="${vo.ridingNo }" />
						<textarea name="ridingReviewComent" id="ridingReviewComent" class="ridingReviewComent" placeholder="라이딩에 대한 후기를 작성해주세요"></textarea>
						<input type="textarea" value="비매너 유저 신고는 하단의 1:1문의를 이용해 주세요!" id="supportGo" readonly/>
						<input type="button" value="후기 등록" id="ridingwriteBtn" class="ridingwriteBtn" onclick="ridingReviewFrm()">
					</form>
					<br><br><br>
				</form>
			</div>
		</div>
	</div>
	<br><br>
	<script type="text/javascript" src="${url}/js/riding/ridingReview.js"></script>
</main>