package com.yosi.myapp.comty;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface ComtyDAO {
	public List<ComtyVO> allSelect();
	public int comtyInsert(ComtyVO vo); 
	public ComtyVO comtySelect(int comtyNo);
	public int comtyUpdate(ComtyVO vo);
	public int comtyDelete(int comtyNo, String nickname);
}
