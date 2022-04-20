<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="${url}/css/riding/myRiding.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
		<div class="homeTitle">나의 라이딩 목록</div>
		<!-- 페이지 타이틀 -->
	</div>
</div>
<!-- parallax END -->

<main>
<div class="myRidingContainer">
		<h1 style="margin:0 auto; padding:40px 0px;">마이라이딩</h1>
		<section id="myRidingFrm">

        <div class="tab">
            <button class="tablinks" onclick="openCity(event, 'member')" id="defaultOpen">참여 라이딩</button>
            <button class="tablinks" onclick="openCity(event, 'community')">마감 라이딩 및 후기</button>
            <button class="tablinks" onclick="openCity(event, 'course')">개설 라이딩</button>
        </div>
		
        <div id="member" class="tabcontent">
            <h3>참여 라이딩</h3>
            <table width="100%">
                <tr id="ridingTop">
                    <td>번호</td>
                    <td>라이딩 제목</td>
                    <td>개설자</td>
                    <td>조회수</td>
                    <td>시작일</td>
                    <td>종료일</td>
                </tr>
                <c:forEach items="${myRidingJoinList}" var="jl">
                    <tr>
                        <td>${jl.ridingNo}</td>
                        <td><a href="/riding/ridingView?ridingNo=${jl.ridingNo}">${jl.ridingSubject}</a></td>
                        <td>${jl.nickname}</td>
                        <td>${jl.ridingHit}</td>
                        <td>${jl.startDate}</td>
                        <td>${jl.endDate}</td>
                    </tr>
                </c:forEach>
            </table>
			<!-- 페이징 -->
			<ul class="paging">
				<!--  이전페이지 -->
				<c:if test="${pVO.pageNum==1}">
					<li>prev</li>
				</c:if>
				<c:if test="${pVO.pageNum>1}">
					<li><a
						href="/riding/myRidingList?pageNum=${pVO.pageNum-1}
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
							<li
								style="background-color: lightgray; height: 25px; border-radius: 6px;">
						</c:if>
						<c:if test="${p != pVO.pageNum}">
							<li>
						</c:if>
						<a
							href="/riding/myRidingList?pageNum=${p}
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
						href="/riding/myRidingList?pageNum=${pVO.pageNum+1}
						<c:if test='${pVO.searchWord != null}'>
							&searchKey=${pVO.searchKey }
							&searchWord=${pVO.searchWord }</c:if>">&nbsp;&nbsp;next</a></li>
				</c:if>
			</ul>
        </div>
        
        
        
        
        <div id="community" class="tabcontent">
            <h3>마감 라이딩 및 후기</h3>
            <table width="100%">
                <tr id="ridingTop">
                    <td>번호</td>
                    <td>라이딩 제목</td>
                    <td>개설자</td>
                    <td>조회수</td>
                    <td>시작일</td>
                    <td>종료일</td>
                </tr>
                <c:forEach items="${myRidingEndList }" var="end">
                    <tr>
                        <td>${end.ridingNo}</td>
                        <td><a href="/riding/ridingReview?ridingNo=${end.ridingNo}">${end.ridingSubject}</a></td>
                        <td>${end.nickname}</td>
                        <td>${end.ridingHit}</td>
                        <td>${end.startDate}</td>
                        <td>${end.endDate}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div id="course" class="tabcontent">
            <h3>개설 라이딩</h3>
			<table width="100%">
                <tr id="ridingTop">
                    <td>번호</td>
                    <td>라이딩 제목</td>
                    <td>개설자</td>
                    <td>조회수</td>
                    <td>시작일</td>
                    <td>종료일</td>
                </tr>
                <c:forEach items="${myRidingMadeList }" var="md">
                    <tr>
                        <td>${md.ridingNo}</td>
                        <td><a href="/riding/ridingView?ridingNo=${md.ridingNo}">${md.ridingSubject}</a></td>
                        <td>${md.nickname}</td>
                        <td>${md.ridingHit}</td>
                        <td>${md.startDate}</td>
                        <td>${md.endDate}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
 
    </section>
</div>
<script src="${url}/js/riding/myRidingList.js"></script>
</main>