package com.yosi.myapp.shop;

import javax.inject.Inject;
import org.springframework.stereotype.Service;

@Service
public class shopServiceImpl implements shopService {
	@Inject
	ShopDAO dao;
	
	@Override
	public int shopCheck(int placeId) {
		return dao.shopCheck(placeId);
	}

}
