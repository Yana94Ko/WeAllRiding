let certPass = false; // 본인인증을 위한 변수
let idPass = false;
let nickPass = false;
function MemberCheck() {
    if(!idPass){
        alert("아이디를 확인해주세요");
        return false;
    }
    //비밀번호 체크
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
    if(!pwdCheck.test(userpwd.value)){
        alert("비밀번호는 영문, 숫자, 특수기호를 조합으로 8~25자를 입력해야합니다.");
        userpwd.focus();
        return false;
    }
    //-----------------------------------------------비밀번호 체크 끝

    //이름 체크
    const username = document.getElementById("userName")
    var nameCheck = /^[가-힣]{2,4}$/;
    if(!username.value){
        alert("이름을 입력하세요");
        username.focus();
        return false;
    }
    if(!nameCheck.test(username.value)){
        alert("한글만 입력 가능합니다.(최대 4글자)");
        username.focus();
        return false;
    }
    //--------------------------------------------------이름 끝
    if(!nickPass){
        alert("닉네임을 확인해주세요");
        return false
    }
    //연락처 체크
    const usertel2 = document.getElementById("userTel2")
    var regExp = /^[0-9]{7,8}$/;
    if(!regExp.test(usertel2.value)){
        alert("연락처 형식에 맞게 작성해주세요.");
        usertel2.focus();
        return false;
    }
    if(!certPass){
        alert("본인인증을 완료해주세요");
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
function CheckTel() {
    const userTel1 = document.getElementById("userTel1").value;
    const userTel2 = document.getElementById("userTel2").value;
    const regExp = /^[0-9]{7,8}$/;
    if(!regExp.test(userTel2)){
        document.getElementById("statePhoneChk").innerText = "연락처 형식에 맞게 입력해주세요";
        return;
    }
    const body = {
        userTel1 : userTel1,
        userTel2 : userTel2
    }
    axios.post("/member/checkTel",body)
        .then((res) => {
            if(res.data!=="") {
                document.getElementById("statePhoneChk").innerText = "이미 사용중인 휴대폰 번호입니다";
            } else {
                SendPhoneCheck();
            }
        })
}
let code = ""; // 서버에서 받게될 인증번호
function SendPhoneCheck() {
    alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호를 확인해주십시오.");
    const userTel = document.getElementById("userTel1").value+document.getElementById("userTel2").value;
    axios.get('/member/phoneCheck?userTel='+userTel) //get 요청 보내기
        .then((res) => {
            code = res.data; //서버에서 생성된(입력된 번호로 발송된) 인증번호를 브라우저에 넣는다
            document.getElementById("statePhoneChk").innerText = "인증번호를 입력한 뒤 본인인증을 눌러주십시오";
        })
        .catch((error) => {
            alert("휴대폰 번호가 올바르지 않습니다.");
        })
}
function CheckCode () {
    const certNo = document.getElementById("certNo").value;
    if(certNo == code && code!="") {
        document.getElementById("statePhoneChk").innerText = "인증번호가 일치합니다";
        document.getElementById("statePhoneChk").className = "stateOk";
        certPass = true; //입력된 인증번호가 서버에서 받은 인증번호와 일치할시 회원가입이 가능하게 한다.
        document.getElementById("certNo").readOnly = true;
        document.getElementById("userTel1").readOnly = true;
        document.getElementById("userTel2").readOnly = true; // 재입력 방지
        document.getElementById("phoneChk").disabled = true;
        document.getElementById("certChk").disabled = true;
    } else{
        document.getElementById("statePhoneChk").innerText = "인증번호가 일치하지 않습니다";
    }
}
function CheckId () {
    const userid = document.getElementById("userId").value;
    const idCheck =  /^[A-za-z0-9]{6,15}$/g;
    idPass = false;
    if(!idCheck.test(userid)){
        document.getElementById("stateIdChk").innerText = "아이디는 영문, 숫자 조합 6~15자를 입력해야 합니다.";
        document.getElementById("stateIdChk").className = "state"
        return;
    }
    const body = {
        userId : userid
    }
    axios.post("/member/checkId", body)
        .then((res) => {
            if(res.data!==""){
                document.getElementById("stateIdChk").innerText = "이미 사용중인 아이디입니다.";
                document.getElementById("stateIdChk").className = "state";
            } else {
                document.getElementById("stateIdChk").innerText = "사용 가능한 아이디입니다.";
                document.getElementById("stateIdChk").className = "stateOk";
                idPass = true;
            }
        })
        .catch((error) => {
            console.log(error)
        })
}
function CheckNick() {
    const nickname = document.getElementById("nickname").value;
    nickPass = false;
    if(!nickname){
        document.getElementById("stateNickChk").innerText = "닉네임을 입력하세요";
        document.getElementById("stateNickChk").className = "state";
        return;
    }
    if(nickname.length>10){
        document.getElementById("stateNickChk").innerText = "닉네임은 최대 10글자까지 사용가능합니다.";
        document.getElementById("stateNickChk").className = "state";
        return;
    }
    const body = {
        nickname : nickname
    }
    axios.post("/member/checkNick", body)
        .then((res) => {
            if(res.data!==""){
                document.getElementById("stateNickChk").innerText = "이미 사용중인 닉네임입니다.";
                document.getElementById("stateNickChk").className = "state";
            } else {
                document.getElementById("stateNickChk").innerText = "사용 가능한 닉네임입니다.";
                document.getElementById("stateNickChk").className = "stateOk";
                nickPass = true;
            }
        })
        .catch((error) => {
            console.log(error)
        })
}