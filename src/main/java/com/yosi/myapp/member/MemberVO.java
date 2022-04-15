package com.yosi.myapp.member;

public class MemberVO {
    private String userId;
    private String userPwd;
    private String userName;
    private String userTel;
    private String userTel1;
    private String userTel2;
    private String userTelP;

    public String getUserTel1() {
        return userTel1;
    }

    public void setUserTel1(String userTel1) {
        this.userTel1 = userTel1;
    }

    public String getUserTel2() {
        return userTel2;
    }

    public void setUserTel2(String userTel2) {
        this.userTel2 = userTel2;
    }

    private String birth;
    private String nickname;
    private String suspendDate;
    private String gender;
    private String userEmail;
    private String joinDate;
    private String isAdmin;
    private String experience;
    private String bicycleType;
    private String userScore;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserTel() {
        userTel = userTel1+userTel2;
        return userTel;
    }

    public void setUserTel(String userTel) {
        String[] telSp = userTel.split("[1-3]",2 ); // 합쳐진 전화번호를 앞의 세자리와 나머지로 자른다
        userTel1 = telSp[0];
        userTel2 = telSp[1];
        this.userTel = userTel;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getSuspendDate() {
        return suspendDate;
    }

    public void setSuspendDate(String suspendDate) {
        this.suspendDate = suspendDate;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(String joinDate) {
        this.joinDate = joinDate;
    }

    public String getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(String isAdmin) {
        this.isAdmin = isAdmin;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getBicycleType() {
        return bicycleType;
    }

    public void setBicycleType(String bicycleType) {
        this.bicycleType = bicycleType;
    }

    public String getUserScore() {
        return userScore;
    }

    public void setUserScore(String userScore) {
        this.userScore = userScore;
    }

    public String getUserTelP() {
        return userTelP;
    }

    public void setUserTelP(String userTelP) {
        this.userTelP = userTelP;
    }
}
