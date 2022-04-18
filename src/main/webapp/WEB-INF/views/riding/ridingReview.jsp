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
				success : function() {
					//폼을초기화
					alert("후기 등록이 완료되었습니다.");
					$("#ridingReviewComent").val("");
					//댓글 목록 refresh되어야 한다.
					ridingReviewListAll();
				},
				error : function(e) {
					console.log(e.responseText);
				}
			});
		}
	}
	/* 
	function userScoreUp() {
		event.preventDefault();
		confirm("유저를 칭찬합니다");
		$("#reviewImg1").on("click", function(event) {
			var applicantNickName = $('input[name=applicantNickName]').val($(this).prev().val());
			
			$.ajax({
				url : "/riding/ridingScoreOk?ridingNo=${vo.ridingNo}", 
				type : "GET", 
				data : applicantNickName, 
				dataType: 'JSON', 
				success : function(data){
					alert(data);
				},error : function(e){
		               console.log(e.responseText);
	            }
			});
		});
	}
 */
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
						<img src="../../images/웃는이모티콘.png" class="reviewImg1">
						<img src="../../images/우는이모티콘.png" class="reviewImg2">
					</div>
				</c:forEach>		
			</ul>
			
			<script>
					$(".reviewImg1").on("click", function(event) {
						confirm("좋았어요!");
						console.log("들어오는")
						var applicantNickName = $('input[name=applicantNickName]').val($(this).prev().val());
						
						$.ajax({
							url : "/riding/ridingScoreUpOk?ridingNo=${vo.ridingNo}", 
							type : "GET", 
							data : applicantNickName, 
							dataType: 'JSON', 
							success : function(data){
								this.next().style("display:none");
							},error : function(e){
								console.log(e.responseText);
							}
						});
					});
					$(".reviewImg2").on("click", function(event) {
						confirm("아쉬웠어요!");
						console.log("들어오는")
						var applicantNickName = $('input[name=applicantNickName]').val($(this).prev().prev().val());
						
						$.ajax({
							url : "/riding/ridingScoreDownOk?ridingNo=${vo.ridingNo}", 
							type : "GET", 
							data : applicantNickName, 
							dataType: 'JSON', 
							success : function(data){
								this.next().style("display:none");
							},error : function(e){
								console.log(e.responseText);
							}
						});
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