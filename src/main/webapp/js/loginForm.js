function LogFormCheck(){
    //변수 설정
    var id = document.getElementById("userId");
    var pwd= document.getElementById("userPwd");


    //입력 공백시 return false
    if(id.value==""){
        alert("아이디를 입력하세요");
        id.focus();
        return false;
    }
    if(document.querySelector("#userPwd").value==""){
        alert("비밀번호를 입력하세요.");
        document.querySelector("#userPwd").focus();
        return false;
    }

    //아이디, 비밀번호 정규표현식 작성
    var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
    var idCheck =  /^[A-za-z0-9]{6,15}$/g;

    //아이디 체크
    if(!idCheck.test(id.value)){
        alert("아이디는 영문, 숫자 조합 6~15자를 입력해야 합니다.");
        id.focus();
        return false;
    }

    //비밀번호 체크
    if(!pwdCheck.test(pwd.value)){
        alert("비밀번호는 영문, 숫자, 특수기호 조합으로 8~25자를 입력해야 합니다.");
        pwd.focus();
        return false;
    };


    document.getElementById("logFrm").submit();
}





