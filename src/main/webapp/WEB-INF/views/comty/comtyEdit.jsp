<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="${url}/css/comty/comtyEdit.css" rel="stylesheet" type="text/css">
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
<!-- parallax START -->
<div class="home">
	<div class="homeBackground parallaxWindow" data-parallax="scroll"
		data-image-src="${url}/images/home/home_background13.png"></div>
	<!-- 배경 이미지 -->
	<div class="homeContent">
		<div class="homeTitle">커뮤니티 글 수정</div>
		<!-- 페이지 타이틀 -->
	</div>
</div>
<!-- parallax END -->
<main>
<div class="container">
	<div class="containerWrap">
		<div class="comtyContainer">
			<form method="post" action="/comty/comtyEditOk" id="comtyFrm">
				<div class="flexDiv">
					<div class="flexTitle">
						<input type="hidden" name="comtyNo" value="${vo.comtyNo }"/>
						<h1>게시글 수정</h1>
					</div>
					<div class="flexSubject">
						<input type="text" name="comtySubject" id="comtySubject" value="${vo.comtySubject}" />
					</div>
					<div class="flexCont">
						<textarea name="comtyContent" id="comtyContent">${vo.comtyContent }</textarea>
					</div>
					<div>
						<div id="editBTN">
							<button class="flexBtn" id="editBtn">글 수정</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
</main>