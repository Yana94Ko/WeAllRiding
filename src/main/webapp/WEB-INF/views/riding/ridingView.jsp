<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="${url}/css/riding/ridingList.css" rel="stylesheet" type="text/css">
<script src="https://cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>
<script type="text/javascript">
	$(function() {
		$("#ridingStartFrm").submit(function() {
			if (${vo.nickname} == '' && ${vo.nickname} == null) {
				alert("로그인 후 이용해주세요");
				return false;
			}			
		});
	});
</script>
<main>

<div class="ridingContainer">
   <form method="post" action="/riding/ridingStartOk" id="ridingStartFrm">
      <ul>
         <h1 style="font-size: 1.5em;">라이딩 뷰</h1><br><br>
         <h2 style="font-size: 1.3em;">${vo.ridingSubject }</h2><br>
         <h2>키워드</h2>
         <li style="color: black;">${vo.ridingKeyword }</li><br>
         
         <h2>코스</h2>
         <li style="height:400px; color:black;">코스가 나올 공간입니다.</li>
         
         <li id="dateAll" style="color:black;">
         <h2>일정</h2>
    	 ${vo.startDate } - <input type="date" name="endDate" id="endDate" value="${vo.endDate }" readonly>
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
         <h2>내용</h2>
         <li><textarea name="ridingContent" id="ridingContent" style="min-height:400px; width: 100%;" readonly>${vo.ridingContent }</textarea></li>
         
       
         <br><br><br><br>
         <li id="ridingStartBTN">
            <button id="ridingStartBtn">라이딩 신청하기</button>
         </li>
      </ul>
   </form>
</div>
</main>