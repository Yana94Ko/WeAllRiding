<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="${url}/js/member/loginForm.js"></script>
<link rel = "stylesheet" href="/css/member/loginForm.css" type="text/css"/>
<main>
    <section class="loginForm">
        <div id="log">
            <h1>Login</h1>
            <form method="post" action="/member/loginOk" id="logFrm">
                <div class="input-area">
                    <input type="text" name="userId" id="userId" required/>
                    <label for="userId">ID</label>
                </div>
                <div class="input-area">
                    <input type="password" name="userPwd" id="userPwd" autocomplete="off" required>
                    <label for="userPwd">Password</label>
                </div>
                <div class="login-btn">
                    <button type="button" value="로그인" onclick="LogFormCheck()">Login</button>
                </div>
                <div class="bottom-menu">
                    <a href ="${url}/member/memberFind">아이디/비밀번호 찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                    <a href ="${url}/member/memberForm">회원가입 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
            </form>
        </div>
    </section>
</main>