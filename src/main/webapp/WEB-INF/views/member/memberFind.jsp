<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- css와 js 적용 -->
<script src="${url}/js/member/loginForm.js"></script>
<link rel = "stylesheet" href="/css/member/loginForm.css" type="text/css"/>

<!-- 부트스트랩 사용을 위한 스타일 시트와 스크립트 임포트 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src ="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>

<main>
    <section class="loginForm">
        <div id="log">
                <!-- 메뉴 -->
                <ul class="nav nav-tabs">
                    <li class="nav-item"><a href="#t1" class="nav-link" data-toggle="tab">아이디 찾기</a></li>
                    <li class="nav-item"><a href="#t2" class="nav-link active"  data-toggle="tab">비밀번호 찾기</a></li>
                </ul>
                <!-- 콘텐츠 -->
                <div class="tab-content">
                    <div id="t1" class="tab-pane"><!-- 메뉴당 내용 -->
                        <h1>아이디 비밀번호 찾기</h1>
                        <form method="post" action="/member/loginOk" id="logFrm">
                            <div class="member0">
                                <input type="text" name="userId" id="userId" required/>
                                <label for="userId">아이디</label>
                            </div>
                            <div class="input-area">
                                <input type="text" name="userTel" id="userTel" autocomplete="off" required>
                                <label for="userTel">전화번호</label>
                            </div>
                            <div class="login-btn">
                                <button type="button" value="로그인" onclick="LogFormCheck()">Login</button>
                            </div>
                            <div class="bottom-menu">
                                <a href ="${url}/member/memberFind">아이디 찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                                <a href ="${url}#">비밀번호 찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                                <a href ="${url}/member/memberForm">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </div>
                        </form>
                    </div>
                    <div  id="t2"  class="tab-pane active"><!-- 메뉴당 내용 -->
                        <h1>쇼핑</h1>
                    </div>
                </div>
        </div>
    </section>
</main>



