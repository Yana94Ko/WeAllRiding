<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	document.addEventListener("DOMContentLoaded", function(){
		axios.get("/admin/availableRiding")
				.then((res) => {
					document.getElementById("ridingCount").innerText = `참여 가능한 라이딩 : ${'${res.data}'}개`
				})
				.catch((error) => {
					console.log(error);
				});
		axios.get("/admin/todayRiding")
				.then((res) => {
					document.getElementById("todayRiding").innerText = `오늘 개설된 라이딩 : ${'${res.data}'}개`
				})
				.catch((error) => {
					console.log(error);
				})
		axios.get("/admin/availableCourse")
				.then((res) => {
					document.getElementById("courseCount").innerText = `경험 가능한 추천 코스 : ${'${res.data}'}개`
				})
				.catch((error) => {
					console.log(error);
				})
	});
</script>
<main>
	<div class="container">
	  <section class="background">
	    <div class="content-wrapper">
	      <p class="content-title">We All Riding</p>
	      <p class="content-subtitle">라이더들이 라이딩을 즐길 수 있게 함께 돕는 공간입니다.</p>
	      <p id="ridingCount" class="content-subtitle"></p>
	      <button class="w-btn-neon2 " type="button" onclick="location.href='${url}/riding/ridingList'">
				라이딩 함께 하기
			</button>
	    </div>
	  </section>
	  <section class="background">
	    <div class="content-wrapper">
	      <p class="content-title">새로운 곳으로의 여행 </p>
	      <p id="courseCount" class="content-subtitle"></p>
	      <button class="w-btn w-btn-gra1 w-btn-gra-anim" type="button" onclick="location.href='${url}/recommendView'">
				새로운 경험으로 출발
			</button>
	    </div>
	  </section>
  	  <section class="background">
	    <div class="content-wrapper">
	      <p class="content-title">여행 중 의지 할 친구를 만들고 싶나요?</p>
	      <p id="todayRiding" class="content-subtitle"></p>
	      <button class="w-btn w-btn-gra1 w-btn-gra-anim" type="button" onclick="location.href='${url}/courseCreate'">
				새로운 여정 만들기
			</button>
	    </div>
	  </section>
	  <section class="background">
	    <div class="content-wrapper">
			<p class="content-title">여행 중 자전거가 망가진 적이 있었나요?</p>
			<p class="content-subtitle">내 주변 자전거 공임 정보 위키</p>
			<button class="w-btn w-btn-gra1 w-btn-gra-anim" type="button" onclick="location.href='${url}/shopView';">
				정보 나누러 가기
			</button>
	    </div>
	  </section>
	  <section class="background">
	    <div class="content-wrapper">
			<p class="content-title">나에게 맞는 자전거를 못 찾으셨나요?</p>
			<p class="content-subtitle">나도 모르는 내 취향 찾기</p>
			<button class="w-btn w-btn-gra1 w-btn-gra-anim" type="button" onclick="location.href='${url}/idealView';">
				바로가기
			</button>
	    </div>
	  </section>
	</div>
</main>
<!-- 메인페이지 start -->
<link rel="stylesheet" type="text/css" href="${url}/css/home/homeStyle.css">
<link rel="stylesheet" type="text/css" href="${url}/css/plugins/buttonStyle.css">

<script src='https://cdnjs.cloudflare.com/ajax/libs/lodash.js/3.10.1/lodash.min.js'></script>
<script type="text/javascript" src="${url}/js/home/homeScript.js"></script>
<!-- 메인페이지 스크립트 end -->
