package com.yosi.myapp.shop;

import java.util.List;

import com.yosi.myapp.aMemberPagingVO;

public interface ShopService {
	public int shopCheck(int shopId);
	public int shopInsert(ShopVO shopVO);
	public ShopVO shopSelect(int shopId);
	public List<ShopVO> shopList(ShopPagingVO sPVO);
	public List<ShopVO> shopAllSelect();
	public int shopUpdate(ShopVO shopVO);
	public int totalRecord(ShopPagingVO sPVO);
	public int shopDelete(int shopId);
}
