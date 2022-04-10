package com.yosi.myapp.member;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface MemberDAO {
    public MemberVO loginCheck(MemberVO vo);
    public int memberInsert(MemberVO vo);
}
