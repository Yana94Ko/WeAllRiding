function MemberCheck() {
    const userid = document.getElementById("userId");
    if(!userid.value){
        alert("아이디를 입력하세요..");
        userid.focus();
        return false;
    }
    const userpwd = document.getElementById("userPwd");
    const userpwd2 = document.getElementById("userPwd2")
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
    const username = document.querySelector("#username");
    if(!username.value){
        alert("이름을 입력하세요");
        username.focus();
        return false;
    }
    const tel2 = document.querySelector("#userTel2");

    const regExp = /^[0-9]{7,8}$/;
    if(!regExp.test(tel2.value)){
        alert("연락처를 입력하세요");
        tel2.focus();
        return false;
    }
}