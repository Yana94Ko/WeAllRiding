<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.comtyContainer {
	width: 80%;
	margin: 0 auto;
	padding: 0 auto;
}
ul{
	margin: 0px;
	padding: 0px;
}
#comtyFrm {
	background-color: rgba(234, 234, 234);
	font-size:0.8em;
	width: 100%;
	height: 25px;
	color: black;
	text-align: right;
	padding: 10px 0 10px;
}
#comtyViewContent {
	min-height: 400px;
	height: 100%;
	color: black;
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
	background-color: rgba(234, 234, 234);
	padding: 10px 50px;
	border-radius: 6px;
	border-color: rgba(204, 204, 204);
	float: center;
	width: 100%;
}
#comtyReplyList ul{
	padding: 10px;
	margin: 0px auto;
	padding-bottom: 50px;
}
#comtyReplyList ul>li {
	color: black;
}
#comtyReplyList input {
	background-color: none;
	padding: 2px 2px;
	border-radius: 6px;
	border-color: rgba(204, 204, 204);
	float: right;
	size: 20px;
	margin: 1px;
}
#comtyReplyListEdit {
	background-color: rgba(255, 255, 255);
	padding: 10px 50px;
	margin: 0px;
	border: none;
	float: right;
}
#comtyReplyListDel {
	background-color: rgba(255, 255, 255);
	padding: 10px 50px;
	margin: 0px;
	border: none;
	float: right;
}
#NN {
	font-weight: bold;
}
#CRWD {
	font-size: 0.5em;
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
							var tag = "<ul>";
							$result
									.each(function(idx, vo) {
										tag += "<li><div><div id='NN'>" + vo.nickname + "</div>";
										// 	 'goguma'== goguma
										if (vo.nickname == '${nickName}') {
											tag += "<input type='button' value='삭제' id='comtyReplyListDel' title='"+vo.comtyReplyNo+"' />";
											tag += "<input type='button' value='수정' id='comtyReplyListEdit'/>";
										}
										tag += "<br/><div>" + vo.comtyReplyComent + "</div>";
										tag += "<div id='CRWD' style='color:lightgray;'>" + vo.comtyReplyWriteDate
												+ "</div></div>";
										
										//본인글일때 수정폼이 있어야 한다.
										if (vo.nickname == '${nickName}') {
											tag += "<div style='display:none'><form method='post'>";
											tag += "<input type='hidden' name='comtyReplyNo' value='"+vo.comtyReplyNo+"'/>";
											tag += "<textarea name='comtyReplyComent' style='width:500px; height:50px;'>"
													+ vo.comtyReplyComent
													+ "</textarea>";
											tag += "<input type='submit' value='수정'/>";
											tag += "</form></div>";
										}
										tag += "</li><br/><hr style='backgrond-color:lightgray;'>";
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
<main>
	<div class="comtyContainer">
		<h2>${vo.comtySubject }</h2>
		<ul>
			<li id="comtyFrm">글 번호 : ${vo.comtyNo }&nbsp;&nbsp;&nbsp;&nbsp;
				작성자 : ${vo.nickname }&nbsp;&nbsp;&nbsp;&nbsp; 작성일 :
				${vo.comtyWriteDate }&nbsp;&nbsp;&nbsp;&nbsp; 조회수 : ${vo.comtyHit }&nbsp;&nbsp;&nbsp;
			</li>
		</ul>
		<ul>
			<li id="comtyViewContent">${vo.comtyContent }</li>
		</ul>
		<hr>
		<c:if test="${userId == vo.nickname }">
			<div id="viewBTN">
				<button id="delBtn" onclick="javascript:del()">글 삭제</button>
				<button id="editBtn" onclick="javascript:edit()">글 수정</button>
			</div>
		</c:if>
		<br/><br/><br/><br/>
		<!-- 댓글 쓰기 폼 -->
		<c:if test="${logStatus=='Y' }">
			<form method='post' id="comtyReplyFrm">
				<input type="hidden" name="comtyNo" value="${vo.comtyNo }" />
				<textarea name="comtyReplyComent" id="comtyReplyComent"
					style="width: 100%; height: 100px;"></textarea>
				<br>
				<input type="submit" value="댓글등록" id="replyBtn">
			</form>
		</c:if>
		<!-- 댓글목록이 나올 자리 -->
		<div id="comtyReplyList"></div>
	</div>
</main>