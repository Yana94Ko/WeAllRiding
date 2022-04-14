<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<main>
	<div class="ridingContainer">
		<h1 style="margin:0 auto; padding:40px;">개설 라이딩 리스트</h1>
		<ul id="myWriteList">
			<li id="WList">번호</li>
			<li id="WList">라이딩</li>
			<li id="WList">개설자</li>
			<li id="WList">조회수</li>
			<li id="WList">시작일</li>
			<li id="WList">종료일</li>
			<c:forEach var="vo" items="${lst }">
				<li>${vo.comtyNo }</li>
				<li><a href="/comty/comtyView?comtyNo=${vo.comtyNo}">${vo.comtySubject }</a></li>
				<li>${vo.nickname }</li>
				<li>${vo.comtyHit }</li>
				<li id="comtyWD">${vo.comtyWriteDate }</li>
			</c:forEach>
		</ul>
		<c:if test="${userId != null && userId != ''}">
			<div id="writeBTN">
				<button id="writeBtn" onclick="location.href='/comty/comtyWrite' ">글 작성하기</button>
			</div>
		</c:if>
		<br/>
		<!-- 페이징 -->

		<ul class="paging">
			<!--  이전페이지 -->
			<c:if test="${pVO.pageNum==1}">
				<li>prev</li>
			</c:if>
			<c:if test="${pVO.pageNum>1}">
				<li><a
					href="/comty/comtyList?pageNum=${pVO.pageNum-1}
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
						<li style="background-color: lightgray; height:25px; border-radius: 6px;">
					</c:if>
					<c:if test="${p != pVO.pageNum}">
						<li>
					</c:if>
					<a href="/comty/comtyList?pageNum=${p}
						<c:if test='${pVO.searchWord != null}'>
							&searchKey=${pVO.searchKey }
							&searchWord=${pVO.searchWord }</c:if>">${p}</a></li>
				</c:if>
			</c:forEach>
			<c:if test="${pVO.pageNum==pVO.totalPage}">
				<li>next</li>
			</c:if>
			<c:if test="${pVO.pageNum<pVO.totalPage}">
				<li><a
					href="/comty/comtyList?pageNum=${pVO.pageNum+1}
					<c:if test='${pVO.searchWord != null}'>
						&searchKey=${pVO.searchKey }
						&searchWord=${pVO.searchWord }</c:if>">&nbsp;&nbsp;next</a></li>
			</c:if>
		</ul>
		<!-- 검색 -->
		<div>
			<form method="get" action="/comty/comtyList" id="searchFrm">
				<select name="searchKey" id="searchKey">
					<option value="comtySubject">제목</option>
					<option value="comtyContent">글내용</option>
					<option value="nickname">글쓴이</option>
				</select> 
				<input type="text" name="searchWord" id="searchWord"> 
				<button id="searchBtn">검색</button>

			</form>
		</div>
	</div>
</main>