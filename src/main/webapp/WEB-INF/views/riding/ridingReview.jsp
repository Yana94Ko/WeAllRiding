<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="${url}/css/riding/ridingList.css" rel="stylesheet" type="text/css">

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
					} else{
						alert("후기 등록이 완료되었습니다.");
						$("#ridingReviewComent").val("");
						// ridingReviewListAll();
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
	<div class="ridingViewContainer">
		<form method='post'>
			<ul>
				<h1 id="ridingViewTitle">라이딩 후기</h1>
				<br>
				<br>
				<h2 id="ridingViewTitle"><input type="hidden" name="ridingSubject" value="${vo.ridingSubject }">${vo.ridingSubject }</h2>
				
				<br>
				<ul>
					<li id="ridingViewFrm">글 번호 : ${vo.ridingNo }&nbsp;&nbsp;&nbsp;&nbsp;
						작성자 : ${vo.nickname }&nbsp;&nbsp;&nbsp;&nbsp; 작성일 :
						${vo.ridingWriteDate }&nbsp;&nbsp;&nbsp;&nbsp; 조회수 :
						${vo.ridingHit }&nbsp;&nbsp;&nbsp;</li>
				</ul>
				<br>
				<h2 id="ridingViewTitle">키워드</h2>
				<li style="color: black;">${vo.ridingKeyword }</li>
				<br>

				<li id="dateAll" style="color: black;">
					<h2 id="ridingViewTitle">일정</h2> 
					<input type="hidden" name="startDate" value="${vo.startDate }">${vo.startDate } - 
					<input type="hidden" name="endDate" value="${vo.endDate }">${vo.endDate }
				</li>

				<li id=courseLevel style="color: black">
					<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;난이도</h2>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${vo.courseLevel }
				</li>

				
				
				<br><br><br><br>
				<h2 id="ridingViewTitle">내용</h2>
				<li style="color: black;">${vo.ridingContent }</li>
				<hr>
				
				<h1 style="margin:0 auto; padding:20px 0px;">라이딩 참가자</h1>
				<input type="textarea" value="비매너 유저 신고는 하단의 1:1문의를 이용해 주세요!" id="supportGo" readonly/>
				<c:forEach var="vo" items="${lst2 }">
					<div id="reviewTextImg">
						<input type="text" value="${vo.nickname }" id="reviewListText" readonly/>
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
			<h3 style="font-size:1.2em;">라이딩 후기</h3> <br>
			<li>
				<form method='post' id="ridingReviewFrm">
				<input type="hidden" name="ridingNo" value="${vo.ridingNo }" />
				<textarea name="ridingReviewComent" id="ridingReviewComent" placeholder="라이딩에 대한 후기를 작성해주세요"></textarea>
				<input type="button" value="후기 등록" id="ridingwriteBtn" onclick="ridingReviewFrm()">
			</form>
			</li>
	         <br>
		</form>
	</div>
	<br><br><br>
</main>