package com.yosi.myapp.comty;
import java.util.List;
import com.yosi.myapp.PagingVO;
public interface ComtyService {
	public List<ComtyVO> allSelect(PagingVO pVO);
	public int comtyInsert(ComtyVO vo); 
	public ComtyVO comtySelect(int comtyNo);
	public int comtyUpdate(ComtyVO vo);
	public int comtyDelete(int comtyNo, String nickname);

	public void hitCount(int comtyNo);


	public void cntHit (int comtyNo);

	//총레코드수
	public int totalRecord(PagingVO pVO);

	//관리자페이지 커뮤니티 글 목록
	public List<ComtyVO> comtyList();
}
