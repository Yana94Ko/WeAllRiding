package com.yosi.myapp.member;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface MemberDAO {
    public MemberVO loginCheck(MemberVO vo);
    public int memberInsert(MemberVO vo);

    //관리자 페이지 회원목록
    public void insertList(MemberVO vo);
    public List<MemberVO> memberList();

    public MemberVO findUserId(MemberVO vo);
    public MemberVO isValidEmail(MemberVO vo);
    public int findUserPwd(MemberVO vo);
    public MemberVO memberSelect(String userId);
    public int memberUpdate(MemberVO vo);
    public int memberDelete(MemberVO vo);
    public MemberVO checkId(MemberVO vo);
    public MemberVO checkNick(MemberVO vo);
    public MemberVO checkTel(MemberVO vo);
    public List<Map<String,String>> genderCount();
    public Map<String,String> ageCount();
}
