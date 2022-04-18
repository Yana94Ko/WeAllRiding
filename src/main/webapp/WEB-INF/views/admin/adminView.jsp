<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
    function MemberDelete() {
        const userid = document.getElementById("userId")
        const userpwd = document.getElementById("userPwd");
        const body = {
            userId: userid.value,
            userPwd: userpwd.value
        }
        if (confirm("정말로 탈퇴시키겠습니까?")) {
            axios.post("/member/MemberDelete", body)
                .then((res) => {
                    if (res.data === 0) {
                        alert("회원정보를 확인해주세요")
                    } else {
                        location.href = "/admin/adminMain";
                    }
                })
                .catch((res) => {
                    alert(res);
                    alert("에러 발생. 운영자에게 문의해주세요")
                })
        }
    }
</script>
<main>
    <h2>회원정보 상세</h2>
    <form name="form1" method="post" action="/admin/adminMemberEdit">
        <table border="1">
            <tr>
                <td>아이디</td>
                <td><input name="userId" id="userId" value="${av.userId}" readonly="readonly"></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" id="userPwd" value="${av.userPwd}" name="userPwd"></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input name="userName" value="${av.userName}"></td>
            </tr>
            <tr>
                <td>닉네임</td>
                <td><input type="text" name="nickname" value="${av.nickname}"></td>
            </tr>
            <tr>
                <td>연락처</td>
                <td><input name="userTel1" value="${av.userTel1}" readonly="readonly"></td>
                <td><input name="userTel2" value="${av.userTel2}" readonly="readonly"></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><input type="text" name="userEmail" value="${av.userEmail}"></td>
            </tr>
            <tr>
                <td>생년월일</td>
                <td><input type="date" name="birth" value="${av.birth}"></td>
            </tr>
            <tr>
                <td>회원정지일</td>
                <td><input type="datetime-local" name="suspendDate" value="${av.suspendDate}"></td>
            </tr>
        </table>
        <button type="submit">회원정보 수정</button><button type="button" onclick="MemberDelete()">회원 삭제</button>
    </form>
</main>
