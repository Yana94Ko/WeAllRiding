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
<main>
<div class="ridingViewContainer">
   <form method="post" action="/riding/ridingEditOk?ridingNo=${vo.ridingNo}">
      <ul>
         <h1 id="ridingViewTitle"></h1><br><br>
         <h2>제목</h2>
         <li><input type="text" name="ridingSubject" id="ridingSubject"  value="${vo.ridingSubject }" /></li><br>
         <h2>키워드</h2>
         <li><input type="text" name="ridingKeyword" id="ridingKeyword" value="${vo.ridingKeyword }"></input></li><br>
         <br>
         <h2 id="ridingViewTitle">키워드</h2>
         <li style="color: black;">${vo.ridingKeyword }</li><br>
         
         <h2 id="ridingViewTitle">코스</h2>
         <li style="height:400px; color:black;">코스가 나올 공간입니다.</li>
         
         <li id="dateAll" style="color:black;">
         <h2 id="ridingViewTitle">일정</h2>
    	 <input type="date" name="startDate" id="startDate" value="${vo.startDate }" > - <input type="date" name="endDate" id="endDate" value="${vo.endDate }">
         </li>
         
         <%-- <li id=courseLevel style="color:black">
         <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;난이도</h2>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${vo.courseLevel }
         </li>
         
         <li id="maxUser" style="color:black">
         <h2>참가인원</h2>
         ${vo.maxUser } 
         </li>
         <br><br><br><br>--%>
         <li id=courseLevel style="color:black">
         <h2>난이도</h2>
         <select id="courseLevelsel" name="courseLevel" class="courseLevelsel" value="${vo.courseLevel }">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
         </select>
         </li>
         
         <li id="maxUser" style="color:black">
         <h2>참가인원</h2>
         <select id="maxUsersel" name="maxUsersel" class="maxUsersel">
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
         <h2 id="ridingViewTitle">내용</h2>
         <li><textarea name="ridingContent" id="ridingContent" style="min-height:400px; width: 100%;">${vo.ridingContent }</textarea></li>
         <hr>
         <li id="ridingEditBTN">
          <input type="submit" id="ridingwriteBtn" value="글 수정"/>
         </li>
      </ul>
   </form>
</div>
</main>