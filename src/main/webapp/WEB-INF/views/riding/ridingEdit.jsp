<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="${url}/css/riding/ridingEdit.css" rel="stylesheet" type="text/css">
<style>



#ridingFrm li {
	margin: 0px;
	padding: 10px 5px;
}
</style>
<script src="https://cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>
<!-- parallax START -->
<div class="home">
	<div class="homeBackground parallaxWindow" data-parallax="scroll"
		data-image-src="${url}/images/home/home_background.png"></div>
	<!-- 배경 이미지 -->
	<div class="homeContent">
		<div class="homeTitle">라이딩 수정 하기</div>
		<!-- 페이지 타이틀 -->
	</div>
</div>
<!-- parallax END -->
<main>
<div class="container">
	<div class="containerWrap">
		<div class="ridingEditContainer">
			<input type="hidden" id="dbCourseLevelsel" value=${vo.courseLevel}/>
			<input type="hidden" id="dbMaxUsersel" value=${vo.maxUser}>
			<form method="post"
				action="/riding/ridingEditOk?ridingNo=${vo.ridingNo}">
				<ul>
					<h1 id="ridingViewTitle"></h1><br><br>
					<div id="ridingBody">
					<div id="listTitle">제목</div>
					<li>
						<input type="text" name="ridingSubject" id="ridingSubject"
							value="${vo.ridingSubject }" />
					</li>
					<br>
					
					<div id="listTitle">키워드</div>
					<li>
						<input type="text" name="ridingKeyword" id="ridingKeyword"
							value="${vo.ridingKeyword }"></input>
					</li>
					<br>
					<div id="date_Level_User">
						<li id="dateAll">
						<div>
						<div id="listTitle">일정</div>
							<div id="dateSet">
								<input type="date"
									name="startDate" id="startDate" value="${vo.startDate }">   -  
								<input type="date" name="endDate" id="endDate"
									value="${vo.endDate }">
							</div>
						</div>
							
						</li>
						<div id="level_UserSet">
							<div id="levelSet">
								<li id=courseLevel style="color: black">
									<div id="listTitle">난이도</div>
									<select id="courseLevelsel" name="courseLevel"
										class="courseLevelsel">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
									</select>
								</li>
							</div>
							<div id="maxUserSet">
								<li id="maxUser" style="color: black">
									<div id="listTitle">참가인원</div>
									<select id="maxUsersel" name="maxUsersel"
										class="maxUsersel">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
									</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</li>
							</div>
						</div>
					</div>
					<br><br><br><br>
					
					<div id="listTitle">내용</div>
					<li>
						<textarea name="ridingContent" id="ridingContent"
							style="min-height: 400px; width: 100%;">${vo.ridingContent }
						</textarea>
					</li><br><br>
					
					<li id="ridingViewBtn" class="ridingEditBtn">
						<input type="submit" id="ridingwriteBtn" class="ridingEditBtn" value="글 수정" />
					</li>
					</div>
				</ul>
			</form>
		</div>
	</div>
</div>
	<script type="text/javascript" src="${url}/js/riding/ridingEdit.js"></script>
</main>