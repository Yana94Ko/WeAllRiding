let certPass = false; // 본인인증을 위한 변수
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
    if(certPass){
        alert("본인인증을 완료해주세요");
        return false;
    }
}
let code = ""; // 서버에서 받게될 인증번호
function SendPhoneCheck() {
    alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호를 확인해주십시오.");
    const userTel = document.getElementById("userTel1").value+document.getElementById("userTel2").value;
    axios.get('/member/phoneCheck?userTel='+userTel) //get 요청 보내기
        .then((res) => {
            code = res.data; //서버에서 생성된(입력된 번호로 발송된) 인증번호를 브라우저에 넣는다
            console.log(code); //확인용
            document.getElementById("statePhoneChk").innerText = "인증번호를 입력한 뒤 본인인증을 눌러주십시오";
        })
        .catch((error) => {
            alert("휴대폰 번호가 올바르지 않습니다.");
        })
}
function CheckCode () {
    const certNo = document.getElementById("certNo").value;
    if(certNo == code) {
        document.getElementById("statePhoneChk").innerText = "인증번호가 일치합니다";
        certPass = true; //입력된 인증번호가 서버에서 받은 인증번호와 일치할시 회원가입이 가능하게 한다.
        document.getElementById("certNo").readOnly = true;
        document.getElementById("userTel1").readOnly = true;
        document.getElementById("userTel2").readOnly = true; // 재입력 방지
    }
    else{
        document.getElementById("statePhoneChk").innerText = "인증번호가 일치하지 않습니다";
    }
}