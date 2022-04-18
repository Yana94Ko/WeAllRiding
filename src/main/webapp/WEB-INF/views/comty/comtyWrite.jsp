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
	margin:0px;
	padding: 10px 5px;
}

#subject {
	color: black;
}

#writeBtn {
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
				height:'400px'
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
<!-- parallax START -->
<div class="home">
	<div class="homeBackground parallaxWindow" data-parallax="scroll"
		data-image-src="${url}/images/home/home_background13.png"></div>
	<!-- 배경 이미지 -->
	<div class="homeContent">
		<div class="homeTitle">커뮤니티 글 작성</div>
		<!-- 페이지 타이틀 -->
	</div>
</div>
<!-- parallax END -->
<main>
<div class="comtyContainer">
	<form method="post" action="/comty/comtyWriteOk" id="comtyFrm">
		<ul>
			<h2 id="subject">제목</h2>
			<li><input type="text" name="comtySubject" id="comtySubject" /></li>
			<li><textarea name="comtyContent" id="comtyContent" style="min-height:400px;"></textarea></li>
			<li id="writeBTN">
				<button id="writeBtn">글 등록</button>
			</li>
		</ul>
	</form>
</div>
</main>