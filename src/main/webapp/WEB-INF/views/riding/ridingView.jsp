<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.ridingContainer {
	width: 80%;
	margin: 0 auto;
	padding: 0 auto;
}

#ridingFrm {
	background-color: rgba(234, 234, 234);
	width: 100%;
	height: 25px;
	color: black;
	text-align: right;
	padding: 10px 0 10px;
}

#ridingViewContent {
	min-height: 400px;
	height: 100%;
	color: black;
}

#ridingeditBtn {
	background-color: rgba(255, 217, 102);
	padding: 10px 50px;
	margin: 0px;
	border-radius: 6px;
	border-color: rgba(204, 204, 204);
	float: right;
}

#ridingdelBtn {
	background-color: rgba(231, 76, 60);
	padding: 10px 50px;
	margin: 0px 20px;
	border-radius: 6px;
	border-color: rgba(204, 204, 204);
	float: right;
}
</style>
<script>
	function del() {
		if (confirm('글을 삭제시겠습니까?')) {
			location.href = "/riding/ridingDel?ridingNo=${vo.ridingNo}";
		}
	}
	function edit() {
		if (confirm('글을 수정하시겠습니까?')) {
			location.href = "/riding/ridingEdit?ridingNo=${vo.ridingNo}";
		}
	}
</script>
<main>
	<div class="ridingContainer">
		<h2>${vo.comtySubject }</h2>
		<ul>
			<li id="ridingFrm">글 번호 : ${vo.ridingNo }&nbsp;&nbsp;&nbsp;&nbsp;
				작성자 : ${vo.nickname }&nbsp;&nbsp;&nbsp;&nbsp; 작성일 :
				${vo.ridingWriteDate }&nbsp;&nbsp;&nbsp;&nbsp; 조회수 : ${vo.ridingHit }&nbsp;&nbsp;&nbsp;
			</li>
		</ul>
		<ul>
			<li id="ridingViewContent">${vo.ridingContent }</li>
		</ul>
		<c:if test="${userId == vo.nickname }">
			<div id="ridingviewBTN">
				<button id="ridingeditBtn" onclick="javascript:edit()">글 수정</button>
				<button id="ridingdelBtn" onclick="javascript:del()">글 삭제</button>
			</div>
		</c:if>
		
		<!-- 댓글쓰기 -->
	<c:if test="${logStatus=='Y'}">
		<form method='post' id='ridingreplyFrm'>
			<input type="hidden" name="ridingNo" value="${vo.ridingNo}"/>
			<textarea name="coment" id='coment'style='width:500px;height:80px;'></textarea>
			<input type="submit" value="댓글등록"/>
		</form>
	</c:if>
	<hr/>
	<!-- 댓글 목록 나올 자리 -->
	<div id="replyList">
	</div>
</main>