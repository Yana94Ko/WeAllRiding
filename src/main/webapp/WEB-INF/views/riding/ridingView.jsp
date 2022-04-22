<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
<!-- <link href="${url}/css/riding/ridingList.css" rel="stylesheet" type="text/css"> -->
<link href="${url}/css/riding/ridingView.css" rel="stylesheet" type="text/css">
<script src="https://cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>
<script type="text/javascript">
    function ridingViewDel() {
        if (confirm('글을 삭제시겠습니까?')) {
            location.href = "/riding/ridingDel?ridingNo=${vo.ridingNo}";
        }
    }
    function ridingViewEdit() {
        if (confirm('글을 수정하시겠습니까?')) {
            location.href = "/riding/ridingEdit?ridingNo=${vo.ridingNo}";
        }
    }
    function ridingStateOk() {
        if (confirm('승낙 하시겠습니까?')) {
            location.href = "/riding/ridingStateOk?ridingNo=${vo.ridingNo}";
        }
    }

    function ridingMember() {
        event.preventDefault();//form 기본 이벤트 제거
        if (confirm('참가 신청하시겠습니까? \n 신청 후 취소는 어려우니 신중히 생각해주세요. \n ※단, 라이딩은 개설자에 의해 취소될 수 있습니다.※')){
            location.href = "/riding/ridingMemberOk?ridingNo=${vo.ridingNo}";
        }
    }

    function ridingMemberCancel() {
        event.preventDefault();//form 기본 이벤트 제거
        if (confirm('신청 취소 하시겠습니까?')){
            location.href = "/riding/ridingMemberCan?ridingNo=${vo.ridingNo}";
        }
    }
    // 리뷰---
    function ridingReviewListAll() { //현재글의 댓글을 모두 가져오기
        var url = "/riding/ridingReviewList";
        var params = "ridingNo=${vo.ridingNo}"; // 31번 글이면 no=31이 된다.

        $.ajax({
            url : url,
            data : params,
            success : function(result) {
                var $result = $(result); // vo, vo, vo, ,,,
                var tag = "<ul>";
                $result.each(function(idx, vo) {
                    tag += "<li><div id='dddd' style='color:black;'><div id='NN'>" + vo.nickname + "</div>";
                    tag += "<br/><div>" + vo.ridingReviewComent + "</div>";
                    tag += "<div id='CRWD' style='color:lightgray;'>" + vo.ridingReviewWriteDate
                        + "</div></div>";
                    tag += "</li><br/><hr style='backgrond-color:lightgray;'>";
                });
                tag += "</ul>";
                $("#ridingReviewList").html(tag);
            },
            error : function(e) {
                console.log(e.responseText)
            }

        });
    }
    ridingReviewListAll();
    // 댓글----------------
    function ridingReplyListAll() { //현재글의 댓글을 모두 가져오기
        var url = "/riding/ridingReplyList";
        var params = "ridingNo=${vo.ridingNo}"; // 31번 글이면 no=31이 된다.

        $.ajax({
            url : url,
            data : params,
            success : function(result) {
                var $result = $(result); // vo, vo, vo, ,,,
                var tag = "<ul>";
                $result.each(function(idx, vo) {
                    tag += "<li><div id='dddd' style='color:black;'><div id='NN'>" + vo.nickname + "</div>";

                    // 	 'goguma'== goguma
                    if (vo.nickname == '${nickName}') {
                        tag += "<input type='button' value='삭제' id='ridingReplyListDel' title='"+vo.ridingReplyNo+"' onclick='ridingReplyListDel()' />";
                        tag += "<input type='button' value='수정' id='ridingReplyListEdit'/>";
                    }
                    tag += "<br/><div>" + vo.ridingReplyComent + "</div>";
                    tag += "<div id='CRWD' style='color:lightgray;'>" + vo.ridingReplyWriteDate
                        + "</div></div>";
                    let subscriber = $("#subscriber").val()
                    //본인글일때 수정폼이 있어야 한다.
                    if (subscriber == '${nickName}') {
                        tag += "<div style='display:none' id='abcd'><form method='post'>";
                        tag += "<input type='hidden' name='ridingReplyNo' value='"+vo.ridingReplyNo+"'/>";
                        tag += "<textarea name='ridingReplyComent' style='width:500px; height:50px;'>"
                            + vo.ridingReplyComent
                            + "</textarea>";
                        tag += "<input type='submit' value='수정' id='ridingReplyListEditOk'/>";
                        tag += "</form></div>";
                    }
                    tag += "</li><br/><hr style='backgrond-color:lightgray;'>";
                });
                tag += "</ul>";
                $("#ridingReplyList").html(tag);
            },
            error : function(e) {
                console.log(e.responseText)
            }

        });
        // 댓글 수정(Edit)버튼 선택 시 해당폼 보여주기
        $(document).on('click', '#ridingReplyList input[value=수정]',
            function() {
                $(this).parent().css("display", "none"); //숨기기
                //보여주기
                $(this).parent().next().css("display", "block");
            });
        // 댓글 수정(DB)
        $(document).on('submit', '#ridingReplyList form', function() {
            event.preventDefault();
            //데이터 준비
            var params = $(this).serialize();
            var url = '/riding/ridingReplyEditOk';
            $.ajax({
                url : url,
                data : params,
                type : 'POST',
                success : function(result) {
                    console.log(result);
                    ridingReplyListAll();
                },
                error : function() {
                    console.log('수정에러발생');
                }
            });
        });
        // 댓글 삭제
        $(document).on('click', '#ridingReplyList input[value=삭제]', function() {
            if (confirm('댓글을 삭제하시겠습니까?')) {
                var params = "ridingReplyNo=" + $(this).attr("title");
                $.ajax({
                    url : '/riding/ridingReplyDel',
                    data : params,
                    success : function(result) {
                        console.log(result);
                        ridingReplyListAll();
                    },
                    error : function() {
                        console.log("댓글삭제에러발생")
                    }
                });
            }
        });
    }

    // 댓글등록
    function ridingReplyFrm(){
        event.preventDefault();//form 기본 이벤트 제거
        if ($("#ridingReplyComent").val() == "") {//댓글 안쓴경우
            alert("댓글을 입력후 등록하세요");
            return;
        } else {//댓글 입력한경우
            var params = $("#ridingReplyFrm").serialize();
            $.ajax({
                url : '/riding/ridingReplyWriteOk',
                data : params,
                type : 'POST',
                success : function() {
                    //폼을초기화
                    $("#ridingReplyComent").val("");
                    //댓글 목록 refresh되어야 한다.
                    ridingReplyListAll();
                },
                error : function(e) {
                    console.log(e.responseText);
                }
            });
        }
    }
    ridingReplyListAll();

