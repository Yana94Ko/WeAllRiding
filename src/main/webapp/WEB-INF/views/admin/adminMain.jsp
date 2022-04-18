<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel = "stylesheet" href="/css/admin/adminMain.css" type="text/css"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

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

<hr/>
<div id="top"></div>

    <nav class="top3">
        <img src="${url}/images/icon.png" width="70px" />
    </nav>
    <nav class="top2">관리자 페이지</nav>
<main>
    <section>
        <div class="tab">
            <box class="tabMenu">
                <li>메뉴</li>
                <button class="tablinks" onclick="openCity(event, 'member')" id="defaultOpen">회원정보 관리</button>
                <button class="tablinks" onclick="openCity(event, 'community')">커뮤니티 글 관리</button>
                <button class="tablinks" onclick="openCity(event, 'course')">추천경로 관리</button>
                <button class="tablinks" onclick="openCity(event, 'riding')">라이딩 관리</button>
                <button class="tablinks" onclick="openCity(event, 'shop')">공인샵 및 공임비 관리</button>
            </box>
        </div>

        <div id="member" class="tabcontent">
            <h3>회원정보 관리</h3>
            <table border="1" width="800px">
                <tr>
                    <td>아이디</td>
                    <td>비밀번호</td>
                    <td>이름</td>
                    <td>이메일</td>
                    <td>회원가입일</td>
                </tr>
                <c:forEach items="${memberList}" var="mb">
                    <tr>
                        <td><a href="${url}/admin/adminView?userId=${mb.userId}">${mb.userId}</a></td>
                        <td>${mb.userPwd}</td>
                        <td>${mb.userName}</td>
                        <td>${mb.userEmail}</td>
                        <td>${mb.joinDate}</td>
                    </tr>
                </c:forEach>
            </table>
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <li class="page-item disabled">
                        <a class="page-link">Previous</a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#">Next</a>
                    </li>
                </ul>
            </nav>
        </div>
        <div id="community" class="tabcontent">
            <h3>커뮤니티 글 목록</h3>
            <table border="1" width="800px">
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
                        <td>${cm.nickname}</td>
                        <td>${cm.comtyHit}</td>
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
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</main>
