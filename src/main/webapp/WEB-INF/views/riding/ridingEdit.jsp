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
   <form>
      <ul>
         <h1 id="ridingViewTitle">라이딩 뷰</h1><br><br>
         <h2 id="ridingViewTitle">${vo.ridingSubject }</h2><br>
         <ul>
			<li id="ridingViewFrm">글 번호 : ${vo.ridingNo }&nbsp;&nbsp;&nbsp;&nbsp;
				작성자 : ${vo.nickname }&nbsp;&nbsp;&nbsp;&nbsp; 작성일 :
				${vo.ridingWriteDate }&nbsp;&nbsp;&nbsp;&nbsp; 조회수 : ${vo.ridingHit }&nbsp;&nbsp;&nbsp;
			</li>
		</ul><br>
         <h2 id="ridingViewTitle">키워드</h2>
         <li style="color: black;">${vo.ridingKeyword }</li><br>
         
         <h2 id="ridingViewTitle">코스</h2>
         <li style="height:400px; color:black;">코스가 나올 공간입니다.</li>
         
         <li id="dateAll" style="color:black;">
         <h2 id="ridingViewTitle">일정</h2>
    	 ${vo.startDate } - <input type="date" name="endDate" id="endDate" value="${vo.endDate }">
         </li>
         
         <li id=courseLevel style="color:black">
         <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;난이도</h2>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${vo.courseLevel }
         </li>
         
         <li id="maxUser" style="color:black">
         <h2>참가인원</h2>
         ${vo.maxUser }
         </li>
         <br><br><br><br>
         <h2 id="ridingViewTitle">내용</h2>
         <li><textarea name="ridingContent" id="ridingContent" style="min-height:400px; width: 100%;">${vo.ridingContent }</textarea></li>
         <hr>
         <li id="ridingViewBTN">
            <button id="ridingwriteBtn">글 수정</button>
            <button id="ridingViewDelBtn" onclick="javascript:ridingViewDel()">글 삭제</button>
			<button id="ridingViewEditBtn" onclick="javascript:ridingViewEdit()">글 수정</button>
			
         </li>
      </ul>
   </form>
</div>
</main>