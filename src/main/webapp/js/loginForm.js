function LogFormCheck(){
    var id = document.getElementById("userId");
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

    document.getElementById("logFrm").submit();
}