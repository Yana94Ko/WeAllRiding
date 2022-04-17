<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="${url}/js/member/memberEdit.js"></script>
<link rel="stylesheet" href="/css/member/memberForm.css" type="text/css"/>
<!-- parallax START -->
<div class="home">
	<div class="homeBackground parallaxWindow" data-parallax="scroll"
		data-image-src="${url}/images/home/home_background16.png"></div>
	<!-- 배경 이미지 -->
	<div class="homeContent">
		<div class="homeTitle">회원정보 수정</div>
		<!-- 페이지 타이틀 -->
	</div>
</div>
<!-- parallax END -->
<main>
  <section class="memberForm">
    <h1>회원정보 수정</h1>
    <form method="post" action="/member/memberEditOk" id="mFrm" onsubmit="return MemberEditCheck()">
      <div class="member-input">
        <input type="text" name="userId" id="userId" value="${vo.userId}" readonly/>
        <label>아이디</label>
      </div>
      <div class="member-input">
        <input type="text" name="nickname" id="nickname" value="${vo.nickname}" required/>
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
        <input type="text" name="userName" id="userName" value="${vo.userName}" readonly/>
        <label>이름</label>
      </div>
      <div class="radio">
        <label>성별:</label>
        <label><input type="text" name="gender" value="${vo.gender}" readonly></label>
      </div>
      <div>
        <div class="tel">
          <label>연락처</label>
          <input type="text" name="userTel" id="userTel" value="${vo.userTel}" readonly/>
        </div>
      </div>
      <div class="date">
        <label>생년월일: </label>
        <input type='text' name='birth' value="${vo.birth}" readonly/>
      </div>
      <div class="member-input">
        <input type="text" name="userEmail" id="userEmail" value="${vo.userEmail}" required/>
        <label>이메일</label>
      </div>
      <div class="member-input">
        <input type="text" name="experience" id="experience" value="${vo.experience}" required/>
        <label>자전거 경력</label>
      </div>
      <div class="bikeType">
        <label>자전거 종류</label>
        <select name="bicycleType" value="${vo.bicycleType}">
          <option value="MTB">MTB</option>
          <option value="ROAD">ROAD</option>
        </select>
      </div>
      <div class="join-btn">
        <button type="submit">수정하기</button>
      </div>
      <div class="join-btn">
        <button type="button" onclick="MemberDelete()">탈퇴하기</button>
      </div>
    </form>
  </section>
</main>