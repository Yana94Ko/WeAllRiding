<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="${url}/css/riding/ridingList.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d541fce355c305835dd7871d26048357&libraries=services,clusterer,drawing"></script>
<script>
	$(function() {
		$("#searchFrm").submit(function() {
			if ($("#searchWord").val() == "") {
				alert("검색어를 입력하세요");
				return false;
			}
		});
	});
</script>

<!-- parallax START -->
<div class="home">
	<div class="homeBackground parallaxWindow" data-parallax="scroll"
		data-image-src="${url}/images/home/home_background.png"></div>
	<!-- 배경 이미지 -->
	<div class="homeContent">
		<div class="homeTitle">라이딩 리스트</div>
		<!-- 페이지 타이틀 -->
	</div>
</div>
<!-- parallax END -->

<main>
	<div class="ridingListFrm" id="ridingListFrm">
		&nbsp;<h1>&nbsp;&nbsp;&nbsp;&nbsp;라이딩 리스트</h1>
		<c:set var="num" value="1" />
		<c:forEach var="vo" items="${lst }" varStatus="st">
			<textarea style="display:none" id="courseSendData${st.index}">${vo.courseSendData}</textarea>
			<a href="/riding/ridingView?ridingNo=${vo.ridingNo }"> <!-- 클릭 시 링크 설정 -->
			<div class="card">
				<!-- 카드 헤더 -->
				<div class="card-header">
					<div id="map${st.index}" style="height: 100%;"></div>
					
				</div>
				<!--  카드 바디 -->
				<div class="cord-flex">
					<div class="cord-flexBody">
						<div class="card-body-header">
							<div class="card-body-header-left">
								<h1>${vo.ridingSubject }</h1>
								<p class="card-body-hashtag">${vo.ridingKeyword }</p>
								<p class="card-body-nickname">${vo.nickname }</p>
							</div>
							<div class="card-body-header-right">
								<div class="card-header-is_closed">
									<div class="card-header-nNumbe">${vo.applicantCnt }/${vo.maxUser }</div>
								</div>
							</div>
						</div>
					</div>
						<div class="cord-flexFooter">
							<div class="cord-flexFooter2-1">
								<div class="cord-footer-hr">
									<hr	style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">
								</div>
								
								<div class="cord-flexFooter2-2">
									<div class="cord-footer-Hit">
										<i class="icon icon-view_count">${vo.ridingHit }</i> 
									</div>
									<div class="cord-footer-date">
										<i class="reg_date">${vo.ridingWriteDate } </i>
									</div>
								</div>
							</div>
							<%-- <i class="reg_date">${vo.ridingWriteDate } </i> --%>
						</div>	
					<%-- <div class="card-body">
						<p class="card-body-description">${ridingSubject }</p>
						<!--  카드 바디 헤더 -->
						<!--  카드 바디 본문 -->
						<!--  카드 바디 푸터 -->
					<div class="card-body-footer">
					</div>
					</div> --%>
			</div>
			
		</div>
			</a>
		<c:set var="num" value="${num + 1}" />
		</c:forEach>
		<c:if test="${userId != null && userId != ''}">
			<div id="ridingwriteBTN">
				<button id="ridingwriteBtn" onclick="location.href='/riding/ridingWrite' ">글 작성하기</button>
			</div>
		</c:if>
		<br>
		<!-- 페이징 -->
		<ul class="paging">
			<!--  이전페이지 -->
			<c:if test="${pVO.pageNum==1}">
				<li>prev</li>
			</c:if>
			<c:if test="${pVO.pageNum>1}">
				<li><a
					href="/riding/ridingList?pageNum=${pVO.pageNum-1}
					<c:if test='${pVO.searchWord != null}'>
						&searchKey=${pVO.searchKey }
						&searchWord=${pVO.searchWord }</c:if>">prev&nbsp;&nbsp;</a></li>
			</c:if>
			<!--  페이지 번호                 1,5      6,10         11,15-->
			<c:forEach var="p" begin="${pVO.startPage}"
				end="${pVO.startPage+pVO.onePageCount-1}">
				<!--  총 페이지수보다 출력할 페이지번호가 작을때 -->
				<c:if test="${p <= pVO.totalPage}">
					<c:if test="${p == pVO.pageNum}">
						<li class="active liTag">
					</c:if>
					<c:if test="${p != pVO.pageNum}">
						<li>
					</c:if>
					<a
						href="/riding/ridingList?pageNum=${p}
						<c:if test='${pVO.searchWord != null}'>
							&searchKey=${pVO.searchKey }
							&searchWord=${pVO.searchWord }
						</c:if>">
					${p}</a></li>
					</c:if>
			</c:forEach>
			<c:if test="${pVO.pageNum==pVO.totalPage}">
				<li>next</li>
			</c:if>
			<c:if test="${pVO.pageNum<pVO.totalPage}">
				<li><a
					href="/riding/ridingList?pageNum=${pVO.pageNum+1}
					<c:if test='${pVO.searchWord != null}'>
						&searchKey=${pVO.searchKey }
						&searchWord=${pVO.searchWord }</c:if>">&nbsp;&nbsp;next</a></li>
			</c:if>
		</ul>
		<!-- 검색 -->
		<div>
			<form method="get" action="/riding/ridingList" id="searchFrm">
				<div class="searcFlex">
					<select class="searchKey" name="searchKey" id="searchKey">
						<option value="ridingSubject">제목</option>
						<option value="ridingContent">글내용</option>
						<option value="nickname">글쓴이</option>
					</select> 
					<input class="serachBox" type="text" name="searchWord" id="searchWord">
					<button class="searchBtn" id="searchBtn">검색</button>
				</div>
			</form>
		</div>
	</div>	
	<script type="text/javascript" src="${url}/js/riding/ridingList.js"></script>
</main>