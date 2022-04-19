package com.yosi.myapp.shop;

import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.yosi.myapp.aMemberPagingVO;

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

	@Override
	public List<ShopVO> shopList(ShopPagingVO sPVO) {
		return dao.shopList(sPVO);
	}

	@Override
	public List<ShopVO> shopAllSelect() {
		return dao.shopAllSelect();
	}

	@Override
	public int totalRecord(ShopPagingVO sPVO) {
		return dao.totalRecord(sPVO);
	}

	@Override
	public int shopDelete(int shopId) {
		return dao.shopDelete(shopId);
	}

}
