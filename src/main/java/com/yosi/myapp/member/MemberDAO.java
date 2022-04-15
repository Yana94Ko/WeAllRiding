package com.yosi.myapp.member;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface MemberDAO {
    public MemberVO loginCheck(MemberVO vo);
    public int memberInsert(MemberVO vo);

    //관리자 페이지 회원목록
    public void insertList(MemberVO vo);
    public List<MemberVO> memberList();

}
