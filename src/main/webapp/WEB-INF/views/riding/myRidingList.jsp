<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="${url}/css/riding/myRiding.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

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
	<div class="container">
		<div class="containerWrap">
			<div class="myRidingContainer">

				<section id="myRidingFrm">

					<div class="tab">
						<button class="tablinks" onclick="openCity(event, 'member')"
								id="defaultOpen">참여 라이딩</button>
						<button class="tablinks" onclick="openCity(event, 'community')">마감
							라이딩 및 후기</button>
						<button class="tablinks" onclick="openCity(event, 'course')">개설
							라이딩</button>
					</div>

					<div id="member" class="tabcontent">
						<h3>참여 라이딩</h3>
						총 레코드 수 : ${pVO1.totalRecord1 } / 총 페이지 수 : ${pVO1.totalPage1 }<br><br>
						<table width="100%">
							<tr id="ridingTop">
								<td class="tableNo">번호</td>
								<td class="tableTitle">라이딩 제목</td>
								<td class="tableWriter">개설자</td>
								<td class="tableHit">조회수</td>
								<td class="tableStartDate">시작일</td>
								<td class="tableEndDate">종료일</td>
							</tr>
							<c:forEach items="${myRidingJoinList}" var="jl">
								<tr>
									<td class="tableNo">${jl.ridingNo}</td>
									<td class="tableTitle"><a href="/riding/ridingView?ridingNo=${jl.ridingNo}">${jl.ridingSubject}</a></td>
									<td class="tableWriter">${jl.nickname}</td>
									<td class="tableHit">${jl.ridingHit}</td>
									<td class="tableStartDate">${jl.startDate}</td>
									<td class="tableEndDate">${jl.endDate}</td>
								</tr>
							</c:forEach>
						</table>
						<!-- 페이징 -->
						<ul class="paging">
							<!--  이전페이지 -->
							<c:if test="${pVO1.pageNum==1}">
								<li>prev</li>
							</c:if>
							<c:if test="${pVO1.pageNum>1}">
								<li><a
										href="/riding/myRidingList?pageNum=${pVO1.pageNum-1}
								<c:if test='${pVO1.searchWord != null}'>
									&searchKey=${pVO1.searchKey }
									&searchWord=${pVO1.searchWord }</c:if>">prev&nbsp;&nbsp;</a></li>
							</c:if>
							<!--  페이지 번호                 1,5      6,10         11,15-->
							<c:forEach var="p" begin="${pVO1.startPage}"
									   end="${pVO1.startPage+pVO1.onePageCount-1}" >
								<!--  총 페이지수보다 출력할 페이지번호가 작을때 -->
								<c:if test="${p <= pVO1.totalPage1}">
									<c:if test="${p == pVO1.pageNum}">
										<li
										style="background-color: lightgray; height: 25px; border-radius: 6px;">
									</c:if>
									<c:if test="${p != pVO1.pageNum}">
										<li>
									</c:if>
									<a
											href="/riding/myRidingList?pageNum=${p}
									<c:if test='${pVO1.searchWord != null}'>
										&searchKey=${pVO1.searchKey }
										&searchWord=${pVO1.searchWord }
									</c:if>">
											${p}</a>
									</li>
								</c:if>
							</c:forEach>
							<c:if test="${pVO1.pageNum==pVO1.totalPage1}">
								<li>next</li>
							</c:if>
							<c:if test="${pVO1.pageNum<pVO1.totalPage1}">
								<li><a
										href="/riding/myRidingList?pageNum=${pVO1.pageNum+1}
								<c:if test='${pVO1.searchWord != null}'>
									&searchKey=${pVO1.searchKey }
									&searchWord=${pVO1.searchWord }</c:if>">&nbsp;&nbsp;next</a></li>
							</c:if>
						</ul>
						<!-- 검색 -->
						<div>
							<form method="get" action="/riding/myRidingList" id="searchFrm">
								<select name="searchKey" id="searchKey">
									<option value="ridingSubject">제목</option>
									<option value="nickname">글쓴이</option>
									<option value="startDate">여정 시작일</option>
								</select> <input type="text" name="searchWord" id="searchWord">
								<button id="searchBtn" class="searchBtn">검색</button>
							</form>
						</div>
					</div>

					<div id="community" class="tabcontent">
						<h3>마감 라이딩 및 후기</h3>
						총 레코드 수 : ${pVO2.totalRecord2 } / 총 페이지 수 : ${pVO2.totalPage2 }<br><br>
						<table width="100%">
							<tr id="ridingTop">
								<td class="tableNo">번호</td>
								<td class="tableTitle">라이딩 제목</td>
								<td class="tableWriter">개설자</td>
								<td class="tableHit">조회수</td>
								<td class="tableStartDate">시작일</td>
								<td class="tableEndDate">종료일</td>
							</tr>
							<c:forEach items="${myRidingEndList }" var="end">
								<tr>
									<td class="tableNo">${end.ridingNo}</td>
									<td class="tableTitle"><a
											href="/riding/ridingReview?ridingNo=${end.ridingNo}">${end.ridingSubject}</a></td>
									<td class="tableWriter">${end.nickname}</td>
									<td class="tableHit">${end.ridingHit}</td>
									<td class="tableStartDate">${end.startDate}</td>
									<td class="tableEndDate">${end.endDate}</td>
								</tr>
							</c:forEach>
						</table>
						<!-- 페이징 -->
						<ul class="paging">
							<!--  이전페이지 -->
							<c:if test="${pVO2.pageNum==1}">
								<li>prev</li>
							</c:if>
							<c:if test="${pVO2.pageNum>1}">
								<li><a
										href="/riding/myRidingList?pageNum=${pVO2.pageNum-1}
								<c:if test='${pVO2.searchWord != null}'>
									&searchKey=${pVO2.searchKey }
									&searchWord=${pVO2.searchWord }</c:if>">prev&nbsp;&nbsp;</a></li>
							</c:if>
							<!--  페이지 번호                 1,5      6,10         11,15-->
							<c:forEach var="p" begin="${pVO2.startPage}"
									   end="${pVO2.startPage+pVO2.onePageCount-1}">
								<!--  총 페이지수보다 출력할 페이지번호가 작을때 -->
								<c:if test="${p <= pVO2.totalPage2}">
									<c:if test="${p == pVO2.pageNum}">
										<li
										style="background-color: lightgray; height: 25px; border-radius: 6px;">
									</c:if>
									<c:if test="${p != pVO2.pageNum}">
										<li>
									</c:if>
									<a
											href="/riding/myRidingList?pageNum=${p}
									<c:if test='${pVO2.searchWord != null}'>
										&searchKey=${pVO2.searchKey }
										&searchWord=${pVO2.searchWord }
									</c:if>">
											${p}</a>
									</li>
								</c:if>
							</c:forEach>
							<c:if test="${pVO2.pageNum==pVO2.totalPage2}">
								<li>next</li>
							</c:if>
							<c:if test="${pVO2.pageNum<pVO2.totalPage2}">
								<li><a
										href="/riding/myRidingList?pageNum=${pVO2.pageNum+1}
								<c:if test='${pVO2.searchWord != null}'>
									&searchKey=${pVO2.searchKey }
									&searchWord=${pVO2.searchWord }</c:if>">&nbsp;&nbsp;next</a></li>
							</c:if>
						</ul>
						<!-- 검색 -->
						<div>
							<form method="get" action="/riding/myRidingList" id="searchFrm">
								<select name="searchKey" id="searchKey">
									<option value="ridingSubject">제목</option>
									<option value="nickname">글쓴이</option>
									<option value="startDate">여정 시작일</option>
								</select> <input type="text" name="searchWord" id="searchWord">
								<button id="searchBtn" class="searchBtn">검색</button>
							</form>
						</div>
					</div>
					<div id="course" class="tabcontent">
						<h3>개설 라이딩</h3>
						총 레코드 수 : ${pVO3.totalRecord3 } / 총 페이지 수 : ${pVO3.totalPage3 }<br><br>
						<table width="100%">
							<tr id="ridingTop">
								<td class="tableNo">번호</td>
								<td class="tableTitle">라이딩 제목</td>
								<td class="tableWriter">개설자</td>
								<td class="tableHit">조회수</td>
								<td class="tableStartDate">시작일</td>
								<td class="tableEndDate">종료일</td>
							</tr>
							<c:forEach items="${myRidingMadeList }" var="md">
								<tr>
									<td class="tableNo">${md.ridingNo}</td>
									<td class="tableTitle"><a href="/riding/ridingView?ridingNo=${md.ridingNo}">${md.ridingSubject}</a></td>
									<td class="tableWriter">${md.nickname}</td>
									<td class="tableHit">${md.ridingHit}</td>
									<td class="tableStartDate">${md.startDate}</td>
									<td class="tableEndDate">${md.endDate}</td>
								</tr>
							</c:forEach>
						</table>
						<!-- 페이징 -->
						<ul class="paging">
							<!--  이전페이지 -->
							<c:if test="${pVO3.pageNum==1}">
								<li>prev</li>
							</c:if>
							<c:if test="${pVO3.pageNum>1}">
								<li><a
										href="/riding/myRidingList?pageNum=${pVO3.pageNum-1}
								<c:if test='${pVO3.searchWord != null}'>
									&searchKey=${pVO3.searchKey }
									&searchWord=${pVO3.searchWord }</c:if>">prev&nbsp;&nbsp;</a></li>
							</c:if>
							<!--  페이지 번호                 1,5      6,10         11,15-->
							<c:forEach var="p" begin="${pVO3.startPage}"
									   end="${pVO3.startPage+pVO3.onePageCount-1}">
								<!--  총 페이지수보다 출력할 페이지번호가 작을때 -->
								<c:if test="${p <= pVO3.totalPage3}">
									<c:if test="${p == pVO3.pageNum}">
										<li
										style="background-color: lightgray; height: 25px; border-radius: 6px;">
									</c:if>
									<c:if test="${p != pVO3.pageNum}">
										<li>
									</c:if>
									<a
											href="/riding/myRidingList?pageNum=${p}
									<c:if test='${pVO3.searchWord != null}'>
										&searchKey=${pVO3.searchKey }
										&searchWord=${pVO3.searchWord }
									</c:if>">
											${p}</a>
									</li>
								</c:if>
							</c:forEach>
							<c:if test="${pVO3.pageNum==pVO3.totalPage3}">
								<li>next</li>
							</c:if>
							<c:if test="${pVO3.pageNum<pVO3.totalPage3}">
								<li><a
										href="/riding/myRidingList?pageNum=${pVO3.pageNum+1}
								<c:if test='${pVO3.searchWord != null}'>
									&searchKey=${pVO3.searchKey }
									&searchWord=${pVO3.searchWord }</c:if>">&nbsp;&nbsp;next</a></li>
							</c:if>
						</ul>
						<!-- 검색 -->
						<div>
							<form method="get" action="/riding/myRidingList" id="searchFrm">
								<select name="searchKey" id="searchKey">
									<option value="ridingSubject">제목</option>
									<option value="nickname">글쓴이</option>
									<option value="startDate">여정 시작일</option>
								</select> <input type="text" name="searchWord" id="searchWord">
								<button id="searchBtn" class="searchBtn">검색</button>
							</form>
						</div>
					</div>

				</section>
			</div>
		</div>
	</div>
	<script src="${url}/js/riding/myRidingList.js"></script>