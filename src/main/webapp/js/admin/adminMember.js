function AdminMemberDelete() {
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
                    location.href = "/admin/adminMember";
                }
            })
            .catch((res) => {
                alert(res);
                alert("에러 발생. 운영자에게 문의해주세요")
            })
    }
}
