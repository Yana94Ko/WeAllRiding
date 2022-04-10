<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${url}/css/shop/shopViewStyle.css">
<main>
	<h1>${shopName}</h1>
	<h3>정비샵 주소 : ${shopRoadAddress}</h3>
	<h3>정비샵 전화번호 : ${shopPhone}</h3>
	<form action="/shopWriteOk" method="post">
		<input type="hidden" id="shopId" name="shopId" value=${shopId}>
		<textarea id="shopInfo" name="shopInfo"></textarea>
		<input type="submit" value="정비샵 정보 등록"></input>
	</form>
</main>