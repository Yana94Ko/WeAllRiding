function MemberCheck() {
   //아이디 체크
    const userid = document.getElementById("userId");
    var idCheck =  /^[A-za-z0-9]{6,15}$/g;

    if(!userid.value){
        alert("아이디를 입력하세요..");
        userid.focus();
        return false;
    }

    if(!idCheck.test(userid.value)){
        alert("아이디는 영문, 숫자 조합 6~15자를 입력해야 합니다.");
        userid.focus();
        return false;
    }
    //-----------------------아이디 체크 끝


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

    //연락처 체크
    const tel2 = document.getElementById("userTel2")
    var telCheck = /^[0-9]{4}-[0-9]{4}$/;

    if(!tel2.value){
        alert("연락처를 입력하세요");
        tel2.focus();
        return false;
    }

    if(!telCheck.test(tel2.value)){
        alert("연락처 형식에 맞게 작성해주세요.(0000-0000 하이픈 필수)");
        tel2.focus();
        return false;
    }



    const userEmail = document.getElementById("userEmail")
    var emailCheck = /^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$/;

    if(!userEmail.value){
        alert("이메일을 입력해주세요.");
        userEmail.focus();
        return false;
    }

    if(!emailCheck.test(userEmail.value)){
        alert("이메일 형식으로 입력해주세요.")
        userEmail.focus();
        return false;
    }
}