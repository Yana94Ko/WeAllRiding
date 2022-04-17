<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="${url}/css/riding/ridingList.css" rel="stylesheet" type="text/css">
<script src="https://cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>
<script type="text/javascript">
	function ridingViewDel() {
		if (confirm('글을 삭제시겠습니까?')) {
			location.href = ;
		}
	}
	function ridingViewEdit() {
		if (confirm('글을 수정하시겠습니까?')) {
			location.href = "/riding/ridingEdit?ridingNo=${vo.ridingNo}";
		}
	}
	
	function ridingMember() {
		event.preventDefault();//form 기본 이벤트 제거
		if (confirm('참가 신청하시겠습니까? \n 신청 후 취소는 어려우니 신중히 생각해주세요. \n ※단, 라이딩은 개설자에 의해 취소될 수 있습니다.※')){
			location.href = "/riding/ridingMemberOk?ridingNo=${vo.ridingNo}";
		}
	}
	
	// 댓글----------------
	function ridingReplyListAll() { //현재글의 댓글을 모두 가져오기
		var url = "/riding/ridingReplyList";
		var params = "ridingNo=${vo.ridingNo}"; // 31번 글이면 no=31이 된다.
				
		$.ajax({
			url : url,
			data : params,
			success : function(result) {
				var $result = $(result); // vo, vo, vo, ,,,
				var tag = "<ul>";
				$result.each(function(idx, vo) {
					tag += "<li><div id='dddd' style='color:black;'><div id='NN'>" + vo.nickname + "</div>";
						
					// 	 'goguma'== goguma
					if (vo.nickname == '${nickName}') {
						tag += "<input type='button' value='삭제' id='ridingReplyListDel' title='"+vo.ridingReplyNo+"' onclick='ridingReplyListDel()' />";
						tag += "<input type='button' value='수정' id='ridingReplyListEdit'/>";
					}
					tag += "<br/><div>" + vo.ridingReplyComent + "</div>";
					tag += "<div id='CRWD' style='color:lightgray;'>" + vo.ridingReplyWriteDate
							+ "</div></div>";
								
					//본인글일때 수정폼이 있어야 한다.
					if (vo.nickname == '${nickName}') {
						tag += "<div style='display:none' id='abcd'><form method='post'>";
						tag += "<input type='hidden' name='ridingReplyNo' value='"+vo.ridingReplyNo+"'/>";
						tag += "<textarea name='ridingReplyComent' style='width:500px; height:50px;'>"
								+ vo.ridingReplyComent
								+ "</textarea>";
						tag += "<input type='submit' value='수정' id='ridingReplyListEditOk'/>";
						tag += "</form></div>";
					}
					tag += "</li><br/><hr style='backgrond-color:lightgray;'>";
				});
				tag += "</ul>";
				$("#ridingReplyList").html(tag);
			},
			error : function(e) {
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
				url : url,
				data : params,
				type : 'POST',
				success : function(result) {
					console.log(result);
					ridingReplyListAll();
				},
				error : function() {
					console.log('수정에러발생');
				}
			});
		});
		 // 댓글 삭제
		   $(document).on('click', '#ridingReplyList input[value=삭제]', function() {
		      if (confirm('댓글을 삭제하시겠습니까?')) {
		         var params = "ridingReplyNo=" + $(this).attr("title");
		         $.ajax({
		            url : '/riding/ridingReplyDel',
		            data : params,
		            success : function(result) {
		               console.log(result);
		               ridingReplyListAll();
		            },
		            error : function() {
		               console.log("댓글삭제에러발생")
		            }
		         });
		      }
		   });
	}
	
	// 댓글등록
	function ridingReplyFrm(){
		event.preventDefault();//form 기본 이벤트 제거
		if ($("#ridingReplyComent").val() == "") {//댓글 안쓴경우
			alert("댓글을 입력후 등록하세요");
			return;
		} else {//댓글 입력한경우
			var params = $("#ridingReplyFrm").serialize();
			$.ajax({
				url : '/riding/ridingReplyWriteOk',
				data : params,
				type : 'POST',
				success : function() {
					//폼을초기화
					$("#ridingReplyComent").val("");
					//댓글 목록 refresh되어야 한다.
					ridingReplyListAll();
				},
				error : function(e) {
					console.log(e.responseText);
				}
			});
		}
	}
	ridingReplyListAll();
	
</script>
<!-- parallax START -->
<div class="home">
	<div class="homeBackground parallaxWindow" data-parallax="scroll"
		data-image-src="${url}/images/home/home_background.png"></div>
	<!-- 배경 이미지 -->
	<div class="homeContent">
		<div class="homeTitle">라이딩 목록</div>
		<!-- 페이지 타이틀 -->
	</div>
</div>
<!-- parallax END -->
<main>
	<div class="ridingViewContainer">
		<form method='post'>
			<ul>
				<h1 id="ridingViewTitle">라이딩 뷰</h1>
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
				<h2 id="ridingViewTitle">코스</h2>
				<li style="height: 400px; color: black;">코스가 나올 공간입니다.</li>

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
				<c:if test="${nickName == vo.nickname }">
					<li id="ridingViewBTN">
						<!-- <button id="ridingwriteBtn">글 수정</button> --> <input
						type="button" id="ridingViewDelBtn" onclick="ridingViewDel()"
						value="글 삭제" /> <input type="button" id="ridingViewEditBtn"
						onclick="ridingViewEdit()" value="글 수정" />
					</li>
				</c:if>
				
				<h1 style="margin:0 auto; padding:40px;">라이딩 참가자</h1>
				<ul id="mList">
					<li id="mListFirst">번호</li>
					<li id="mListFirst">닉네임</li>
					<li id="mListFirst">성별</li>
					<li id="mListFirst">모임 횟수</li>
					<li id="mListFirst">유저 레벨</li>
					<c:forEach var="vo" items="${lst2 }">
						<li>${vo.ridingMemberNo }</li>
						<li>${vo.nickname }</li>
						<li>${vo.gender }</li>
						<li>${vo.ridingCount }</li>
						<li>${vo.userScore }</li>
					</c:forEach>
				</ul>
				<br><br><br>
				<c:if test="${nickName != vo.nickname && nickName != null && nickName != ''}">
					<li><input type="button" id="ridingMemberBtn"
						onclick="ridingMember()" value="라이딩 신청하기"/></li>
						<a href="/riding/ridingMemberOk">라이딩 신청하기</a>
						${vo.ridingNo },${vo.nickname },${vo.gender }
				</c:if>
				<li><input type="text" id="ridingReview"
					value="후기 자리 (라이딩 신청 멤버만 가능)" /></li>
			</ul>
		</form>
		
		<!-- 댓글 쓰기 폼 -->
		<c:if test="${logStatus=='Y' }">
			<form method='post' id="ridingReplyFrm">
				<input type="hidden" name="ridingNo" value="${vo.ridingNo }" />
				<textarea name="ridingReplyComent" id="ridingReplyComent"
					style="width: 100%; height: 100px;"></textarea>
				<br> <input type="button" value="댓글등록" id="replyBtn" onclick="ridingReplyFrm()">
			</form>
		</c:if>
		<!-- 댓글목록이 나올 자리 -->
		<div id="ridingReplyList"></div>
	</div>
</main>