<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="${url}/css/riding/myRiding.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- 탭메뉴 바꾸기 -->
<script>
    function openCity(evt, menu) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(menu).style.display = "block";
        evt.currentTarget.className += " active";
    }

    // Get the element with id="defaultOpen" and click on it
    document.getElementById("defaultOpen").click();
</script>
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
</main>