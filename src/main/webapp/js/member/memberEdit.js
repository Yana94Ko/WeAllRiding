function MemberEditCheck() {
    const userpwd = document.getElementById("userPwd");
    const userpwd2 = document.getElementById("userPwd2")
    var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
    if(!userpwd.value || !userpwd2.value){
        alert("비밀번호를 입력하세요");
        userpwd.focus();
        return false;
    }
    if(userpwd.value!=userpwd2.value){
        alert("비밀번호가 일치하지 않습니다.");
        userpwd.focus();
        return false;
    }
    if(!pwdCheck.test(userpwd.value)) {
        alert("비밀번호는 영문, 숫자, 특수기호를 조합으로 8~25자를 입력해야합니다.");
        userpwd.focus();
        return false;
    }
    const nickname = document.getElementById("nickname")
    if(!nickname.value){
        alert("닉네임을 입력하세요");
        nickname.focus();
        return false;
    }
    const userEmail = document.getElementById("userEmail")
    var emailCheck = /^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$/;
    if(!userEmail.value){
        alert("이메일을 입력해주세요.");
        userEmail.focus();
        return false;
    }
    if(!emailCheck.test(userEmail.value)) {
        alert("이메일 형식으로 입력해주세요.")
        userEmail.focus();
        return false;
    }
}
function MemberDelete(){
    const userid = document.getElementById("userId")
    const userpwd = document.getElementById("userPwd");
    const userpwd2 = document.getElementById("userPwd2")
    const body = {
        userId : userid.value,
        userPwd : userpwd.value
    }
    if(confirm("정말로 탈퇴하시겠습니까?")) {
        axios.post("/member/MemberDelete", body)
            .then((res) => {
                if(res.data===0){
                    alert("비밀번호를 확인해주세요")
                } else {
                    alert("이용해주셔서 감사합니다");
                    window.location="/member/logout";
                }
            })
            .catch((res) => {
                alert(res);
                alert("에러 발생. 운영자에게 문의해주세요")
            })
    }
}