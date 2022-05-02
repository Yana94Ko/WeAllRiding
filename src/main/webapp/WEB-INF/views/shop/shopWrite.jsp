<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${url}/css/shop/shopWriteStyle.css"/>
<!-- parallax START -->
<div class="home">
	<div class="homeBackground parallaxWindow" data-parallax="scroll"
		data-image-src="${url}/images/home_background.png"></div>
	<!-- 배경 이미지 -->
	<div class="homeContent">
		<div class="homeTitle">정비샵 정보 등록</div>
		<!-- 페이지 타이틀 -->
	</div>
</div>
<!-- parallax END -->
<main>
	<div class="container">  
	  	<form action="/shopWriteOk" method="post" id="shop">
			<input type="hidden" id="shopId" name="shopId" value=${shopId}>
			<input type="hidden" id="shopName" name="shopName" value=${shopName}>				
			<h3>${shopName}</h3>
			<h4>정비샵 정보를 공유해주세요</h4>
			<fieldset>
				<input type="text" id="shopRoadAddress" value="${shopRoadAddress}" disabled/>
			</fieldset>	
			<fieldset>
				<input type="tel" id="shopPhone" value="${shopPhone}" disabled/>
			</fieldset>	
			<fieldset>
				<textarea id="shopInfo" name="shopInfo" placeholder="정비샵 정보를 적어주세요..." tabindex="5" required></textarea>
			</fieldset>
			<fieldset>
				<button name="submit" type="submit" id="contact-submit" data-submit="...Sending">정보 등록</button>
			</fieldset>
		</form>
	</div>
</main>

