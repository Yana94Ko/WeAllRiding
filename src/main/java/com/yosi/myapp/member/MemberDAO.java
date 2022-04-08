package com.yosi.myapp.member;

public interface MemberDAO {
    public MemberVO loginCheck(MemberVO vo);
    public int memberInsert(MemberVO vo);
}
