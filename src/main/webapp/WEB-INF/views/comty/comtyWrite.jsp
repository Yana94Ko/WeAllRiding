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
	<h1>글등록 폼</h1>
	<form method="post" action="/comty/comtyWriteOk" id="comtyFrm">
		<ul>
			<li>제목</li>
			<li><input type="text" name="comtySubject" id="comtySubject" /></li>
			<li><textarea name="comtyContent" id="comtyContent"></textarea></li>
			<li><input type="submit" value="등록" /></li>
		</ul>
	</form>
</div>
</main>