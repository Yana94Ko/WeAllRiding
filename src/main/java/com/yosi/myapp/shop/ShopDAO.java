package com.yosi.myapp.shop;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface ShopDAO {
	public int shopCheck(int shopId);
	public int shopInsert(ShopVO shopVO);
	public ShopVO shopSelect(int shopId);
	public List<ShopVO> shopList(ShopPagingVO sPVO);
	public List<ShopVO> shopAllSelect();
	public int shopUpdate(ShopVO shopVO);
	//총레코드수
	public int totalRecord(ShopPagingVO sPVO);
	public int shopDelete(int shopId);
}
