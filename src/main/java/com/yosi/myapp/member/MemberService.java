package com.yosi.myapp.member;

import java.util.List;

public interface MemberService {
    public MemberVO loginCheck(MemberVO vo);
    public int memberInsert(MemberVO vo);
    public void certifiedPhone(String userTel, int randomNumber);

    //관리자 페이스 리스트
    public List<MemberVO> memberList();


}
