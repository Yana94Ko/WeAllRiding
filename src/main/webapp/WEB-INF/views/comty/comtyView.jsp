'<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	main *{
		box-sizing: border-box;
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
		-webkit-font-smoothing: antialiased;
		-moz-font-smoothing: antialiased;
		-o-font-smoothing: antialiased;
		font-smoothing: antialiased;
		text-rendering: optimizeLegibility;
	}
	main {
		font-family: "Roboto", Helvetica, Arial, sans-serif;
		font-weight: 100;
		font-size: 12px;
		line-height: 30px;
		color: #777;
		background: #dddddd;
		width:100%;
	}
	.comtyContainer {
		margin: 0 auto 0 auto;
		padding: 0 auto;
		width: 80%;
	}
	.container {
		max-width: 1500px;
		width: 100%;
		margin: 0 auto;
		position: relative;
	}
	.containerWrap {
		min-height: 78.5vh;
		background: var(--color-lightGray-1);
		padding: 25px;
		margin: 0 auto;
		box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
	}
	.comtySubject{
		font-size: 1.5vw;
		font-weight: 800;
		padding-bottom: 1vh;
		line-height: 2vw;
	}
	.comtyTitle{
		margin: 1vh 0 2vh 0;
		padding: 0;
		font-size: 2.5vw;
		font-weight: 700;
		line-height: 9vh;
		color: var(--color-theme-0);
	}
	ul{
		margin: 0px;
		padding: 0px;
	}
	#comtyFrm{
		border-bottom: #3a47509e 1px solid;
		padding: -0.5vw 0 0.5vw;
		line-height: 1vw;
	}
	#comtyFrm >span {
		height: 2vw;
		line-height: 2vw;
		color: darkgray;
		font-size: 1vw;
		text-align: left;
	}
	#comtyFrm >span:nth-child(2){
		float:right;
		padding: 0.5vw 0 0.7vw;
		line-height: 1vw;
	}
	.commentsWrap{
		font-size: 1vw;
		line-height: 1vw;
		border-bottom: var(--color-theme-0) solid 0.5px;
	}
	.comments{
		display: flex;
	}
	#NN{
		font-weight: bold;
		width: 5vw;
	}
	#comtyReplyComentwriten {
		width: 39vw;
	}
	.cmtreplyWrite{
		padding:2vh;
		display: flex;
		line-height: 2vw;
	}
	.cmtreplyWrite> div {
		line-height: 10vh;
	}
	#comtyReplyComent{
		width: 42vw;
		height: 10vh;
	}
	.comtyReplyComentWrap{
		background: #6f9fd540;
		font-size: 1vw;
		line-height: 1vw;
		margin-top: 2vh;
	}
	.replyRightTitle{
		width: 8vw;
		line-height: 2vw;
	}
	.comments > div{
		line-height: 2vw;
	}
	#comtyViewContent {
		min-height: 21vh;
		/* height: 100%; */
		padding-top: 2vh;
		font-size: 1vw;
		line-height: 1vw;
		color: #000000e0;
	}
	#replyTitle{
		font-size: 1.3vw;
		font-weight: 800;
		padding: 4vh 0 1.2vh 0;
		border-bottom: var(--color-theme-1) 2px solid;
	}
	#editBtn {
		background-color: rgba(255, 217, 102);
		padding: 10px 50px;
		margin: 0px;
		border-radius: 6px;
		border-color: rgba(204, 204, 204);
		float: right;
	}
	#delBtn {
		background-color: rgba(231, 76, 60);
		padding: 10px 50px;
		margin: 0px 20px;
		border-radius: 6px;
		border-color: rgba(204, 204, 204);
		float: right;
	}
	#replyBtn {
		background-color: var(--color-theme-0);
		border-radius: 6px;
		border-color: rgba(204, 204, 204);
		float: center;
		margin: 1px;
		text-align: center;
		width: 8vw;
		color:white;
		height: 10vh;
		margin-left:1vw;
	}
	#comtyReplyList ul{
		padding-top: 2vh;
		margin: 0px auto;
		padding-bottom: 2vh;
	}
	#comtyReplyList ul>li {
		color: black;
	}
	#comtyReplyList input {
		background-color: var(--color-theme-2);
		border-radius: 6px;
		border-color: rgba(204, 204, 204);
		float: center;
		margin: 1px;
		text-align: center;
		width: 4vw;
		height: 2vw;
	}
	.comtyReplyEdit{
		width: 58vw;
		height: 9vh;
	}
	.comtyReplyEditWrap{
		padding: 1vw;
		background: #3a47502e;
	}
	.replyEdit{
		position: relative;
		top: 1vh;
		left: 53vw;
	}
	#comtyReplyListEdit {
		padding: 0px 0px;
		margin: 0px;
		border: none;
	}
	#comtyReplyListDel {
		padding: 0px 0px;
		margin: 0px;
		border: none;
	}
	#NN {
		font-weight: bold;
	}
	#CRWD {
		font-size: 0.7vw;
		padding-right: 0.5vw;
		padding-left: 0.5vw;
	}
