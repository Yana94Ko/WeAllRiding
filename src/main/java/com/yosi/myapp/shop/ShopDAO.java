package com.yosi.myapp.shop;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface ShopDAO {
	public int shopCheck(int placeId);
}
