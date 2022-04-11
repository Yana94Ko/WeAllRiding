package com.yosi.myapp.shop;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface ShopDAO {
	public int shopCheck(int shopId);
	public int shopInsert(ShopVO shopVO);
	public ShopVO shopSelect(int shopId);
	public int shopUpdate(ShopVO shopVO);
}
