<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="${url}/css/riding/ridingList.css" rel="stylesheet" type="text/css">
<main>
	<div class="ridinglist">
		<h1>라이딩 리스트</h1>
		<c:forEach var="vo" items="${lst }">
			<a href="/riding/ridingView?ridingNo=${vo.ridingNo }"> <!-- 클릭 시 링크 설정 -->
			<div class="card">
				<!-- 카드 헤더 -->
				<div class="card-header">
					<div class="card-header-is_closed">
						<div class="card-header-nNumbe">${applyUser }/${maxUser }</div>
					</div>
				</div>
				<!--  카드 바디 -->
				<div class="card-body">
					<!--  카드 바디 헤더 -->
					<div class="card-body-header">
						<h1>${ridingSubject }</h1>
						<p class="card-body-hashtag">#여수 #순천 #광양</p>
						<p class="card-body-nickname">${nickname }</p>
					</div>
					<%-- <p class="card-body-description">${ridingSubject }</p> --%>
					<!--  카드 바디 본문 -->
					<!--  카드 바디 푸터 -->
					<div class="card-body-footer">
						<hr	style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">
						<i class="icon icon-view_count">${ridingHit }</i> 
						<i class="reg_date">${ridingWriteDate } </i>
					</div>
				</div>
			</div>
			</a>
		</c:forEach>
	</div>
</main>