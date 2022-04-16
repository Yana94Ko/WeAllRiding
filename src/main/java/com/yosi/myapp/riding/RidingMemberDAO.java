package com.yosi.myapp.riding;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


@Mapper
@Repository
public interface RidingMemberDAO {
	public int ridingMemberInsert(RidingMemberVO vo);
}