</style>
<script>
	function del() {
		if (confirm('글을 삭제시겠습니까?')) {
			location.href = "/comty/comtyDel?comtyNo=${vo.comtyNo}";
		}
	}
	function edit() {
		if (confirm('글을 수정하시겠습니까?')) {
			location.href = "/comty/comtyEdit?comtyNo=${vo.comtyNo}";
		}
	}
	// 댓글----------------
	$(function() {
		//댓글목록을 가져오는 함수
		function comtyReplyListAll() { //현재글의 댓글을 모두 가져오기
			var url = "/comty/comtyReplyList";
			var params = "comtyNo=${vo.comtyNo}"; // 31번 글이면 no=31이 된다.
			$
					.ajax({
						url : url,
						data : params,
						success : function(result) {
							var $result = $(result); // vo, vo, vo, ,,,
							var tag = "<ul class='commentsWrap'>";
							$result
									.each(function(idx, vo) {
										tag += "<li><div class='comments'><div id='NN'>" + vo.nickname + "</div>";
										// 	 'goguma'== goguma
										tag += "<div id='comtyReplyComentwriten' >" + vo.comtyReplyComent + "</div>";
										tag += "<div id='CRWD' style='color:lightgray;'>" + vo.comtyReplyWriteDate
												+ "</div>";
										if (vo.nickname == '${nickName}') {
											tag += "<input type='button' value='삭제' id='comtyReplyListDel' title='"+vo.comtyReplyNo+"' />";
											tag += "<input type='button' value='수정' id='comtyReplyListEdit'/></div>";
										}
										
										//본인글일때 수정폼이 있어야 한다.
										if (vo.nickname == '${nickName}') {
											tag += "<div style='display:none'><form method='post'>";
											tag += "<input type='hidden' name='comtyReplyNo' value='"+vo.comtyReplyNo+"'/>";
											tag += "<div class='comtyReplyEditWrap'><textarea class='comtyReplyEdit'name='comtyReplyComent'>"
													+ vo.comtyReplyComent
													+ "</textarea>";
											tag += "<input type='submit' class='replyEdit' value='수정'/></div>";
											tag += "</form></div>";
										}
									});
							tag += "</ul>";
							$("#comtyReplyList").html(tag);
						},
						error : function(e) {
							console.log(e.responseText)
						}
					});
		}
		// 댓글등록
		$("#comtyReplyFrm").submit(function() {
			event.preventDefault();//form 기본 이벤트 제거
			if ($("#comtyReplyComent").val() == "") {//댓글 안쓴경우
				alert("댓글을 입력후 등록하세요");
				return;
			} else {//댓글 입력한경우
				var params = $("#comtyReplyFrm").serialize();
				$.ajax({
					url : '/comty/comtyReplyWriteOk',
					data : params,
					type : 'POST',
					success : function() {
						//폼을초기화
						$("#comtyReplyComent").val("");
						//댓글 목록 refresh되어야 한다.
						comtyReplyListAll();
					},
					error : function(e) {
						console.log(e.responseText);
					}
				});
			}
		});
		// 댓글 수정(Edit)버튼 선택 시 해당폼 보여주기
		$(document).on('click', '#comtyReplyList input[value=수정]',
				function() {
					$(this).parent().css("display", "none"); //숨기기
					//보여주기
					$(this).parent().next().css("display", "block");
				});
		// 댓글 수정(DB)
		$(document).on('submit', '#comtyReplyList form', function() {
			event.preventDefault();
			//데이터 준비
			var params = $(this).serialize();
			var url = '/comty/comtyReplyEditOk';
			$.ajax({
				url : url,
				data : params,
				type : 'POST',
				success : function(result) {
					console.log(result);
					comtyReplyListAll();
				},
				error : function() {
					console.log('수정에러발생');
				}
			});
		});
		// 댓글 삭제
		$(document).on('click', '#comtyReplyList input[value=삭제]', function() {
			if (confirm('댓글을 삭제하시겠습니까?')) {
				var params = "comtyReplyNo=" + $(this).attr("title");
				$.ajax({
					url : '/comty/comtyReplyDel',
					data : params,
					success : function(result) {
						console.log(result);
						comtyReplyListAll();
					},
					error : function() {
						console.log("댓글삭제에러발생")
					}
				});
			}
		});
		// 현재글의 댓글
		comtyReplyListAll();
	});
