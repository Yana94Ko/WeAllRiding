package com.yosi.myapp.comty;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.yosi.myapp.PagingVO;
@Mapper
@Repository
public interface ComtyDAO {
	public List<ComtyVO> allSelect(PagingVO pVO);
	public int comtyInsert(ComtyVO vo); 
	public ComtyVO comtySelect(int comtyNo);
	public int comtyUpdate(ComtyVO vo);
	public int comtyDelete(int comtyNo, String nickname);

	public void hitCount(int comtyNo);
	public void cntHit (int comtyNo);

	//총레코드수
	public int totalRecord(PagingVO pVO);
	//관리자 페이지 커뮤니티 글 목록
	public List<ComtyVO> comtyList();
}
