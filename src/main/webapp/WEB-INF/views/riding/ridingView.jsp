<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
<!-- <link href="${url}/css/riding/ridingList.css" rel="stylesheet" type="text/css"> -->
<link href="${url}/css/riding/ridingView.css" rel="stylesheet" type="text/css">
<script src="https://cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>
</script>
<!-- parallax START -->
<div class="home">
	<div class="homeBackground parallaxWindow" data-parallax="scroll"
		data-image-src="${url}/images/home/home_background.png"></div>
	<!-- 배경 이미지 -->
	<div class="homeContent">
		<div class="homeTitle">라이딩 목록</div>
		<!-- 페이지 타이틀 -->
	</div>
</div>
<!-- parallax END -->
<main>
<div class="container">
	<div class="containerWrap">
		<div class="ridingViewContainer">
			<form method='post'>
				<textarea style="display:none" id="courseSendData"name="courseSendData">${vo.courseSendData}</textarea>
				<input type="hidden" name="applicantCnt" value="${vo.applicantCnt }"/>
				<ul>
					<div id="ridingViewTitle" style="display:none;">라이딩 뷰${resolveStatus}</div>
					<br><br>
					<h2 id="riding_header"></h2>
					<div id="titleHeader"><input type="hidden" name="ridingSubject" value="${vo.ridingSubject }">${vo.ridingSubject }</div>
					<ul>
						<li id="ridingViewFrm"><div>
							글 번호 : ${vo.ridingNo }
							<input type="hidden" value=${vo.ridingNo} id="dbRidingNo"/>
							<input type="hidden" value=${resolveStatus} id="resolveStatus"/>&nbsp;&nbsp;&nbsp;&nbsp;
							작성자 : ${vo.nickname }&nbsp;&nbsp;&nbsp;&nbsp; 
							작성일 : ${vo.ridingWriteDate }&nbsp;&nbsp;&nbsp;&nbsp; 
							조회수 : ${vo.ridingHit }&nbsp;&nbsp;&nbsp;
						</div></li>
					</ul>
					<br>
					<div id="ridingBody">
						<div id="ridingMap">
							<li style="height: 800px;"><script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d541fce355c305835dd7871d26048357&libraries=services,clusterer,drawing"></script>
								<div id="map" ></div>
								<div id="mapBox">
									<h4>코스 정보</h4> 
									<span>경유지 정보 : </span></span>
									<span id="startPoint"></span>&nbsp;-&nbsp;
									<span id="waypoint"></span>
									<span id="endPoint"></span> 
									<span id="distance"></span><br /> 
									<span id="duration"></span><br /> 
									<span id="ascent"></span>
									<span id="descent"></span>
									<canvas id="myChart" width="1060" height="150"></canvas>
								</div>
							</li>
						</div><br><br>
						
						<div id="ridingData">
							<ul id="ridingDate_Level">
								<li id="dateAll" style="color: black;">
									<div>일정 : 
									<input type="hidden" name="startDate" value="${vo.startDate }">${vo.startDate } - 
									<input type="hidden" name="endDate" value="${vo.endDate }">${vo.endDate }
									</div> 
								</li>
								<li>
									<div>난이도 : ${vo.courseLevel }</div>
								</li>
							</ul>
							<ul>
								<li id="ridingConten">
									<div>${vo.ridingContent }</div>
								</li>
							</ul>
						</div>
						<br>
						<div id="keyword">
							<li id="keywordSubject">${vo.ridingKeyword }</li>
						</div>
					</div>
					<div id="ridingDiv"></div>
					<div id="ridingViewBtn">
						<c:if test="${nickName == vo.nickname }">
							<li>
								<input class="btnDel" type="button" id="ridingViewDelBtn" 
									onclick="ridingViewDel()" value="글 삭제" /> 
								<input class="btnEdit" type="button" id="ridingViewEditBtn" 
									onclick="ridingViewEdit()" value="글 수정" />
							</li>
						</c:if>
					</div>
					<div id="listHeader">
						<div id="listTitle">라이딩 참가자</div>
						<c:if test="${nickName == vo.nickname }">
							<ul id="eList">
								<li id="eListFirst">번호</li>
								<li id="eListFirst">닉네임</li>
								<li id="eListFirst">성별</li>
								<li id="eListFirst">모임 횟수</li>
								<li id="eListFirst">유저 레벨</li>
								<li id="eListFirst">승낙/거절</li>
								<c:forEach var="vo" items="${lst2 }"  varStatus="st">
									<c:if test="${vo.ridingNo == vo.ridingNo}">
										<li><span id = "forWriterRidingState${st.index}"></</span>
										<input type="hidden" id = "dbForWriterRidingState${st.index}" value="${vo.ridingState}"/></li>
										<li>${vo.nickname }</li>
										<li>${vo.gender }</li>
										<li>${vo.ridingCount }</li>
										<li>${vo.userScore }</li>
											<li>
												<input type='button' id="ridingStateUpdateBtn" class="applicantSave" value="승낙">
										 		<input type='button' id="ridingStateDeleteBtn" class="applicantDel" value="거절">
										 	</li> 
									</c:if>
								</c:forEach>
							</ul>
						</c:if>
						<c:if test="${nickName != vo.nickname }">
							<ul id="vList">
								<li id="vListFirst">참가 상태</li>
								<li id="vListFirst">닉네임</li>
								<li id="vListFirst">성별</li>
								<li id="vListFirst">모임 횟수</li>
								<li id="vListFirst">유저 레벨</li>
								<c:forEach var="vo" items="${lst2 }" varStatus="st">
									<c:if test="${vo.ridingNo == vo.ridingNo}">
										<li><span id = "ridingState${st.index}"></</span><input type="hidden" id = "dbRidingState${st.index}" value="${vo.ridingState}"/></li>
										<li>${vo.nickname }</li>
										<li>${vo.gender }</li>
										<li>${vo.ridingCount }</li>
										<li>${vo.userScore }</li>
									</c:if>
								</c:forEach>
							</ul>
						</c:if>
					
						<form id="nicknameTest">
							<input type="text" name="applicantNickName" id="applicantNickName" style="display:none;">
						</form>
						<div id="ridingViewMemnerBtn">
							<c:if test="${nickName != vo.nickname }">
								<li>
									<input type="button" id="ridingMemberBtn" onclick="ridingMember()" value="라이딩 신청하기"/>
									<input type="button" id="ridingdelBtn" onclick="ridingMemberCancel()" value="라이딩 신청취소"/>
								</li>
							</c:if>
						</div><br><br>
					
					<%-- <c:if test="${userId == vo.nickname }">
						<div id="viewBTN">
							<button type="button" id="delBtn" onclick="javascript:ridingViewDel()">글 삭제</button>
							<button type="button" id="editBtn" onclick="javascript:ridingViewEdit()">글 수정</button>
						</div>
					</c:if> --%>
					
						<c:if test="${vo.endDate < today }">
							<div id="listTitle">라이딩 후기</div><hr>
							<div id="ridingReviewList"></div>
						</c:if>
					</div>
				</ul>
			</form>
			<br>
			<div id="listHeader">
				<!-- 댓글 쓰기 폼 -->
				<c:if test="${logStatus=='Y' }">
					<form method='post'>
						<input type="hidden" name="ridingNo" value="${vo.ridingNo }" />
						<textarea name="ridingReplyComent"
							style="width: 100%; height: 100px;"></textarea><br> 
						<input id="ridingReplyBtn" type="button" value="댓글등록" id="replyBtn" onclick="ridingReplyFrm()">
					</form>
				</c:if>
				<!-- 댓글목록이 나올 자리 -->
				<div id="ridingReplyList"></div>
			</div>
		</div>
	</div>
</div>
	<script type="text/javascript" src="${url}/js/riding/ridingView.js"></script>
</main>