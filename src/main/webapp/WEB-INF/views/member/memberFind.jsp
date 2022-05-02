<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- css와 js 적용 -->
<script src="${url}/js/member/memberFind.js"></script>
<link rel = "stylesheet" href="/css/member/memberFind.css" type="text/css"/>
<!-- 부트스트랩 사용을 위한 스타일 시트와 스크립트 임포트 -->
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


<main>
    <section class="loginForm">
        <div id="log">
                <!-- 메뉴 -->
                <ul class="nav nav-pills" style="width: 312px; position: relative; left: 80px; margin-bottom: 25px;">
                    <li class="nav-item"><a href="#t1" class="nav-link active" data-toggle="tab" style="color: #313942; border-radius: 7px">아이디 찾기</a></li>
                    <li class="nav-item"><a href="#t2" class="nav-link"  data-toggle="tab" style="color: #313942; border-radius: 7px">비밀번호 찾기</a></li>
                </ul>
                <!-- 콘텐츠 -->
                <div class="tab-content">
                    <div id="t1" class="tab-pane active"><!-- 메뉴당 내용 -->
                        <h1>아이디 찾기</h1>
                        <form id="logFrm">
                            <div class="input-area">
                                <input type="text" name="userName" id="userName" style="width: 300px;" autocomplete="off" required/>
                                <label for="userName">회원이름</label>
                            </div>
                            <div class="input-area">
                                <input type="text" name="userTel" id="userTel" style="width: 300px; margin-right: 60px;" autocomplete="off" required>
                                <label for="userTel">전화번호</label>
                                <span id="showStateFindId" class="state">가입시 입력한 이름과 전화번호를 입력해주세요</span>
                            </div>
                            <div class="join-btn">
                                <button class="btn" style="background-color: #3A4750;" type="button" value="아이디 찾기" onclick="FindUserId()">아이디 찾기</button>
                            </div>
                            <div class="showStateFindId">
                            </div>
                            <div class="bottom-menu">
                                <a href ="${url}/member/memberForm">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </div>
                        </form>
                    </div>
                    <div id="t2" class="tab-pane"><!-- 메뉴당 내용 -->
                        <h1>비밀번호 찾기</h1>
                        <form id="logFrm">
                            <div class="input-area">
                                <input type="text" name="userId" id="userId" style="width: 300px;" autocomplete="off" required/>
                                <label for="userId">아이디</label>
                            </div>
                            <div class="input-area">
                                <input type="text" name="userEmail" id="userEmail" style="width: 300px; margin-right: 60px;" autocomplete="off" required>
                                <label for="userEmail">이메일</label>
                                <span id="showStateFindPwd" class="state">가입시 입력한 아이디와 이메일을 입력해주세요</span>
                            </div>
                            <div class="join-btn">
                                <button id="findPwdButton" type="button" value="비밀번호 찾기" onclick="IsValidEmail()">비밀번호 찾기</button>
                            </div>
                            <div class="bottom-menu">
                                <a href ="${url}/member/memberForm">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </div>
                        </form>
                    </div>
                </div>
        </div>
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
    <script src="${url}/css/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${url}/js/admin/js/demo/datatables-demo.js"></script>

</main>



