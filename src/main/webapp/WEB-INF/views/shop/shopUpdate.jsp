<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${url}/css/shop/shopViewStyle.css">
<!-- parallax START -->
<div class="home">
	<div class="homeBackground parallaxWindow" data-parallax="scroll"
		data-image-src="${url}/images/home_background.png"></div>
	<!-- 배경 이미지 -->
	<div class="homeContent">
		<div class="homeTitle">정비샵 정보 업데이트</div>
		<!-- 페이지 타이틀 -->
	</div>
</div>
<!-- parallax END -->
<main>
	<h1>${shopName}</h1>
	<h3>정비샵 주소 : ${shopRoadAddress}</h3>
	<h3>정비샵 전화번호 : ${shopPhone}</h3>
	<form action="/shopUpdateOk" method="post">
		<input type="hidden" id="shopId" name="shopId" value=${shopId}>
		<textarea id="shopInfo" name="shopInfo">${shopVO.shopInfo}</textarea>
		<input type="submit" value="정비샵 정보 수정"></input>
	</form>
</main>