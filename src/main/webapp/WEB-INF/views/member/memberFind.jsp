<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- css와 js 적용 -->
<script src="${url}/js/member/memberFind.js"></script>
<link rel = "stylesheet" href="/css/member/memberFind.css" type="text/css"/>
<!-- 부트스트랩 사용을 위한 스타일 시트와 스크립트 임포트 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src ="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
<main>
    <section class="loginForm">
        <div id="log">
                <!-- 메뉴 -->
                <ul class="nav nav-tabs">
                    <li class="nav-item"><a href="#t1" class="nav-link active" data-toggle="tab">아이디 찾기</a></li>
                    <li class="nav-item"><a href="#t2" class="nav-link"  data-toggle="tab">비밀번호 찾기</a></li>
                </ul>
                <!-- 콘텐츠 -->
                <div class="tab-content">
                    <div id="t1" class="tab-pane active"><!-- 메뉴당 내용 -->
                        <h1>아이디 찾기</h1>
                        <form id="logFrm">
                            <div class="userName">
                                <label for="userName">회원이름</label>
                                <input type="text" name="userName" id="userName" required/>
                            </div>
                            <div class="userTel">
                                <label for="userTel">전화번호</label>
                                <input type="text" name="userTel" id="userTel" placeholder="-을 제외하고 입력해주세요" autocomplete="off" required>
                                <button type="button" value="아이디 찾기" onclick="FindUserId()">아이디 찾기</button>
                            </div>
                            <div class="showStateFindId">
                                <span id="showStateFindId">가입시 입력한 이름과 전화번호를 입력해주세요</span>
                            </div>
                            <div class="bottom-menu">
                                <a href ="${url}/member/memberForm">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </div>
                        </form>
                    </div>
                    <div id="t2" class="tab-pane"><!-- 메뉴당 내용 -->
                        <h1>비밀번호 찾기</h1>
                        <form id="logFrm">
                            <div class="userId">
                                <label for="userId">아이디</label>
                                <input type="text" name="userId" id="userId" required/>
                            </div>
                            <div class="userEmail">
                                <label for="userEmail"">이메일</label>
                                <input type="text" name="userEmail" id="userEmail" autocomplete="off" required>
                                <button id="findPwdButton" type="button" value="비밀번호 찾기" onclick="IsValidEmail()">비밀번호 찾기</button>
                            </div>
                            <div class="showStateFindPwd">
                                <span id="showStateFindPwd">가입시 입력한 아이디와 이메일을 입력해주세요</span>
                            </div>
                            <div class="bottom-menu">
                                <a href ="${url}/member/memberForm">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </div>
                        </form>
                    </div>
                </div>
        </div>
    </section>
</main>



