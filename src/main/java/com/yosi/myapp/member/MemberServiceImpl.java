package com.yosi.myapp.member;

import org.springframework.beans.factory.annotation.Autowired;

public class MemberServiceImpl implements MemberService {
    @Autowired
    MemberDAO dao;
    @Override
    public MemberVO loginCheck(MemberVO vo) {
        return dao.loginCheck(vo);
    }

    @Override
    public int memberInsert(MemberVO vo) {
        return dao.memberInsert(vo);
    }

}
