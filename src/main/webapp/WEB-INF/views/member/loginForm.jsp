<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
    function LogFormCheck(){
        var id = document.getElementById("userId");
        if(id.value==""){
            alert("아이디를 입력하세요");
            id.focus();
            return false;
        }
        if(document.querySelector("#userPwd").value==""){
            alert("비밀번호를 입력하세요.");
            document.querySelector("#userPwd").focus();
            return false;
        }
        document.getElementById("logFrm").submit();
    }
</script>
<style>
    .container{
        width:1000px;
        margin:0 auto;
        overflow:auto;
        position: absolute;
        top: 50%; left: 50%;
    }
    li{
        color: black;
    }
</style>
<main>
    <div class="container">
        <div id="log">
            <h1>로그인</h1>
            <hr/>
            <form method="post" action="/member/loginOk" id="logFrm">
                <ul>
                    <li>아이디</li>
                    <li><input type="text" name="userId" id="userId"/></li>
                    <li>비밀번호</li>
                    <li><input type="password" name="userPwd" id="userPwd"></li>
                    <li><input type="button" value="로그인" onclick="LogFormCheck()"/>
                        <input type="reset" value="취 소"/></li>
                    <li><a href ="${url}/member/memberForm">회원가입</a></li>
                </ul>
            </form>
        </div>
    </div>
</main>