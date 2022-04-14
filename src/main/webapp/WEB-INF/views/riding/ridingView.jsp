<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="${url}/css/riding/ridingList.css" rel="stylesheet" type="text/css">
<script src="https://cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>
<script type="text/javascript">
	function input(){
		const sDate = document.querySelector("#startDate").value;
	}

	function ridingViewDel() {
		console.log(${vo.ridingNo})
		if (confirm('글을 삭제시겠습니까?')) {
			location.href = "/riding/ridingDel?ridingNo=${vo.ridingNo}";
		}
	}
	function ridingViewEdit() {
		console.log(${vo.ridingNo})
		if (confirm('글을 수정하시겠습니까?')) {
			location.href = "/riding/ridingEdit?ridingNo=${vo.ridingNo}";
		}
	}
</script>
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
    	 ${vo.startDate } - ${vo.endDate }
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
      	 <li style="color:black;">${vo.ridingContent }</li>
         <hr>
         <c:if test="${userId == vo.nickname }">
         	<li id="ridingViewBTN">
	            <!-- <button id="ridingwriteBtn">글 수정</button> -->
	            <input type="button" id="ridingViewDelBtn" onclick="ridingViewDel()" value="글 삭제"/>
				<input type="button" id="ridingViewEditBtn" onclick="ridingViewEdit()" value="글 수정"/>
			
         	</li>
         </c:if>
      </ul>
   </form>
</div>
</main>