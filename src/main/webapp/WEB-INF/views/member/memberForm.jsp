<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="${url}/js/member/member.js"></script>

<link rel="stylesheet" href="/css/member/memberForm.css" type="text/css"/>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>WeAllRiding Admin</title>

<!-- Custom fonts for this template -->
<link href="${url}/css/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${url}/css/admin/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="${url}/css/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">


<title>SB Admin 2 - Tables</title>




<main>
    <section class="memberForm">
        <h3>회원가입</h3>
        <form method="post" action="/member/memberOk" id="mFrm" onsubmit="return MemberCheck()">
            <div class="member-input">
                <input type="text" name="userId" id="userId" onkeyup="CheckId()" required/>
                <label>아이디</label>
                <span id="stateIdChk" class="state">아이디를 입력하세요</span>
            </div>
            <div class="member-input">
                <input type="text" name="nickname" id="nickname" onkeyup="CheckNick()" required/>
                <label>닉네임</label>
                <span id="stateNickChk" class="state">닉네임을 입력하세요</span>
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
                <label>성별:&nbsp;&nbsp;&nbsp;</label>
                <label><input type="radio" name="gender" value="남" required>남</label>
                &nbsp;&nbsp;&nbsp;
                <label><input type="radio" name="gender" value="여" required>여</label>
            </div>
            <div class="userTel1">
                <select class="selectpicker" id="userTel1" name="userTel1" style="font-size: 0.72em;">
                    <option value="010">010</option>
                    <option value="02">02</option>
                    <option value="031">031</option>
                    <option value="041">041</option>
                </select>
            </div>
            <div class="tel">
                <input type="text" name="userTel2" id="userTel2" maxlength="9" required/>
                <label>연락처</label>
            </div>
            <div class="push-number">
                <button class="btn"style="opacity: 70%; color: ivory; background-color: rgba(58, 71, 80, 1); width: 200px; height: 40px; font-size: 0.8em;" id="phoneChk" class="phoneChk" type="button" onclick="CheckTel()">인증번호 보내기</button>
            </div>
            <div class="tel-2">
                <input id="certNo" type="text" name="certNo" title="인증번호 입력" required/>
                <label>인증번호 입력</label>
                <span id="statePhoneChk" class="state" >번호 입력 후 인증번호 보내기를 해주십시오.</span>
            </div>
            <div class="confirm-number">
                <button class="btn"style="opacity: 70%; color: ivory; background-color: rgba(58, 71, 80, 1); width: 5vm; height: 30px; font-size: 0.4em;"  id="certChk" class="certChk" type="button" onclick="CheckCode()">본인인증</button>
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

<!-- Bootstrap core JavaScript-->
<script src="${url}/css/admin/vendor/jquery/jquery.min.js"></script>
<script src="${url}/css/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="${url}/css/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${url}/js/admin/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="${url}/css/admin/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="${url}css/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="${url}js/admin/js/demo/datatables-demo.js"></script>

</main>