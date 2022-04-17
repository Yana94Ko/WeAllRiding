<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="${url}/css/ideal/idealView.css">

<!-- parallax START -->
<div class="home">
	<div class="homeBackground parallaxWindow" data-parallax="scroll"
		data-image-src="${url}/images/home_background.png"></div>
	<!-- 배경 이미지 -->
	<div class="homeContent">
		<div class="homeTitle">이상형 월드컵</div>
		<!-- 페이지 타이틀 -->
	</div>
</div>
<!-- parallax END -->
<main onload="preLoaingImg()">
	<div class="wrap">
		<p id="roundTitle">이상형 월드컵에 참여해 주세요.</p>
		<div class="content default" id="content">
			<button id="btnGameStart" onclick="start()">게임 참여</button>
		</div>
		<footer class="footer soff" id="footer">
			<button id="cancel" onclick="idealView.Event.clickCancel()">취소</button>
			<button id="prev" onclick="idealView.Event.clickPrev()">이전</button>
		</footer>
	</div>
	<script src="${url}/js/ideal/idealView.js?ver=2" async defer></script>
	<script>
      function start() {
        idealView.start();
      }
      function preLoaingImg() {
        const preLoadingList = [
          '${url}/images/ideal/bikes/01.jpg', '${url}/images/ideal/bikes/02.jpg', '${url}/images/ideal/bikes/03.jpg', '${url}/images/ideal/bikes/04.jpg', '${url}/images/ideal/bikes/05.jpg', '${url}/images/ideal/bikes/06.jpg', '${url}/images/ideal/bikes/07.jpg', '${url}/images/ideal/bikes/08.jpg', '${url}/images/ideal/bikes/09.jpg', '${url}/images/ideal/bikes/10.jpg', '${url}/images/ideal/bikes/11.jpg', 'images/12.jpg', '${url}/images/ideal/bikes/13.jpg', '${url}/images/ideal/bikes/14.jpg', '${url}/images/ideal/bikes/15.jpg', '${url}/images/ideal/bikes/16.jpg'
        ], length = preLoadingList.length, tObj = document.getElementsByTagName("BODY")[0];
        let i = 0, imgNode;
        const hiddenNode = document.createElement('DIV');
        hiddenNode.className = 'pre_load soff';
        for(i; i < length; i++) {
          imgNode = document.createElement('IMG');
          imgNode.setAttribute('src', preLoadingList[i]);
          hiddenNode.appendChild(imgNode);
        }
        tObj.appendChild(hiddenNode);
      }
    </script>
</main>