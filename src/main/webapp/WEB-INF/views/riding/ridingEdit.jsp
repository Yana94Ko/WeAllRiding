<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="${url}/css/riding/ridingList.css" rel="stylesheet" type="text/css">
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
<script type="text/javascript">
	function ridingStateUpdate() {
		event.preventDefault();//form 기본 이벤트 제거
		if (confirm('승낙하시겠습니까? \n 승낙 후 취소는 어려우니 신중히 생각해주세요.')){
			location.href = "/riding/ridingStateOk?ridingNo=${vo.ridingNo}";
		}
	}	
	
</script>
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
         <h1 style="margin:0 auto; padding:40px;">라이딩 참가자</h1>
		<ul id="eList">
			<li id="eListFirst">번호</li>
			<li id="eListFirst">닉네임</li>
			<li id="eListFirst">성별</li>
			<li id="eListFirst">모임 횟수</li>
			<li id="eListFirst">유저 레벨</li>
			<li id="eListFirst">승낙/거절</li>
			<c:forEach var="vo" items="${lst2 }">
				<c:if test="${vo.ridingNo == vo.ridingNo}">
					<li>${vo.ridingMemberNo }</li>
					<li>${vo.nickname }</li>
					<li>${vo.gender }</li>
					<li>${vo.ridingCount }</li>
					<li>${vo.userScore }</li>
					<li><input type="button" id="ridingStateUpdateBtn" 
						 class="applicantSave" value="승낙하기">${vo.nickname }
						
						<a href="/riding/ridingStateOk">승낙하기</a></li>		
				</c:if>
			</c:forEach>
		</ul>
		<script>
			$(".applicantSave").on("click", function(event) {
				$('input[name=applicantNickName]').val($(this).parent().prev().prev().prev().prev().text());
			});
		</script>
         <form>
         	<input type="text" name="applicantNickName" >
         </form>
         <hr>
         <li id="ridingEditBTN">
          <input type="submit" id="ridingwriteBtn" value="글 수정"/>
         </li>
      </ul>
   </form>
</div>
</main>