</script>
<!-- parallax START -->
<div class="home">
    <div class="homeBackground parallaxWindow" data-parallax="scroll"
         data-image-src="${url}/images/home/home_background.png"></div>
    <!-- 배경 이미지 -->
    <div class="homeContent">
        <div class="homeTitle">라이딩 목록</div>
        <!-- 페이지 타이틀 -->
    </div>
</div>
<!-- parallax END -->
<main>
    <div class="container">
        <div class="containerWrap">
            <div class="ridingViewContainer">
                <form method='post'>
                    <textarea style="display:none" id="courseSendData"
                              name="courseSendData">${vo.courseSendData}</textarea>
                    <input type="hidden" name="applicantCnt" value="${vo.applicantCnt }"/>
                    <ul>
                        <div class="flexDiv-1">
                            <input type="hidden" value=${vo.ridingNo} id="dbRidingNo"/>
                            <input type="hidden" value=${resolveStatus} id="resolveStatus"/>
                            <span class="flexDiv-1-1">${vo.ridingSubject }</span><br>
                            <div class="flexDiv-1-2">
                                <span class="flexDiv-1-2-1">${vo.nickname}  | ${vo.ridingWriteDate }</span>
                                <input type="hidden" id="subscriber" value="${vo.nickname}"/>
                                <span class="flexDiv-1-2-3"> 조회 ${vo.ridingHit}</span>
                            </div>
                        </div>
                        <br><br>

                        <li class="keyword">${vo.ridingKeyword }</li>
                        <br>
                        <br><br>
                        <h2>코스 정보</h2><br>
                        <div class="item2">
                            <div class="item2-1">코스</div>
                            <div class="item2-2">
                                <span id="startPoint"></span>&nbsp;-&nbsp;
                                <span id="waypoint"></span>
                                <span id="endPoint"></span>
                            </div>
                        </div>

                        <script type="text/javascript"
                                src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d541fce355c305835dd7871d26048357&libraries=services,clusterer,drawing"></script>
                        <div>
                            <div id="map" style="width:100%;height:600px;"></div>
                            <br>
                            <li id="courseInfoLst" class="courseInfoLst">
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
                            </li>
                            <hr>

                            <br>
                            <li id="dateAll" style="color: black;" class="dateAll">
                                <h2 id="ridingViewTitle">일정</h2> <br>
                                <input type="text" name="startDate" class="ridingDate" value="${vo.startDate }"
                                       readonly> -
                                <input type="text" name="endDate" class="ridingDate" value="${vo.endDate }" readonly>
                            </li>
                            <br><br><br><br><br><br>
                            <li id=courseLevel style="color: black" class="courseLevel">
                                <h2>난이도</h2><br>
                                <input type="text" class="ridinglevel" value="${vo.courseLevel }" readonly>
                            </li>
                            <br><br><br><br><br><br>
                            <h2 id="ridingViewTitle">내용</h2><br>
                            <li class="ridingContent">${vo.ridingContent }</li>
                            <br><br>
                            <hr>
                            <c:if test="${nickName == vo.nickname }">
                            <li id="ridingViewBTN">
                                <!-- <button id="ridingwriteBtn">글 수정</button> -->
                                <input type="button" class="btnDel2" id="ridingViewDelBtn" onclick="ridingViewDel()"
                                       value="글 삭제"/>
                                <input type="button" class="btnEdit2" id="ridingViewEditBtn" onclick="ridingViewEdit()"
                                       value="글 수정"/>
                            </li>
                            </c:if>
                            <br><br><br><br>
                            <h2>라이딩 참가자</h2><br>
                            <c:if test="${nickName == vo.nickname }">
                            <ul id="eList">
                                <li id="eListFirst">참가 상태</li>
                                <li id="eListFirst">닉네임</li>
                                <li id="eListFirst">성별</li>
                                <li id="eListFirst">모임 횟수</li>
                                <li id="eListFirst">유저 레벨</li>
                                <li id="eListFirst">승낙/거절</li>
                                <c:forEach var="vo" items="${lst2 }" varStatus="st">
                                    <c:if test="${vo.ridingNo == vo.ridingNo}">
                                        <li><span id="forWriterRidingState${st.index}"><a
                                                href="/member/loginForm">열람하기</a></span><input type="hidden"
                                                                                               id="dbForWriterRidingState${st.index}"
                                                                                               value="${vo.ridingState}"/>
                                        </li>
                                        <li>${vo.nickname }</li>
                                        <li>${vo.gender }</li>
                                        <li>${vo.ridingCount }</li>
                                        <li>${vo.userScore }</li>
                                        <li>
                                            <input type='button' id="ridingStateDeleteBtn${st.index}"
                                                   class="applicantDel" value="거절">
                                            <input type='button' id="ridingStateUpdateBtn${st.index}"
                                                   class="applicantSave" value="승낙">
                                            <span id="togetherRiding${st.index}"></span>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                            </c:if>
                            <c:if test="${nickName != vo.nickname }">
                            <ul id="vList">
                                <li id="vListFirst">참가 상태</li>
                                <li id="vListFirst">닉네임</li>
                                <li id="vListFirst">성별</li>
                                <li id="vListFirst">모임 횟수</li>
                                <li id="vListFirst">유저 레벨</li>
                                <c:forEach var="vo" items="${lst2 }" varStatus="st">
                                    <c:if test="${vo.ridingNo == vo.ridingNo}">
                                        <li><span id="ridingState${st.index}"><a
                                                href="/member/loginForm">열람하기</a></span><input type="hidden"
                                                                                               id="dbRidingState${st.index}"
                                                                                               value="${vo.ridingState}"/>
                                        </li>
                                        <li>${vo.nickname }</li>
                                        <li>${vo.gender }</li>
                                        <li>${vo.ridingCount }</li>
                                        <li>${vo.userScore }</li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                            </c:if>
                            <form id="nicknameTest">
                                <input type="text" name="applicantNickName" id="applicantNickName"
                                       style="display:none;">
                            </form>
                            <br><br><br> ${vo.applicantNickName}

                            <c:if test="${nickName != vo.nickname }">
                            <li>
                                <input type="hidden" id="loginNickName" value=${nickName}/>
                                <input type="button" id="ridingMemberBtn" onclick="ridingMember()" value="라이딩 신청하기"/>
                                <input type="button" id="ridingdelBtn" onclick="ridingMemberCancel()" value="라이딩 신청취소"/>
                            </li>
                            </c:if>
                            <c:if test="${userId == vo.nickname }">
                            <div id="viewBTN">
                                <button type="button" class="btnDel" id="delBtn" onclick="javascript:ridingViewDel()">글
                                    삭제
                                </button>
                                <button type="button" class="btnEdit" id="editBtn"
                                        onclick="javascript:ridingViewEdit()">글 수정
                                </button>
                            </div>
                            </c:if>

                            <c:if test="${vo.endDate < today }">
                            <div id="listTitle">라이딩 후기</div>
                            <hr>
                            <div id="ridingReviewList"></div>
                            </c:if>
                    </ul>
                </form>
                <br>
                <hr>
                <br>

                <div id="listHeader">
                    <!-- 댓글 쓰기 폼 -->
                    <c:if test="${logStatus=='Y' }">
                        <form method='post'>
                            <input type="hidden" name="ridingNo" value="${vo.ridingNo }"/>
                            <textarea id="ridingReplyComent" name="ridingReplyComent"
                                      style="width: 100%; height: 100px;"></textarea><br>
                            <input id="ridingReplyBtn" type="button" value="댓글등록" id="replyBtn"
                                   onclick="ridingReplyFrm('${nickName}', ${vo.ridingNo})">
                        </form>
                    </c:if>
                    <!-- 댓글목록이 나올 자리 -->
                    <div id="ridingReplyList"></div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="${url}/js/riding/ridingView.js"></script>
</main>