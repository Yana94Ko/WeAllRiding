<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${url}/css/recommend/recommendCreateStyle.css" />
<link rel="stylesheet" href="/css/admin/adminMain.css" type="text/css"/>
<link rel="shortcut icon" href="${url}/images/icon.png"
      type="image/x-icon">
<link rel="icon" href="${url}/images/icon.png" type="image/x-icon">
<script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- 탭메뉴 바꾸기 -->

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Tables</title>

<!-- Custom fonts for this template -->
<link href="${url}/css/admin/vendor/fontawesome-free/css/all.min.css"
      rel="stylesheet" type="text/css">
<link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${url}/css/admin/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link
        href="${url}/css/admin/vendor/datatables/dataTables.bootstrap4.min.css"
        rel="stylesheet">
<main id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul
                class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
                id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a
                    class="sidebar-brand d-flex align-items-center justify-content-center"
                    href="/admin/adminMain">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">
                    WeAllRiding Admin <sup>TM</sup>
                </div>
            </a>

            <!-- Heading -->
            <div class="sidebar-heading">관리자</div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item"><a class="nav-link collapsed" href="#"
                                    data-toggle="collapse" data-target="#collapseTwo"
                                    aria-expanded="true" aria-controls="collapseTwo"> <i
                    class="fas fa-fw fa-cog"></i> <span>관리</span>
            </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
                     data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">관리자 메뉴</h6>
                        <a class="collapse-item" href="${url}/admin/adminMember">회원 관리</a>
                        <a class="collapse-item" href="${url}/admin/adminComty">커뮤니티
                            관리</a> <a class="collapse-item" href="${url}/admin/adminRecommend">추천경로
                        관리</a> <a class="collapse-item" href="${url}/admin/adminRiding">라이딩
                        관리</a> <a class="collapse-item" href="${url}/admin/adminShop">정비샵
                        관리</a>
                    </div>
                </div>
            </li>

            <!-- 통계 -->
            <li class="nav-item"><a class="nav-link"
                                    href="${url}/admin/adminMain"> <i
                    class="fas fa-fw fa-chart-area"></i> <span>통계</span></a></li>

            <!-- 선 나눔 -->
            <hr class="sidebar-divider">

            <!-- 사이드 메뉴 회원전용탭 -->
            <div class="sidebar-heading">회원 전용</div>

            <!-- 회원 전용 메뉴 -->
            <li class="nav-item"><a class="nav-link collapsed" href="#"
                                    data-toggle="collapse" data-target="#collapsePages"
                                    aria-expanded="true" aria-controls="collapsePages"> <i
                    class="fas fa-fw fa-folder"></i> <span>회원 메뉴 보기</span>
            </a>
                <div id="collapsePages" class="collapse"
                     aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">회원 이용 메뉴</h6>
                        <a class="collapse-item" href="${url}/courseCreate">코스</a> <a
                            class="collapse-item" href="${url}/riding/ridingList">라이딩</a> <a
                            class="collapse-item" href="${url}/shopView">장비샵</a> <a
                            class="collapse-item" href="${url}/comty/comtyList">커뮤니티</a> <a
                            class="collapse-item" href="${url}/idealView">이상형 월드컵</a>
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
                <nav
                        class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <form class="form-inline">
                        <button id="sidebarToggleTop"
                                class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
                    </form>

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
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- 회원관리 설명 -->
                    <h1 class="h3 mb-2 text-gray-800">추천 코스 관리</h1>
                    <p class="mb-4">추천코스 관리 페이지입니다. 추천 코스를 생성, 수정, 삭제 할 수 있습니다.</p>

                    <!-- 데이터 테이블 -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">추천 코스 생성</h6>
                        </div>
                        <div class="card-body" id="card-body">
                            <form id="recommendSendDataFrm" action="/admin/adminRecommendWriteOk" method="post">
                               <div class="formDiv">
                                   <div class="formItem">
                                       <span class="itemTitle">제목</span>
                                       <input type="text" id="recTitle" name="recTitle" placeholder="제목을 입력해주세요"/>
                                   </div>

                                   <div class="formItem">
                                       <span class="itemTitle">해시태그</span>
                                       <input type="text" id="recHashtag" name="recHashtag" placeholder="키워드를 입력해주세요"/>
                                   </div>
                                   <div class="formItem">
                                       <span class="itemTitle">설명</span>
                                       <textarea id="recDescription" rows="10" cols="5" name="recDescription" placeholder="코스의 설명을 입력해주세요"></textarea>
                                   </div>

                                   <div class="formItem">
                                       <span class="itemTitle">난이도</span>
                                       <select id="recLevel" name="recLevel" class="recLevel">
                                           <option value="1">1</option>
                                           <option value="2">2</option>
                                           <option value="3">3</option>
                                           <option value="4">4</option>
                                           <option value="5">5</option>
                                       </select>
                                   </div>
                               </div>
                                <textarea style="display:none" name="recommendSendData"></textarea>
                            </form>
                            <!-- kakao map API 불러오기(키 입력) -->
                            <script type="text/javascript"
                                    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d541fce355c305835dd7871d26048357&libraries=services,clusterer,drawing"></script>
                            <div class="map_wrap">
                                <div id="courseInput">
                                    <div class="fromWrap">
                                        <img src="${url}/images/course/fromIcon.png">
                                        <input id="startPoint" type="text" placeholder="출발지를 입력하세요"
                                               class="placeInfoInsert"/>
                                        <input id="startCoordinate" type="hidden"> <input id="startAddr" type="hidden">
                                    </div>
                                    <button type="button" class="changeFromTo">
                                        <img src="${url}/images/course/swap.png">
                                    </button>
                                    <div class="waypoints"></div>
                                    <div class="toWrap">
                                        <img src="${url}/images/course/toIcon.png">
                                        <input id="endPoint" type="text" placeholder="도착지를 입력하세요"/>
                                        <input id="endCoordinate" type="hidden">
                                        <input id="endAddr" type="hidden">
                                    </div>
                                    <button type="button" class="hihi">
                                        <img src="${url}/images/course/addIcon.png" class="btnAddWaypoint"
                                             onclick="addWaypoint()">
                                    </button>
                                    <button type="button" class="hihi">
                                        <img src="${url}/images/course/delete.png"
                                             onclick="deleteAllWaypoint(), removeAllMarkers(), clearAllPolylines()">
                                    </button>
                                    <br/>
                                    <select id="bikeType" onchange="chagebikeType()">
                                        <option value="cycling-regular">일반</option>
                                        <option value="cycling-road">로드</option>
                                        <option value="cycling-mountain">산악</option>
                                        <option value="cycling-electric">전기</option>
                                    </select>
                                    <button type="button" class="w-btn w-btn-blue btnSearchCourse"
                                            onclick="searchAllCourse()">경로 탐색하기
                                    </button>
                                    <div style="width:100%; position:relative;">
                                        <input type="checkbox" id="chkBicycle" onclick="setOverlayMapTypeId()"
                                               style="left: 3px; height: 15px; width: 15px; position: relative;"/>
                                        <span class="grayTxt"
                                              style="position:relative; left: 4px; top:3px;">자전거도로 정보 보기</span>
                                    </div>
                                    <div class="routeInfoWrap">
                                        <div id="routeInfo0" onclick="selectRoute(0)">
                                            <h2 class="routeInfoRgt"
                                                style="width: 200px; font-weight:10px; font-weight: bold; font-size: 20px; top: 6px; position: relative; ">
                                                추천경로</h2>
                                            <span class="routeInfoRgt"
                                                  style="font-size: 1em; font-weight: bold; width: 200px; top: 6px; position: relative;">
								<span id="routeDistance0"></span>
								<span class="routeInfoRgt" id="routeDuration0"></span>
							</span> <br/>
                                            <span class="routeInfoRgt" style="font-size: 0.7em; color: #d0cfcf;"> 상승고도
								<span id="routeAscent0"></span>&nbsp;/ &nbsp;하강고도
								<span id="routeDescent0"></span>
							</span>
                                            <canvas id="myChart0" width="300" height="60"></canvas>
                                            <button class="ridingWriteBtn" onclick="return recommendDataSend(0)"
                                                    type="button"
                                                    style="position: absolute;top: 5px; left: 204px; width: 50px; height: 40px;">
                                                <i class="fas fa-biking"></i></button>
                                        </div>
                                        <div id="routeInfo1" onclick="selectRoute(1)">
                                            <h2 class="routeInfoRgt"
                                                style="width: 200px; font-weight:10px; font-weight: bold; font-size: 20px; top: 6px; position: relative; ">
                                                빠른경로</h2>
                                            <span class="routeInfoRgt"
                                                  style="font-size: 1em; font-weight: bold; width: 200px; top: 6px; position: relative;">
								<span id="routeDistance1"></span>
								<span class="routeInfoRgt" id="routeDuration1"></span>
							</span> <br/>
                                            <span class="routeInfoRgt" style="font-size: 0.7em; color: #d0cfcf;"> 상승고도
								<span id="routeAscent1"></span>&nbsp;/ &nbsp;하강고도
								<span id="routeDescent1"></span>
							</span>
                                            <canvas id="myChart1" width="300" height="60"></canvas>
                                            <button class="ridingWriteBtn" onclick="return recommendDataSend(1)"
                                                    type="button"
                                                    style="position: absolute;top: 5px; left: 204px; width: 50px; height: 40px;">
                                                <i class="fas fa-biking"></i></button>

                                        </div>
                                        <div id="routeInfo2" onclick="selectRoute(2)">
                                            <h2 class="routeInfoRgt"
                                                style="width: 200px; font-weight:10px; font-weight: bold; font-size: 20px; top: 6px; position: relative; ">
                                                최단경로</h2>
                                            <span class="routeInfoRgt"
                                                  style="font-size: 1em; font-weight: bold; width:200px;top: 6px; position: relative;">
								<span id="routeDistance2"></span>
								<span class="routeInfoRgt" id="routeDuration2"></span>
							</span> <br/>
                                            <span class="routeInfoRgt" style="font-size: 0.7em; color: #d0cfcf;"> 상승고도
								<span id="routeAscent2"></span>&nbsp;/ &nbsp;하강고도
								<span id="routeDescent2"></span>
							</span>
                                            <canvas id="myChart2" width="300" height="60"></canvas>
                                            <button class="ridingWriteBtn" onclick="return recommendDataSend(2)"
                                                    type="button"
                                                    style="position: absolute;top: 5px; left: 204px; width: 50px; height: 40px;">
                                                <i class="fas fa-biking"></i></button>
                                        </div>
                                    </div>
                                    </form>
                                    <div class="courseWrap"></div>
                                </div>
                                <div id="map"></div>
                                <div id="menu_wrap" class="bg_white">
                                    <div class="option">
                                        <div>
                                            <form onsubmit="searchPlaces(); return false;">
                                                키워드 : <input type="text" value="" id="keyword" size="15">
                                                <button type="submit">검색하기</button>
                                            </form>
                                        </div>
                                    </div>
                                    <hr>
                                    <ul id="placesList"></ul>
                                    <div id="pagination"></div>
                                </div>
                            </div>
                            <!-- mapWrap -->
                            <script type="text/javascript" src="${url}/js/admin/adminRecommendCreate.js"></script>
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
    <a class="scroll-to-top rounded" href="#page-top"> <i
            class="fas fa-angle-up"></i>
    </a>

    <!-- Bootstrap core JavaScript-->
    <script src="${url}/css/admin/vendor/jquery/jquery.min.js"></script>
    <script
            src="${url}/css/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script
            src="${url}/css/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${url}/js/admin/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script
            src="${url}/css/admin/vendor/datatables/jquery.dataTables.min.js"></script>
    <script
            src="${url}/css/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>
    <!-- Page level custom scripts -->
    <script src="${url}/js/admin/js/demo/datatables-demo.js"></script>
    <script src="${url}/js/admin/adminRecommendView.js"></script>
</main>
