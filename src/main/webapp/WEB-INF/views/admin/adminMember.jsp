<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<link rel = "stylesheet" href="/css/admin/adminMain.css" type="text/css"/>
<link rel="shortcut icon" href="${url}/images/icon.png" type="image/x-icon">
<link rel="icon" href="${url}/images/icon.png" type="image/x-icon">

<script scr="${url}js/admin/adminMember.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- 탭메뉴 바꾸기 -->

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


<script>

    //회원정보 가져오기
    $(function() {

        $(".mId").click(function(){
            var userid = $(this).text();
            console.log(userid)
            $.ajax({
                url:"/admin/adminMember2",
                data :{
                    userId:userid
                }
                ,success:function(result){
                    $("#userId").val(result.userId);
                    $("#userName").val(result.userName);
                    $("#nickname").val(result.nickname);
                    $("#userTel1").val(result.userTel1);
                    $("#userTel2").val(result.userTel2);
                    $("#userEmail").val(result.userEmail);
                    $("#birth").val(result.birth);
                    $("#suspendDate").val(result.suspendDate);
                }
            });
        });
    });
</script>
<main id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">WeAllRiding Admin <sup>TM</sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="index.html">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                관리자
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                   aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>관리</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">관리자 메뉴</h6>
                        <a class="collapse-item" href="${url}/admin/adminMember">회원 관리</a>
                        <a class="collapse-item" href="${url}/admin/adminComty">커뮤니티 관리</a>
                        <a class="collapse-item" href="${url}/admin/adminCourse">추천경로 관리</a>
                        <a class="collapse-item" href="${url}/admin/adminRiding">라이딩 관리</a>
                        <a class="collapse-item" href="${url}/admin/adminShop">정비샵 관리</a>
                    </div>
                </div>
            </li>

            <!-- 통계 -->
            <li class="nav-item">
                <a class="nav-link" href="${url}/admin/adminMain">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>통계</span></a>
            </li>

            <!-- 선 나눔 -->
            <hr class="sidebar-divider">

            <!-- 사이드 메뉴 회원전용탭 -->
            <div class="sidebar-heading">
                회원 전용
            </div>

            <!-- 회원 전용 메뉴 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                   aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>회원 메뉴 보기</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">회원 이용 메뉴</h6>
                        <a class="collapse-item" href="${url}/recommendView">코스</a>
                        <a class="collapse-item" href="${url}/riding/ridingList">라이딩</a>
                        <a class="collapse-item" href="${url}/shopView">장비샵</a>
                        <a class="collapse-item" href="${url}/comty/comtyList">커뮤니티</a>
                        <a class="collapse-item" href="${url}/idealView">이상형 월드컵</a>
                        <div class="collapse-divider"></div>
                        <%--                    <h6 class="collapse-header">Other Pages:</h6>--%>
                        <%--                    <a class="collapse-item" href="404.html">404 Page</a>--%>
                        <%--                    <a class="collapse-item" href="blank.html">Blank Page</a>--%>
                    </div>
                </div>
            </li>



            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <form class="form-inline">
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
                    </form>

                    <!-- Topbar Search -->
                    <form
                            class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                   aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                 aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                               placeholder="Search for..." aria-label="Search"
                                               aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <!-- Nav Item - Alerts -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                <!-- Counter - Alerts -->
                                <span class="badge badge-danger badge-counter"></span>
                            </a>
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                 aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                    알림창
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">April 18, 2022</div>
                                        <span class="font-weight-bold">알림이 없습니다</span>
                                    </div>
                                </a>

                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-warning">
                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                        </div>
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                            </div>
                        </li>

                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i>
                                <!-- Counter - Messages -->
                                <span class="badge badge-danger badge-counter"></span>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                 aria-labelledby="messagesDropdown">
                                <h6 class="dropdown-header">
                                    메세지
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <i class="fas fa-fw fa-cog"></i>
                                    </div>
                                    <div class="font-weight-bold">
                                        <div class="text-truncate">메세지 기능 점검 중</div>
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                            </div>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>
                                <img class="img-profile rounded-circle"
                                     src="${url}/css/admin/img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                 aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- 회원관리 설명 -->
                    <h1 class="h3 mb-2 text-gray-800">회원관리</h1>
                    <p class="mb-4">회원관리 페이지입니다. 회원 정보를 수정 또는 삭제할 수 있고, 상세 회원정보를 조회할 수 있습니다.</p>

                    <!-- 데이터 테이블 -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">회원정보 목록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                    <tr>
                                        <th>이름</th>
                                        <th>이메일</th>
                                        <th>아이디</th>
                                        <th>비밀번호</th>
                                        <th>회원가입일</th>
                                    </tr>
                                    </thead>
                                    <c:forEach var="Lst" items="${memberList}">
                                        <tr>
                                            <td>${Lst.userName}</td>
                                            <td>${Lst.userEmail}</td>
                                            <td><a data-toggle="modal" href="#memberDeleteModal" class="mId">${Lst.userId}</a></td>
                                            <td>${Lst.userPwd}</td>
                                            <td>${Lst.joinDate}</td>
                                        </tr>
                                    </c:forEach>
                                </table>
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination">
                                        <li class="page-item">
                                            <c:if test="${mVO.pageNum==1}">
                                            <a class="page-link" href="#" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                            </c:if>
                                            <c:if test="${mVO.pageNum>1}">
                                        <li>
                                            <a class="page-link" aria-label="Previous" href="${url}/admin/adminMember?pageNum=${mVO.pageNum-1}<c:if test='${mVO.searchWord != null}'>&searchKey=${mVO.searchKey }&searchWord=${mVO.searchWord }</c:if>">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                        </c:if>
                                        </li>
                                        <!--  페이지 번호                 1,5      6,10         11,15-->
                                        <c:forEach var="p" begin="${mVO.startPage}"
                                                   end="${mVO.startPage+mVO.onePageCount-1}">
                                            <!--  총 페이지수보다 출력할 페이지번호가 작을때 -->
                                            <c:if test="${p <= mVO.totalPage}">
                                                <c:if test="${p == mVO.pageNum}">
                                                    <li class="page-item">
                                                </c:if>
                                                <c:if test="${p != mVO.pageNum}">
                                                    <li class="page-item">
                                                </c:if>
                                                <a class="page-link" href="${url}/admin/adminMember?pageNum=${p}<c:if test='${mVO.searchWord != null}'>&searchKey=${mVO.searchKey }&searchWord=${mVO.searchWord }</c:if>">
                                                        ${p}
                                                </a>
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                        <c:if test="${mVO.pageNum==mVO.totalPage}">
                                            <li class="page-item">
                                                <a class="page-link" aria-label="Next" href="#">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:if test="${mVO.pageNum<mVO.totalPage}">
                                            <li class="page-item">
                                                <a class="page-link" aria-label="Next" href="${url}/admin/adminMember?pageNum=${mVO.pageNum+1}<c:if test='${mVO.searchWord != null}'>&searchKey=${mVO.searchKey }&searchWord=${mVO.searchWord }</c:if>">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </nav>


                                <!-- Modal -->
                                <div class="modal fade" id="memberDeleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="">회원 상세정보</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form name="form1" method="post" action="/admin/adminMemberEdit">

                                                        <table id="userInfo${status.count}" border="1">
                                                            <tr>
                                                                <td>아이디</td>
                                                                <td><input name="userId" id="userId" value="" readonly="readonly"></td>
                                                            </tr>
                                                            <tr>
                                                                <th>이름</th>
                                                                <td><input name="userName" id="userName" value="${av.userName}"></td>
                                                            </tr>
                                                            <tr>
                                                                <th>닉네임</th>
                                                                <td><input type="text" id="nickname" name="nickname" value="${av.nickname}"></td>
                                                            </tr>
                                                            <tr>
                                                                <td>연락처</td>
                                                                <td><input name="userTel1" id="userTel1" value="${av.userTel1}" readonly="readonly"></td>
                                                                <td><input name="userTel2" id="userTel2" value="${av.userTel2}" readonly="readonly"></td>
                                                            </tr>
                                                            <tr>
                                                                <td>이메일</td>
                                                                <td><input type="text" name="userEmail" id="userEmail" value="${av.userEmail}"></td>
                                                            </tr>
                                                            <tr>
                                                                <td>생년월일</td>
                                                                <td><input type="date" name="birth" id="birth" value="${av.birth}"></td>
                                                            </tr>
                                                            <tr>
                                                                <td>회원정지일</td>
                                                                <td><input type="datetime-local" id="suspend" name="suspendDate" value="${av.suspendDate}"></td>
                                                            </tr>
                                                        </table>

                                                </form>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" onclick="MemberDelete()" class="btn btn-primary">삭제하기</button>
                                                <button type="submit" class="btn btn-primary">수정하기</button>
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->

            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

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
    <script src="${url}js/admin/js/demo/datatables-demo.js"></script>

</main>
