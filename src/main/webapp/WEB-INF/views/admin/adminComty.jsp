<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel = "stylesheet" href="/css/admin/adminComty.css" type="text/css"/>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- 탭메뉴 바꾸기 -->

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Tables</title>

<!-- Custom fonts for this template -->
<link href="${url}/css/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${url}/css/admin/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="${url}/css/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<main id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav sidebar sidebar-dark accordion" id="accordionSidebar" style="background-color: #F6C90E;">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${url}/">
                <div class="sidebar-brand-icon rotate-n-10">
                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-bicycle" viewBox="0 0 16 16" style="color:#313942;">
                        <path d="M4 4.5a.5.5 0 0 1 .5-.5H6a.5.5 0 0 1 0 1v.5h4.14l.386-1.158A.5.5 0 0 1 11 4h1a.5.5 0 0 1 0 1h-.64l-.311.935.807 1.29a3 3 0 1 1-.848.53l-.508-.812-2.076 3.322A.5.5 0 0 1 8 10.5H5.959a3 3 0 1 1-1.815-3.274L5 5.856V5h-.5a.5.5 0 0 1-.5-.5zm1.5 2.443-.508.814c.5.444.85 1.054.967 1.743h1.139L5.5 6.943zM8 9.057 9.598 6.5H6.402L8 9.057zM4.937 9.5a1.997 1.997 0 0 0-.487-.877l-.548.877h1.035zM3.603 8.092A2 2 0 1 0 4.937 10.5H3a.5.5 0 0 1-.424-.765l1.027-1.643zm7.947.53a2 2 0 1 0 .848-.53l1.026 1.643a.5.5 0 1 1-.848.53L11.55 8.623z"/>
                    </svg>
                </div>
                <div class="sidebar-brand-text mx-3" style="color: #313942;">WeAllRiding Admin <sup></sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading" style="color: #313942;">
                관리자
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                   aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog" style="color: #313942;"></i>
                    <span style="color: #313942;">관리</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-gray-900 py-2 collapse-inner rounded">
                        <h6 class="collapse-header">관리자 메뉴</h6>
                        <a class="collapse-item" href="${url}/admin/adminMember" style="color:#999999;">회원 관리</a>
                        <a class="collapse-item" href="${url}/admin/adminComty" style="color:#999999;">커뮤니티 관리</a>
                        <a class="collapse-item" href="${url}/admin/adminRecommend" style="color:#999999;">추천코스 관리</a>
                        <a class="collapse-item" href="${url}/admin/adminRiding" style="color:#999999;">라이딩 관리</a>
                        <a class="collapse-item" href="${url}/admin/adminShop" style="color:#999999;">정비샵 관리</a>
                    </div>
                </div>
            </li>

            <!-- 통계 -->
            <li class="nav-item">
                <a class="nav-link" href="${url}/admin/adminMain">
                    <i class="fas fa-fw fa-chart-area" style="color: #313942;"></i>
                    <span style="color: #313942;">통계</span></a>
            </li>

            <!-- 선 나눔 -->
            <hr class="sidebar-divider" style="border: 1px solid #313942;">

            <!-- 사이드 메뉴 회원전용탭 -->
            <div class="sidebar-heading" style="color: #313942;">
                회원 전용
            </div>

            <!-- 회원 전용 메뉴 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                   aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder" style="color: #313942;"></i>
                    <span style="color: #313942;">회원 메뉴 보기</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-gray-900 py-2 collapse-inner rounded">
                        <h6 class="collapse-header">회원 이용 메뉴</h6>
                        <a class="collapse-item" href="${url}/" style="color:#999999;">메인 페이지</a>
                        <a class="collapse-item" href="${url}/recommendView" style="color:#999999;">코스</a>
                        <a class="collapse-item" href="${url}/riding/ridingList" style="color:#999999;">라이딩</a>
                        <a class="collapse-item" href="${url}/shopView" style="color:#999999;">장비샵</a>
                        <a class="collapse-item" href="${url}/comty/comtyList" style="color:#999999;">커뮤니티</a>
                        <a class="collapse-item" href="${url}/idealView" style="color:#999999;">이상형 월드컵</a>
                        <div class="collapse-divider"></div>
                        <%--                    <h6 class="collapse-header">Other Pages:</h6>--%>
                        <%--                    <a class="collapse-item" href="404.html">404 Page</a>--%>
                        <%--                    <a class="collapse-item" href="blank.html">Blank Page</a>--%>
                    </div>
                </div>
            </li>



            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block" style="border: 1px solid #313942">

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



                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">


                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${nickName}</span>

                                <img class="img-profile rounded-circle"
                                     src="${url}/css/admin/img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                 aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="${url}/member/logout">
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

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">커뮤니티 관리</h1>
                    <p class="mb-4">
                        커뮤니티를 확인하고 삭제할 수 있습니다.<br/>
                        제목을 클릭하여 글 내용을 확인할 수 있습니다.
                    </p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">커뮤니티 글 목록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>제목</th>
                                        <th>글쓴이</th>
                                        <th>조회수</th>
                                        <th>등록일</th>
                                        <th>옵션</th>
                                    </tr>
                                    </thead>
                                    <c:forEach var="vo" items="${lst }">
                                        <tr>
                                            <td>${vo.comtyNo }</td>
                                            <td><a href="/admin/adminComtyView?comtyNo=${vo.comtyNo}">${vo.comtySubject }</a></td>
                                            <td>${vo.nickname }</td>
                                            <td>${vo.comtyHit }</td>
                                            <td id="comtyWD">${vo.comtyWriteDate }</td>
                                            <td><button class="btn btn-danger" style="height: 40px;" type="button" onclick="location.href='/admin/adminComtyDelete?comtyNo=${vo.comtyNo}';" >삭제</button> </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination">
                                        <li class="page-item">
                                            <c:if test="${pVO.pageNum==1}">
                                            <a class="page-link" href="#" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                            </c:if>
                                            <c:if test="${pVO.pageNum>1}">
                                        <li>
                                            <a class="page-link" aria-label="Previous" href="${url}/admin/adminComty?pageNum=${pVO.pageNum-1}<c:if test='${pVO.searchWord != null}'>&searchKey=${pVO.searchKey }&searchWord=${pVO.searchWord }</c:if>">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                        </c:if>
                                        </li>
                                        <!--  페이지 번호                 1,5      6,10         11,15-->
                                        <c:forEach var="p" begin="${pVO.startPage}"
                                                   end="${pVO.startPage+pVO.onePageCount-1}">
                                            <!--  총 페이지수보다 출력할 페이지번호가 작을때 -->
                                            <c:if test="${p <= pVO.totalPage}">
                                                <c:if test="${p == pVO.pageNum}">
                                                    <li class="page-item">
                                                </c:if>
                                                <c:if test="${p != pVO.pageNum}">
                                                    <li class="page-item">
                                                </c:if>
                                                <a class="page-link" href="${url}/admin/adminComty?pageNum=${p}<c:if test='${pVO.searchWord != null}'>&searchKey=${pVO.searchKey }&searchWord=${pVO.searchWord }</c:if>">
                                                        ${p}
                                                </a>
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                        <c:if test="${pVO.pageNum==pVO.totalPage}">
                                            <li class="page-item">
                                                <a class="page-link" aria-label="Next" href="#">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:if test="${pVO.pageNum<pVO.totalPage}">
                                            <li class="page-item">
                                                <a class="page-link" aria-label="Next" href="${url}/admin/adminComty?pageNum=${pVO.pageNum+1}<c:if test='${pVO.searchWord != null}'>&searchKey=${pVO.searchKey }&searchWord=${pVO.searchWord }</c:if>">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </nav>
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
    <script src="${url}/js/admin/js/demo/datatables-demo.js"></script>

</main>