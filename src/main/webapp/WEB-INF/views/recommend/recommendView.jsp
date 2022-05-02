<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="${url}/css/recommend/recommendStyle.css" />
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d541fce355c305835dd7871d26048357&libraries=services,clusterer,drawing"></script>
<!-- parallax START -->
<div class="home">
	<div class="homeBackground parallaxWindow" data-parallax="scroll"
		data-image-src="${url}/images/home/home_background5.png"></div>
	<!-- 배경 이미지 -->
	<div class="homeContent">
		<div class="homeTitle">추천 코스</div>
		<!-- 페이지 타이틀 -->
	</div>
</div>
<!-- parallax END -->

<main>
	<!-- 리스트 -->
<%-- 	<div id="record-no">게시글 수 : ${rPVO.totalRecord },
		${rPVO.pageNum}/${rPVO.totalPage}</div> --%>
	<div class="cardWrap">
		<c:forEach var="recommendVO" items="${list}" varStatus="st">
			<div class="card">
				<!-- 카드 헤더 -->
				<div class="cardHeader">
					<div id="map${st.index}" style="height: 100%;"></div>
				</div>

				<!--  카드 바디 -->
				<div class="cardBody">
					<!--  카드 바디 헤더(마우스 오버 전) -->
					<div class="cardBodyHeader">
						<!-- 카드 타이틀 -->
						<h1>${recommendVO.recTitle}</h1>
						<!-- 카드 해시태그 -->
						<p class="cardBodyHashtagSummary">${recommendVO.recHashtag}</p>
						<!-- 카드 설명 요약 -->
						<p class="cardBodySummary">${recommendVO.recDescription}</p>
					</div>

					<!-- 마우스 오버시 -->
					<div class="cardBodyDescription">
						<!-- 코스 설명 -->
						<div class="recDiv cardBodyHashtag">
							<p class="recTitle">키워드</p>
							<p class="recContent"style="color:#2478FF">${recommendVO.recHashtag}</p>
						</div>
						<!-- 코스 설명 -->
						<div class="recDiv recDescription">
							<p class="recTitle">코스 설명</p>
							<p class="recContent">${recommendVO.recDescription}</p>
						</div>
						<div class="recDiv recCourse">
							<p class="recTitle">출발지</p>
							<p class="recContent"><span id="startPoint${st.index}"></span></p>
						</div>
						<div class="recDiv recCourse">
							<p class="recTitle">도착지</p>
							<p class="recContent"><span id="endPoint${st.index}"></span></p>
						</div>
						<div class="recDiv recLevel">
							<p class="recTitle">난이도</p>
							<p class="recContent">${recommendVO.recLevel}</p>
						</div>
						<div class="multiRecDiv">
							<div class="multiRecItem">
								<p class="multiRecItemTitle">총 거리</p>
								<p class="multiRecItemContent"><span id="distance${st.index}"></span></p>
							</div>
							<div class="multiRecItem">
								<p class="multiRecItemTitle">소요 시간</p>
								<p class="multiRecItemContent"><span id="duration${st.index}"></span></p>
							</div>
						</div>
						<div class="multiRecDiv">
							<div class="multiRecItem">
								<p class="multiRecItemTitle">상승 고도</p>
								<p class="multiRecItemContent"><span id="ascent${st.index}"></p>
							</div>
							<div class="multiRecItem">
								<p class="multiRecItemTitle">하강 고도</p>
								<p class="multiRecItemContent"><span id="descent${st.index}"></span></p>
							</div>
						</div>
					</div>
					<!--  카드 바디 푸터 -->
					<div class="cardBodyFooter">
						<hr style="margin-bottom: 8px; opacity: 1; border-color: var(--color-theme-0)">
						<!-- 작성일 -->
						<div class="footerLeft">
							<i class="regDate">작성일 : ${recommendVO.recWritedate}</i>
						</div>
						<!-- 라이딩 개설 버튼 -->
						<div class="footerRight">
							<form  id="recommendSendDataFrm${st.index}" method="post" action="/riding/ridingWrite">
								<textarea style="display:none" name="CourseSendData" id="recommendSendData${st.index}">${recommendVO.recommendSendData}</textarea>
								<button type="button" onclick="document.getElementById('recommendSendDataFrm${st.index}').submit();" class="btn">라이딩 개설</button>
							</form>
						</div>

						<!-- 조회수, 댓글 -->
						<!-- <i class="icon iconViewCount"></i>조회 38회 
						<i class="icon iconCommentsCount"></i>댓글 4개 
						 -->
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	
	<div class="pagingDiv">
		<ul class="paging">
			<!--  이전페이지 -->
			<c:if test="${rPVO.pageNum==1}">
				<li>Prev</li>
			</c:if>
			<c:if test="${rPVO.pageNum>1}">
				<li><a href="${url}/recommendView?pageNum=${rPVO.pageNum-1}<c:if test='${rPVO.searchWord != null}'>&searchKey=${rPVO.searchKey }&searchWord=${rPVO.searchWord }</c:if>">Prev</a></li>
			</c:if>
			<!--  페이지 번호                 1,5      6,10         11,15-->
			<c:forEach var="p" begin="${rPVO.startPage}"
				end="${rPVO.startPage+rPVO.onePageCount-1}">
				<!--  총 페이지수보다 출력할 페이지번호가 작을때 -->
				<c:if test="${p <= rPVO.totalPage}">
					<c:if test="${p == rPVO.pageNum}">
						<li class="active liTag">
					</c:if>

					<c:if test="${p != rPVO.pageNum}">
						<li class="liTag">
						<a class="aTag" href="${url}/recommendView?pageNum=${p}<c:if test='${rPVO.searchWord != null}'>&searchKey=${rPVO.searchKey }&searchWord=${rPVO.searchWord }</c:if>">${p}
					</c:if>
					<c:if test="${p == rPVO.pageNum}">
						<a class="active aTag"
						   href="${url}/recommendView?pageNum=${p}<c:if test='${rPVO.searchWord != null}'>&searchKey=${rPVO.searchKey }&searchWord=${rPVO.searchWord }</c:if>">${p}
					</c:if>
					</a>
					</li>
				</c:if>
			</c:forEach>
			<c:if test="${pVO.pageNum==rPVO.totalPage}">
				<li>Next</li>
			</c:if>
			<c:if test="${rPVO.pageNum<rPVO.totalPage}">
				<li><a
					href="${url}/recommendView?pageNum=${rPVO.pageNum+1}<c:if test='${rPVO.searchWord != null}'>&searchKey=${rPVO.searchKey }&searchWord=${rPVO.searchWord }</c:if>">Next</a></li>
			</c:if>
		</ul>
	</div>
	<script type="text/javascript" src="${url}/js/recommend/recommendViewScript.js"></script>

	<!-- Bootstrap core JavaScript-->
	<script src="${url}/css/admin/vendor/jquery/jquery.min.js"></script>
</main>