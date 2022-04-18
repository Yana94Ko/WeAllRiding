<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="${url}/css/riding/ridingList.css" rel="stylesheet" type="text/css">
<script src="https://cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>
<script type="text/javascript">
</script>

<main>
	<div class="ridingViewContainer">
		<form method='post' action="riding/ridingReviewOk" id="ridingReviewFrm">
			<ul>
				<h1 id="ridingViewTitle">라이딩 후기</h1>
				<br>
				<br>
				<h2 id="ridingViewTitle"><input type="hidden" name="ridingSubject" value="${vo.ridingSubject }">${vo.ridingSubject }</h2>
				
				<br>
				<ul>
					<li id="ridingViewFrm">글 번호 : ${vo.ridingNo }&nbsp;&nbsp;&nbsp;&nbsp;
						작성자 : ${vo.nickname }&nbsp;&nbsp;&nbsp;&nbsp; 작성일 :
						${vo.ridingWriteDate }&nbsp;&nbsp;&nbsp;&nbsp; 조회수 :
						${vo.ridingHit }&nbsp;&nbsp;&nbsp;</li>
				</ul>
				<br>
				<h2 id="ridingViewTitle">키워드</h2>
				<li style="color: black;">${vo.ridingKeyword }</li>
				<br>

				<li id="dateAll" style="color: black;">
					<h2 id="ridingViewTitle">일정</h2> 
					<input type="hidden" name="startDate" value="${vo.startDate }">${vo.startDate } - 
					<input type="hidden" name="endDate" value="${vo.endDate }">${vo.endDate }
				</li>

				<li id=courseLevel style="color: black">
					<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;난이도</h2>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${vo.courseLevel }
				</li>

				
				
				<br><br><br><br>
				<h2 id="ridingViewTitle">내용</h2>
				<li style="color: black;">${vo.ridingContent }</li>
				<hr>
				
				<h1 style="margin:0 auto; padding:20px 0px;">라이딩 참가자</h1>
				<c:forEach var="vo" items="${lst2 }">
					<div id="reviewTextImg">
						<input type="text" value="${vo.nickname }" id="reviewListText"/>
						<img src="../../images/웃는이모티콘.png" id="reviewImg">
						<img src="../../images/우는이모티콘.png" id="reviewImg">
					</div>
				</c:forEach>		
		
			</ul>
			<br><br><br>
			<h3 style="font-size:1.2em;">라이딩 후기</h3> <br>
			<li><input type="text" name="ridingReviewComent" id="ridingReviewComent" placeholder="라이딩에 대한 후기를 남겨주세요."></input></li>
	         <br>
	         <li id="ridingwriteBTN">
            <button id="ridingwriteBtn">후기 등록</button>
		</form>
		
         </li>
		
	</div>
	<br><br><br>
</main>