</script>
<!-- parallax START -->
<div class="home">
	<div class="homeBackground parallaxWindow" data-parallax="scroll"
		data-image-src="${url}/images/home/home_background13.png"></div>
	<!-- 배경 이미지 -->
	<div class="homeContent">
		<div class="homeTitle">커뮤니티</div>
		<!-- 페이지 타이틀 -->
	</div>
</div>
<!-- parallax END -->
<main>
	<div class="container">
		<div class="containerWrap">
			<div class="comtyContainer">
				<h1 class="comtyTitle">게시글</h1>
				<h2 class="comtySubject">${vo.comtySubject }</h2>
				<ul id="comtyFrm">
					<span>글 번호 : ${vo.comtyNo }&nbsp;&nbsp;&nbsp;&nbsp;
						작성자 : ${vo.nickname }&nbsp;&nbsp;&nbsp;&nbsp; 작성일 :
						${vo.comtyWriteDate }&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
					</span>
					<span>
						조회수 : ${vo.comtyHit }&nbsp;&nbsp
					</span>
				</ul>
				<ul>
					<li id="comtyViewContent">${vo.comtyContent }</li>
				</ul>
				<c:if test="${userId == vo.nickname }">
					<div id="viewBTN">
						<button id="delBtn" onclick="javascript:del()">글 삭제</button>
						<button id="editBtn" onclick="javascript:edit()">글 수정</button>
					</div>
				</c:if>
				<!-- 댓글목록이 나올 자리 -->
				<h2 id="replyTitle">전체 댓글</h2>
				<div id="comtyReplyList"></div>
				<!-- 댓글 쓰기 폼 -->
				<c:if test="${logStatus=='Y' }">
					<form method='post' id="comtyReplyFrm">
						<input type="hidden" name="comtyNo" value="${vo.comtyNo }" />
						<div class='comtyReplyComentWrap'>
							<div class="cmtreplyWrite">
								<div class="replyRightTitle">댓글 작성</div>
								<textarea name="comtyReplyComent" id="comtyReplyComent"></textarea>
								<input type="submit" value="댓글등록" id="replyBtn">
							</div>
						</div>

					</form>
				</c:if>
			</div>
		</div>
	</div>
</main>