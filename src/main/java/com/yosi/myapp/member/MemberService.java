package com.yosi.myapp.member;

public interface MemberService {
    public MemberVO loginCheck(MemberVO vo);
    public int memberInsert(MemberVO vo);
    public void certifiedPhone(String userTel, int randomNumber);
}