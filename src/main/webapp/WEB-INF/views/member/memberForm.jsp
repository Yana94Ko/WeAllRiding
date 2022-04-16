<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="${url}/js/member/member.js"></script>
<link rel="stylesheet" href="/css/member/memberForm.css" type="text/css"/>
<main>
    <section class="memberForm">
        <h1>회원가입</h1>
        <form method="post" action="/member/memberOk" id="mFrm" onsubmit="return MemberCheck()">
            <div class="member-input">
                <input type="text" name="userId" id="userId" onkeyup="CheckId()" required/>
                <span id="stateIdChk" class="stateIdChk">아이디를 입력하세요</span>
                <label>아이디</label>
            </div>
            <div class="member-input">
                <input type="text" name="nickname" id="nickname" onkeyup="CheckNick()" required/>
                <span id="stateNickChk" class="stateNickChk">닉네임을 입력하세요</span>
                <label>닉네임</label>
            </div>
            <div class="member-input">
                <input type="password" name="userPwd" id="userPwd" required/>
                <label>비밀번호</label>
            </div>
            <div class="member-input">
                <input type="password" name="userPwd2" id="userPwd2" required/>
                <label>비밀번호확인</label>
            </div>
            <div class="member-input">
                <input type="text" name="userName" id="userName" required/>
                <label>이름</label>
            </div>
            <div class="radio">
                <label>성별:</label>
                <label><input type="radio" name="gender" value="남" required>남</label>
                <label><input type="radio" name="gender" value="여" required>여</label>
            </div>
            <div>
                <select id="userTel1" name="userTel1" class="userTel1">
                    <option value="010">010</option>
                    <option value="02">02</option>
                    <option value="031">031</option>
                    <option value="041">041</option>
                </select>
                <div class="tel">
                    <input type="text" name="userTel2" id="userTel2" maxlength="9" required/>
                    <label>연락처</label>
                    <button id="phoneChk" class="phoneChk" type="button" onclick="CheckTel()">인증번호 보내기</button>
                    <input id="certNo" type="text" name="certNo" title="인증번호 입력"/>
                    <button id="certChk" class="certChk" type="button" onclick="CheckCode()">본인인증</button>
                    <span id="statePhoneChk" class="statePhoneChk">휴대폰 번호 입력 후 인증번호 보내기를 해주십시오.</span>
                </div>
            </div>
            <div class="date">
                <label>생년월일: </label>
                <input type='date' name='birth' value='birth' required/>
            </div>
            <div class="member-input">
                <input type="text" name="userEmail" id="userEmail" required/>
                <label>이메일</label>
            </div>
            <div class="member-input">
                <input type="text" name="experience" id="experience" required/>
                <label>자전거 경력</label>
            </div>
            <div class="bikeType">
                <label>자전거 종류</label>
                <select name="bicycleType">
                    <option value="MTB">MTB</option>
                    <option value="ROAD">ROAD</option>
                </select>
            </div>
            <div class="join-btn">
                <button type="submit" onclick="MemberCheck()">가입하기</button>
            </div>
        </form>
    </section>
</main>