<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	.comtyContainer {
		padding: 50px;
	}
	#comtyFrm{
		color:black;
		float: right;
	}
	#comtyViewContent {
		min-height:400px;
		height:100%;
		color:black;
	}
	#editBtn {
		background-color: rgba(255, 217, 102);
		padding: 10px 50px;
		margin: 0px;
		border-radius: 6px;
		border-color: rgba(204, 204, 204);
		float: right;
	}
	#delBtn {
		background-color: rgba(231, 76, 60);
		padding: 10px 50px;
		margin: 0px 20px;
		border-radius: 6px;
		border-color: rgba(204, 204, 204);
		float: right;
	}
</style>
<script>
	function del() {
		if (confirm('글을 삭제시겠습니까?')) {
			location.href = "/comty/comtyDel?comtyNo=${vo.comtyNo}";
		}
	}
	function edit() {
		if (confirm('글을 수정하시겠습니까?')) {
			location.href = "/comty/comtyEdit?comtyNo=${vo.comtyNo}";
		}
	}
</script>
<main>
	<div class="comtyContainer">
		<h2>${vo.comtySubject }</h2>
		<hr/>
		<li id="comtyFrm">
			글 번호 : ${vo.comtyNo }&nbsp;&nbsp;&nbsp;&nbsp;
			작성자 : ${vo.nickname }&nbsp;&nbsp;&nbsp;&nbsp;
			작성일 : ${vo.comtyWriteDate }&nbsp;&nbsp;&nbsp;&nbsp;
			조회수 : ${vo.comtyHit }&nbsp;&nbsp;
		</li> 
		<br/>
		<hr/>
		<li id="comtyViewContent">${vo.comtyContent }</li>
		
		<c:if test="${logId == vo.nickname }">
			<div id="viewBTN">
				<button id="editBtn" onclick="javascript:edit()">글 수정</button>
				<button id="delBtn" onclick="javascript:del()">글 삭제</button>
			</div>
		</c:if>
	</div>
</main>