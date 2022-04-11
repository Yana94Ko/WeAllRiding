package com.yosi.myapp.shop;

import javax.inject.Inject;
import org.springframework.stereotype.Service;

@Service
public class ShopServiceImpl implements ShopService {
	@Inject
	ShopDAO dao;
	
	@Override
	public int shopCheck(int shopId) {
		return dao.shopCheck(shopId);
	}

	@Override
	public int shopInsert(ShopVO shopVO) {
		return dao.shopInsert(shopVO);
	}

	@Override
	public ShopVO shopSelect(int shopId) {
		return dao.shopSelect(shopId);
	}

	@Override
	public int shopUpdate(ShopVO shopVO) {
		return dao.shopUpdate(shopVO);
	}

}
