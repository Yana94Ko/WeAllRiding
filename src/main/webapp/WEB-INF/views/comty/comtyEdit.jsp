<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
#comtySubject {
	width: 98%;
}

#comtyFrm li {
	padding: 10px 5px;
}
</style>
<script src="https://cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>
<script>
	$(function() {
		CKEDITOR.replace("comtyContent");

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
	<h1>글수정 폼</h1>
	<form method="post" action="/comty/comtyEditOk" id="comtyFrm">
		<input type="hidden" name="comtyNo" value="${vo.comtyNo }"/>
		<ul>
			<li>제목</li>
			<li><input type="text" name="comtySubject" id="comtySubject" value="${vo.comtySubject}" /></li>
			<li><textarea name="comtyContent" id="comtyContent">${vo.comtyContent }</textarea></li>
			<li><input type="submit" value="수정" /></li>
		</ul>
	</form>
</div>
</main>