<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<main>
    <div class="container">
        <div id="log">
            <h1>로그인</h1>
            <hr/>
            <form method="post" action="/myapp/member/loginOk" id="logFrm" onsubmit="return logFormCheck()">
                <ul>
                    <li>아이디</li>
                    <li><input type="text" name="userid" id="userid"/></li>
                    <li>비밀번호</li>
                    <li><input type="password" name="userpwd" id="userpwd"/></li>
                    <li><input type="submit" value="로그인"/>
                        <input type="reset" value="취  소"/></li>
                </ul>
            </form>
        </div>
    </div>
</main>