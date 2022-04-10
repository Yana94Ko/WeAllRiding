package com.yosi.myapp.shop;

public interface ShopService {
	public int shopCheck(int shopId);
	public int shopInsert(ShopVO shopVO);
	public ShopVO shopSelect(int shopId);
	public int shopUpdate(ShopVO shopVO);
}
