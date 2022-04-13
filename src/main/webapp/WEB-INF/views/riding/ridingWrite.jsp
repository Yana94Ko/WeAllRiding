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
	
</script>
<main>

<div class="ridingContainer">
	<form method="post" action="/riding/ridingWriteOk" id="ridingFrm">
		<ul>
			<h1>라이딩 개설</h1>
			<h2>제목</h2>
			<li><input type="text" name="ridingTitle" id="ridingTitle" /></li>
			<h2>키워드</h2>
			<li><input type="text" name="ridingKeyword" id="ridingKeyword" /></li>
			
			<li>
			<h2>일정</h2>
			<input type="date" name="startDate" id="startDate"> - <input type="date" name="endDate" id="endDate">
			</li>
			<li>
			<h2>참가인원</h2>
			<select id="userTel1" name="userTel1" class="userTel1">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
			</select>
			</li>
			<li>
			<h2>난이도</h2>
			<select id="userTel1" name="userTel1" class="userTel1">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
			</select>
			</li>
			
			<h2>내용</h2>
			<li><textarea name="ridingContent" id="ridingContent" style="min-height:400px; width: 100%;"></textarea></li>
			
			<li id="ridingwriteBTN">
				<button id="ridingwriteBtn">글 등록</button>
			</li>
		</ul>
	</form>
</div>
</main>