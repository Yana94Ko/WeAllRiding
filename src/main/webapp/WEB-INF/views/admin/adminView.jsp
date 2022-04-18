<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

<main>
    <h2>회원정보 상세</h2>
    <form name="form1" method="post">
        <table border="1">
            <c:forEach items="${AdminView}" var="av">
            <tr>
                <td>아이디</td>
                <td><input name="userId" value="${av.userId}" readonly="readonly"></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="userPwd"></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input name="userName" value="${av.userName}"></td>
            </tr>
            <tr>
                <td>연락처</td>
                <td><input name="userTel" value="${av.userTel}" readonly="readonly"></td>
            </tr>
            <tr>
                <td>생년월일</td>
                <td><input name="birth" value="${av.birth}"></td>
            </tr>
            </c:forEach>
        </table>
    </form>
</main>
