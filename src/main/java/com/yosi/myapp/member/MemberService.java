package com.yosi.myapp.member;

import org.springframework.stereotype.Service;

@Service
public interface MemberService {
    public MemberVO loginCheck(MemberVO vo);
    public int memberInsert(MemberVO vo);
}
