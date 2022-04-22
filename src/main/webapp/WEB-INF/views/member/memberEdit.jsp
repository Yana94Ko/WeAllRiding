<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="${url}/js/member/memberEdit.js"></script>
<link rel="stylesheet" href="/css/member/memberEdit.css" type="text/css"/>


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

<%--<!-- parallax START -->--%>
<%--<div class="home">--%>
<%--	<div class="homeBackground parallaxWindow" data-parallax="scroll"--%>
<%--		data-image-src="${url}/images/home/home_background16.png"></div>--%>
<%--	<!-- 배경 이미지 -->--%>
<%--	<div class="homeContent">--%>
<%--		<div class="homeTitle">회원정보 수정</div>--%>
<%--		<!-- 페이지 타이틀 -->--%>
<%--	</div>--%>
<%--</div>--%>
<%--<!-- parallax END -->--%>


<main>
  <section class="memberForm">
    <h3>회원정보 수정</h3>
    <form method="post" action="/member/memberEditOk" id="mFrm" onsubmit="return MemberEditCheck()">
      <div class="member-input">
        <input type="text" name="userId" id="userId" value="${vo.userId}" style="color: #F6C90E;" readonly/>

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
        <input type="text" name="userName" id="userName" value="${vo.userName}" style="color: #F6C90E;" readonly/>
      </div>
        <div class="member-input">
          <input type="text" name="userTel" id="userTel" value="${vo.userTel}" style="color: #F6C90E;" readonly/>
        </div>
      <div class="member-input">
        <input type='text' name='birth' value="${vo.birth}" style="color: #F6C90E;" readonly/>
      </div>
      <div class="member-input">
        <input type="text" name="gender" value="${vo.gender}" style="color: #F6C90E;" readonly>
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
      <div class="edit-btn">
        <button type="submit">수정하기</button>
      </div>
      <div class="exit-btn">
        <button type="button" onclick="MemberDelete()">탈퇴하기</button>
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