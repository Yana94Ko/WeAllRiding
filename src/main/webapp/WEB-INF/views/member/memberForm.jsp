<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="${url}/js/topBottomScript.js"></script>
<link rel="stylesheet" href="/css/memberForm.css" type="text/css"/>
<main>
    <div class="container">
        <h1>회원가입</h1>
        <form method="post" action="/member/memberOk" id="mFrm" onsubmit="return MemberCheck()">
            <ul>
                <li>아이디</li>
                <li><input type="text" name="userId" id="userId" placeholder="아이디입력" />
                </li>
                <li>비밀번호</li>
                <li><input type="password" name="userPwd" id="userPwd" placeholder="비밀번호입력" /></li>
                <li></li>
                <li><input type="password" name="userPwd2" id="userPwd2" placeholder="비밀번호확인입력" /></li>
                <li>이름</li>
                <li><input type="text" name="userName" id="userName" placeholder="" /></li>
                <li>닉네임</li>
                <li><input type="text" name="nickname" id="nickname" placeholder="" /></li>
                <li>연락처</li>
                <li>
                    <select name="userTel1">
                        <option value="010">010</option>
                        <option value="02">02</option>
                        <option value="031">031</option>
                        <option value="041">041</option>
                    </select> -
                    <input type="text" name="userTel2" id="userTel2" />
                </li>
                <li>성별</li>
                <input type="radio" name="gender" value="남">남
                <input type="radio" name="gender" value="여">여
                <li>생년월일</li>
                <input type='date' name='birth' value='birth'/>
                <li>이메일</li>
                <li><input type="text" name="userEmail" id="userEmail" /></li>
                <li>바이킹 경력</li>
                <li><input type="text" name="experience" id="experience" /></li>
                <li>자전거 종류</li>
                <li>
                    <select name="bicycleType">
                        <option value="MTB">MTB</option>
                        <option value="ROAD">ROAD</option>
                    </select>
                </li>
                <li><input type="submit" value="가입하기"></li>
            </ul>
        </form>
    </div>
</main>