package com.yosi.myapp.member;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface MemberDAO {
    public MemberVO loginCheck(MemberVO vo);
    public int memberInsert(MemberVO vo);
    public MemberVO findUserId(MemberVO vo);
    public MemberVO isValidEmail(MemberVO vo);
    public int findUserPwd(MemberVO vo);
    public MemberVO memberSelect(String userId);
    public int memberUpdate(MemberVO vo);
    public int memberDelete(MemberVO vo);

}
