<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	function del() {
		if (confirm('삭제할까요?')) {
			location.href = "/comty/comtyDel?comtyNo=${vo.comtyNo}";
		}
	}
</script>
<main>
   <div class="comtyContainer">
      <h1>글내용보기</h1>
      번호 : ${vo.comtyNo }<br /> 작성자 : ${vo.nickname }<br /> 작성일 :
      ${vo.comtyWriteDate }, 조회수 : ${vo.comtyHit }<br /> 제목 :
      ${vo.comtySubject }<br /> 글 내용<br /> ${vo.comtyContent } <br /> <br />
      
      <c:if test="${logId == vo.nickname }">
         <a href="/comty/comtyEdit?comtyNo=${vo.comtyNo}">수정</a> 
         <a href="javascript:del()">삭제</a>
      </c:if>
   </div>
</main>