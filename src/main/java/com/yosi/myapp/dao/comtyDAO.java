package com.yosi.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.yosi.myapp.vo.comtyVO;

@Mapper
@Repository
public interface comtyDAO {
	public List<comtyVO> allSelect();
	public int comtyInsert(comtyVO vo); 
	public comtyVO comtySelect(int comtyNo);
	public int comtyUpdate(comtyVO vo);
	public int comtyDelete(int comtyNo, String nickname);
}
