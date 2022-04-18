'<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.comtyContainer {
	width: 80%;
	margin: 0 auto;
	padding: 0 auto;
}

#comtyFrm {
	background-color: rgba(234, 234, 234);
	width: 100%;
	height: 25px;
	color: black;
	text-align: right;
	padding: 10px 0 10px;
}

#comtyViewContent {
	min-height: 400px;
	height: 100%;
	color: black;
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
	//댓글
	$(function(){
		//2. 댓글 목록을 가져오는 함수
		function replyListAll(){//현재 글의 댓글을 모두 가져오기
			var url = "/comty/reply/list";
			var params = "comtyNo=${vo.comtyNo}";
			$.ajax({
				url:url,
				data:params,
				success:function(result){
					var $result = $(result);//vo,vo,vo....
					
					var tag="<hr/><ul>";
					
					$result.each(function(idx, vo){
						tag += "<li><div>"+vo.nickname;
						tag += "("+vo.comtyReplyWriteDate+")";
						if(vo.nickname=='${userId}'){
							tag += "<input type='button' value='Edit'/>";
							tag += "<input type='button' value='Del' title='"+vo.comtyReplyNo+"'/>";
						}
						
						tag += "<br/><br/>"+vo.comtyReplyComent+"</div>";
						if(vo.userid=='${userId}'){
							tag += "<div style='display:none;'><form method='post'>";
							tag += "<input type='hidden' name = 'replyno' value='"+vo.comtyReplyNo+"'/>";
							tag += "<textarea name='coment' style='width:400px;'>"+vo.comtyReplyComent+"</textarea>";
							tag += "<input type='submit' value='수정'/>";
							tag += "</form></div>"
						}
						
						tag += "<hr/></li>";
					});
					
					tag+="</ul>";
					
					$("#replyList").html(tag);
					
				},error:function(e){
					console.log(e.responseText);
				}
			});
			
		}
		//1. 댓글 등록
		$("#replyFrm").submit(function(){
			event.preventDefault();//from 기본 이벤트 제거
			if($("#comtyReplyComent").val()==""){//댓글을 입력하지 않은 경우
				alert("먼저, 댓글을 입력해주세요!");
				return;
			}else{//댓글을 입력한 경우
				//form에 있는 데이터를 params에 담기
				var params = $("#replyFrm").serialize();
			
				$.ajax({
					url:'/reply/writeOk',
					data:params,
					type:'POST',
					success:function(r){//결과물이 r에 담김
						//1)폼에 입력된 내용을 지움
						$("#comtyReplyComent").val("");
						console.log("r",r);						
						//댓글 목록 refresh되어야 함
						replyListAll();
						
					},error:function(e){
						console.log(e.responseText);
					}
				});
			}
		});
	
		//댓글수정 버튼 클릭시 해당 폼 보여주기
		$(document).on('click','#replyList input[value=Edit]',function(){
			$(this).parent().css("display","none");//숨기기
			$(this).parent().next().css("display","block");//보여주기
		})
		//댓글 수정 DB 작업
		$(document).on('submit','#replyList form',function(){
			event.preventDefault();
			//데이터
			var params=$(this).serialize();
			var url='/comty/reply/editOk';
			$.ajax({
				url:url,
				data:params,
				type:'POST',
				success:function(result){
					console.log(result);
					replyListAll();
				},error:function(){
					console.log('수정에러 발생');
				}
			})
		});
	
		//4. 댓글 삭제
		$(document).on('click','#replyList input[value=Del]',function(){
			if(confirm('댓글을 삭제하시려구요?')){
				var params = "replyno="+$(this).attr("title");
				$.ajax({
					url:'/comty/reply/del',
					data:params,
					success:function(result){
						console.log(result);
						replyListAll();
					},error:function(){
						console.log("댓글 삭제 에러");
					}
				});
			}
		});
		
		//현재 글의 댓글
		replyListAll();
</script>
<main>

	<div class="comtyContainer">
		<h2>${vo.comtySubject }</h2>
		<ul>
			<li id="comtyFrm">글 번호 : ${vo.comtyNo }&nbsp;&nbsp;&nbsp;&nbsp;
				작성자 : ${vo.nickname }&nbsp;&nbsp;&nbsp;&nbsp; 작성일 :
				${vo.comtyWriteDate }&nbsp;&nbsp;&nbsp;&nbsp; 조회수 : ${vo.comtyHit }&nbsp;&nbsp;&nbsp;
			</li>
		</ul>
		<ul>
			<li id="comtyViewContent">${vo.comtyContent }</li>
		</ul>
		<c:if test="${userId == vo.nickname }">
			<div id="viewBTN">
				<button id="editBtn" onclick="javascript:edit()">글 수정</button>
				<button id="delBtn" onclick="javascript:del()">글 삭제</button>
			</div>
		</c:if>
		
		<!-- 댓글쓰기 -->
	<c:if test="${logStatus=='Y'}">
		<form method='post' id='replyFrm'>
			<input type="hidden" name="comtyNo" value="${vo.comtyNo}"/>
			<textarea name="coment" id='coment'style='width:500px;height:80px;'></textarea>
			<input type="submit" value="댓글등록"/>
		</form>
	</c:if>
	<hr/>
	<!-- 댓글 목록 나올 자리 -->
	<div id="replyList">
	</div>
</main>