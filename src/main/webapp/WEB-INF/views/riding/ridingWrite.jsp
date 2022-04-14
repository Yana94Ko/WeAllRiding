<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="${url}/css/riding/ridingList.css" rel="stylesheet" type="text/css">
<script src="https://cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>
<script type="text/javascript">
	$(function() {
		$("#ridingFrm").submit(function() {
			if ($("#ridingSubject").val() == '') {
				alert("글 제목을 입력하세요");
				return false;
			}
			if ($("#ridingContent").val() == '') {
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
         <h1 style="font-size: 1.3em;">라이딩 개설</h1><br><br>
         <h2>제목</h2>
         <li><input type="text" name="ridingSubject" id="ridingSubject" /></li><br>
         <h2>키워드</h2>
         <li><input type="text" name="ridingKeyword" id="ridingKeyword" placeholder="ex)  #순천  #광양"/></li><br>
         
         <h2>코스</h2>
         <li>
        	<button id="bestCourseBtn">추천 코스</button>
         	<button id="newCourseBtn">코스 생성하기</button>
         </li>
         <li style="height:400px;">코스가 나올 공간입니다.</li>
         
         <li id="dateAll">
         <h2>일정</h2>
         <input type="date" name="startDate" id="startDate"> - <input type="date" name="endDate" id="endDate">
         </li>
         
         <li id=courseLevel>
         <h2>난이도</h2>
         <select id="courseLevel" name="courseLevel" class="courseLevel">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
         </select>
         </li>
         
         <li id="maxUser">
         <h2>참가인원</h2>
         <select id="maxUser" name="maxUser" class="maxUser">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
         </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         </li>
         <br><br><br><br>
         <h2>내용</h2>
         <li><input type="text" name="ridingContent" id="ridingContent" style="min-height:400px; width: 100%;"></input></li>
         
         <li id="ridingwriteBTN">
            <button id="ridingwriteBtn">글 등록</button>
         </li>
      </ul>
   </form>
</div>
</main>