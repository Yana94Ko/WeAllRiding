<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="${url}/css/riding/ridingWrite.css" rel="stylesheet" type="text/css">
<script src="https://cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>
<!-- parallax START -->
<div class="home">
    <div class="homeBackground parallaxWindow" data-parallax="scroll"
         data-image-src="${url}/images/home/home_background.png"></div>
    <!-- 배경 이미지 -->
    <div class="homeContent">
        <div class="homeTitle">라이딩 개설하기</div>
        <!-- 페이지 타이틀 -->
    </div>
</div>
<!-- parallax END -->
<main>
    <div class="container">
        <div class="containerWrap">
            <div class="ridingContainer">
                <form method="post" action="/riding/ridingWriteOk" id="ridingFrm">
                    <textarea style="display:none" id="courseSendData"name="courseSendData">${rVO.courseSendData}</textarea>
                    <ul>
                        <h1>라이딩 개설</h1><br><br>
                        <h2>제목</h2>
                        <li><input type="text" name="ridingSubject" id="ridingSubject" class="ridingSubject"/></li><br>
                        <h2>키워드</h2>
                        <li><input type="text" name="ridingKeyword" id="ridingKeyword" class="ridingSubject" placeholder="ex)  #순천  #광양"/></li><br/>
                        <li>
                            <div class="btnContainer" id="courseMakeLst">
                                <a href="${url}/courseCreate" class="btn btn-1">나만의 코스 만들기</a>
                                <a href="${url}/recommendView" class="btn btn-4">추천 코스로 라이딩 만들기</a>
                            </div>
                        </li>
                        <h2 class="hiddenIfNone2">코스 정보</h2>
                        <div class="item2 hiddenIfNone2" >
                            <div class="item2-1 ">코스</div>
                            <div class="item2-2 ">
                                <span id="startPoint"></span>&nbsp;-&nbsp;
                                <span id="waypoint"></span>
                                <span id="endPoint"></span>
                            </div>
                        </div>

                        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d541fce355c305835dd7871d26048357&libraries=services,clusterer,drawing"></script>
                        <div class="hiddenIfNone"><div id="map" style="width:100%;height:400px;"></div><br>
                            <li class="courseInfoLst">
                                <div class="item">
                                    <div class="item-1">
                                        <div class="item-1-1">총 거리</div>
                                        <div class="item-1-2"><span id="distance"></span><br/></div>
                                    </div>
                                    <div class="item-1">
                                        <div class="item-1-1">소요 시간</div>
                                        <div class="item-1-2"><span id="duration"></span><br/></div>
                                    </div>
                                    <div class="item-1">
                                        <div class="item-1-1">상승 고도</div>
                                        <div class="item-1-2"><span id="ascent"></span></div>
                                    </div>
                                    <div class="item-1">
                                        <div class="item-1-1">하강 고도</div>
                                        <div class="item-1-2"><span id="descent"></span></div>
                                    </div>
                                </div>
                                <div class="item">
                                    <canvas id="myChart" width="1060" height="400"></canvas>
                                </div>
                            </li><hr>

                            <li id="dateAll" class="dateAll">
                                <h3>일정</h3>
                                <input type="date" name="startDate" id="startDate" class="ridingDate"> - <input type="date" name="endDate" id="endDate" class="ridingDate">
                            </li>

                            <li id=courseLevel class="courseLevel">
                                <h3>난이도</h3>
                                <select id="courseLevel" name="courseLevel">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </li>

                            <li id="maxUser" class="maxUser">
                                <h3>참가인원</h3>
                                <select id="maxUser" name="maxUser">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </li>
                            <br/><br/><br/><br/><br/>
                            <h3>라이딩 설명</h3>
                            <li><textarea name="ridingContent" id="ridingContent" class="ridingContent"/></textarea>
                            </li>

                            <li id="ridingwriteBTN">
                                <button type="button" onclick="submitRidingFrm()" id="ridingwriteBtn" class="ridingwriteBtn">글 등록</button>
                            </li>
                    </ul>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="${url}/js/riding/ridingWrite.js"></script>
</main>