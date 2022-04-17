<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.comtyContainer{
	width: 80%;
	margin: 0 auto;
	padding: 0 auto;
}
#comtySubject {
	width: 99%;
	height: 30px;
}
#comtyFrm li {
	margin: 0px;
	padding: 10px 5px;
}
#editBtn {
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
		CKEDITOR.replace("comtyContent",
				{ 
					height: '400px'
				}
		);
		$("#comtyFrm").submit(function() {
			if ($("#comtySubject").val() == '') {
				alert("글 제목을 입력하세요");
				return false;
			}
			if (CKEDITOR.instances.comtyContent.getData() == '') {
				alert("글내용을 입력하세요");
				return false;
			}
		});
	});
</script>
<main>
<div class="comtyContainer">
	<form method="post" action="/comty/comtyEditOk" id="comtyFrm">
		<input type="hidden" name="comtyNo" value="${vo.comtyNo }"/>
		<ul>
			<h1>글 수정</h1>
			<li><input type="text" name="comtySubject" id="comtySubject" value="${vo.comtySubject}" /></li>
			<li><textarea name="comtyContent" id="comtyContent">${vo.comtyContent }</textarea></li>
			<li id="editBTN">
				<button id="editBtn">글 수정</button>
			</li>
		</ul>
	</form>
</div>
</main>