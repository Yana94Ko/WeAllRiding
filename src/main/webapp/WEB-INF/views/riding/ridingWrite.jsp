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
	margin:0px;
	padding: 10px 5px;
}

#ridingsubject {
	color: black;
}

#ridingwriteBtn {
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
				height:'400px'
			}
		);

		$("#ridingFrm").submit(function() {
			if ($("#ridingSubject").val() == '') {
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
	<form method="post" action="/riding/ridingWriteOk" id="ridingFrm">
		<ul>
			<h2 id="ridingSubject">제목</h2>
			<li><input type="text" name="ridingSubject" id="ridingSubject" /></li>
			<li><textarea name="ridingContent" id="ridingContent" style="min-height:400px;"></textarea></li>
			<li id="ridingwriteBTN">
				<button id="ridingwriteBtn">글 등록</button>
			</li>
		</ul>
	</form>
</div>
</main>