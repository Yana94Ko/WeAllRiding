<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
.ridingContainer{
	width: 80%;
	margin: 0 auto;
	padding: 0 auto;
}
#ridingSubject {
	width: 99%;
	height: 30px;
}

#ridingFrm li {
	margin: 0px;
	padding: 10px 5px;
}
#ridingeditBtn {
	background-color: rgba(255, 217, 102);
	padding: 10px 50px;
	margin: 0px;
	border-radius: 6px;
	border-color: rgba(204, 204, 204);
	float: right;
}
</style>
<script src="https://cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>
<script type="text/javascript">
	$(function() {
		CKEDITOR.replace("ridingContent",
				{ 
					height: '400px'
				}
		);

		$("#ridingFrm").submit(function() {
			if ($("#cridingSubject").val() == '') {
				alert("글 제목을 입력하세요");
				return false;
			}
			if (CKEDITOR.instances.ridingContent.getData() == '') {
				alert("글내용을 입력하세요");
				return false;
			}
		});
	});
</script>
<main>
<div class="ridingContainer">
	<form method="post" action="/riding/ridingEditOk" id="ridingFrm">
		<input type="hidden" name="ridingNo" value="${vo.ridingNo }"/>
		<ul>
			<h1>글 수정</h1>
			<li><input type="text" name="ridingSubject" id="ridingSubject" value="${vo.comtySubject}" /></li>
			<li><textarea name="ridingContent" id="ridingContent">${vo.ridingContent }</textarea></li>
			<li id="ridingeditBTN">
				<button id="ridingeditBtn">글 수정</button>
			</li>
		</ul>
	</form>
</div>
</main>