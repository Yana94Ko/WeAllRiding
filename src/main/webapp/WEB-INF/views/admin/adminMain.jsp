<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel = "stylesheet" href="/css/admin/adminMain.css" type="text/css"/>

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
<div id="top">

</div>
<main>
    <section>
        <h2>관리 메뉴</h2>

        <div class="tab">
            <button class="tablinks" onclick="openCity(event, 'member')" id="defaultOpen">회원정보 관리</button>
            <button class="tablinks" onclick="openCity(event, 'community')">커뮤니티 글 관리</button>
            <button class="tablinks" onclick="openCity(event, 'course')">추천경로 관리</button>
            <button class="tablinks" onclick="openCity(event, 'riding')">라이딩 관리</button>
            <button class="tablinks" onclick="openCity(event, 'shop')">공인샵 및 공임비 관리</button>
        </div>

        <div id="member" class="tabcontent">
            <h3>회원정보 관리</h3>
            <h2>회원 목록</h2>
            <table border="1" width="1000px">
                <tr>
                    <td>아이디</td>
                    <td>비밀번호</td>
                    <td>이름</td>
                    <td>이메일</td>
                    <td>회원가입일</td>
                </tr>
                <c:forEach items="${memberList}" var="mb">
                    <tr>
                        <td>${mb.userId}</td>
                        <td>${mb.userPwd}</td>
                        <td>${mb.userName}</td>
                        <td>${mb.userEmail}</td>
                        <td>${mb.joinDate}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div id="community" class="tabcontent">
            <h3>커뮤니티 글 관리</h3>
            <table border="1" width="1000px">
                <tr>
                    <td>번호</td>
                    <td>제목</td>
                    <td>글쓴이</td>
                    <td>조회수</td>
                    <td>등록일</td>
                </tr>
                <c:forEach items="${comtyList }" var="cm">
                    <tr>
                        <td>${cm.comtyNo}</td>
                        <td>${cm.comtySubject}</td>
                        <td>>${cm.nickname}</td>
                        <td>${cm.comtyHit}<</td>
                        <td>${cm.comtyWriteDate}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>

        <div id="course" class="tabcontent">
            <h3>추천경로 관리</h3>

        </div>

        <div id="riding" class="tabcontent">
            <h3>라이딩 관리</h3>

        </div>

        <div id="shop" class="tabcontent">
            <h3>공인샵 및 공임비 관리</h3>

        </div>
    </section>
</main>