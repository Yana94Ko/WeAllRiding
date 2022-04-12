package com.yosi.myapp.member;

public interface MemberService {
    public MemberVO loginCheck(MemberVO vo);
    public int memberInsert(MemberVO vo);
    public void certifiedPhone(String userTel, int randomNumber);
    public MemberVO findUserId(MemberVO vo);
    public MemberVO isValidEmail(MemberVO vo);
    public int findUserPwd(MemberVO vo);
}
