<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.comtyContainer {
	width: 80%;
	margin: 0 auto;
	padding: 0 auto;
}

#comtyFrm {
	background-color: rgba(234, 234, 234);
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
	$(function(){
		// 댓글등록
		$("#comtyReplyFrm").submit(function(){
			event.preventDefault();//form 기본 이벤트 제거
			if($("#comtyReplyComent").val()==""){//댓글 안쓴경우
				alert("댓글을 입력후 등록하세요");
				return;
			}else{//댓글 입력한경우
				var params = $("#comtyReplyFrm").serialize();
				
				$.ajax({
					url:'/comty/comtyReplyWriteOk',
					data:params,
					type:'POST',
					success:function(){
						//폼을초기화
						$("#comtyReplyComent").val("");
						//댓글 목록 refresh되어야 한다.
					},error:function(e){
						console.log(e.responseText);
					}
				});
			}
		});
		// 현재글의 댓글
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
		<c:if test="${userId == vo.nickname }">
			<div id="viewBTN">
				<button id="editBtn" onclick="javascript:edit()">글 수정</button>
				<button id="delBtn" onclick="javascript:del()">글 삭제</button>
			</div>
		</c:if>
		
		<hr/>
		<!-- 댓글 쓰기 폼 -->
		<c:if test="${logStatus=='Y' }">
			<form method='post' id="comtyReplyFrm">
				<input type="hidden" name="comtyNo" value="${vo.comtyNo }"/>
				<textarea name="comtyReplyComent" id="comtyReplyComent" style="width:500px; height:100px;"></textarea>
				<input type="submit" value="댓글등록">
			</form>
		</c:if>
		
		
	</div>
</main>