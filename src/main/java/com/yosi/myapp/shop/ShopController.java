package com.yosi.myapp.shop;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.Charset;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class ShopController {
	@Inject
	ShopService service;

	// 정비샵 검색
	@GetMapping("/shopView")
	public ModelAndView shopView(ShopPagingVO sPVO) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("shopVO", service.shopSelect(0));
		mav.addObject("allSelect", service.shopAllSelect());
		mav.addObject("list", service.shopList(sPVO));
		mav.addObject("sPVO", sPVO);
		mav.setViewName("/shop/shopView");
		return mav;
	}
	
	// 정비샵 정보 존재 유무 확인
	@GetMapping("/shopCheck")
	public ModelAndView shopCheck(int shopId, String shopName, String shopRoadAddress, String shopPhone)
			throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();

		int result = service.shopCheck(shopId);

		String shopNameEn = URLEncoder.encode(shopName, "UTF-8");
		String shopRoadAddressEn = URLEncoder.encode(shopRoadAddress, "UTF-8");
		String shopPhoneEn = URLEncoder.encode(shopPhone, "UTF-8");

		if (result == 0) {
			mav.setViewName("redirect:shopWrite?shopId=" + shopId + "&shopName=" + shopNameEn + "&shopRoadAddress="
					+ shopRoadAddressEn + "&shopPhone=" + shopPhoneEn);
		} else {

			mav.setViewName("redirect:shopUpdate?shopId=" + shopId + "&shopName=" + shopNameEn + "&shopRoadAddress="
					+ shopRoadAddressEn + "&shopPhone=" + shopPhoneEn);
		}
		return mav;
	}

	// 정비샵 추가시 정보를 입력받을 페이지
	@GetMapping("/shopWrite")
	public ModelAndView shopWrite(int shopId, String shopName, String shopRoadAddress, String shopPhone, Model model) {
		ModelAndView mav = new ModelAndView();
		model.addAttribute("shopId", shopId);
		model.addAttribute("shopName", shopName);
		model.addAttribute("shopRoadAddress", shopRoadAddress);
		model.addAttribute("shopPhone", shopPhone);
		
		mav.setViewName("shop/shopWrite");
		return mav;
	}

	// shopWrite에서 입력받은 정보 shop DB에 추가
	@PostMapping("/shopWriteOk")
	public ResponseEntity<String> shopWriteOk(ShopVO shopVO, HttpServletRequest request) {
		shopVO.setShopAuthors((String) request.getSession().getAttribute("nickName"));
		System.out.println(shopVO.getShopAuthors()+shopVO.getShopInfo()+shopVO.getShopId()+shopVO.getShopName());
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));

		try {// 정비샵 정보 등록 성공
			service.shopInsert(shopVO);
			String msg = "<script>alert('정비샵 정보가 등록되었습니다.');location.href='/shopView';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		} catch (Exception e) {// 정비샵 정보 등록 실패
			e.printStackTrace();
			String msg = "<script>alert('정비샵 정보 등록을 실패하였습니다.');history.back();</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 정비샵 추가시 정보를 입력받을 페이지
	@GetMapping("/shopUpdate")
	public ModelAndView shopUpdate(int shopId, String shopName, String shopRoadAddress, String shopPhone, Model model) {
		ModelAndView mav = new ModelAndView();
		model.addAttribute("shopId", shopId);
		model.addAttribute("shopName", shopName);
		model.addAttribute("shopRoadAddress", shopRoadAddress);
		model.addAttribute("shopPhone", shopPhone);

		service.shopSelect(shopId);
		mav.addObject("shopVO", service.shopSelect(shopId));
		mav.setViewName("shop/shopUpdate");
		return mav;
	}

	// shopWrite에서 입력받은 정보 shop DB에 추가

	@PostMapping("/shopUpdateOk")
	public ResponseEntity<String> shopUpdateOk(ShopVO shopVO, HttpServletRequest request) {
		shopVO.setShopAuthors((String) request.getSession().getAttribute("nickName"));

		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));

		try {// 정비샵 정보 업데이트 성공 
			service.shopUpdate(shopVO);
			String msg = "<script>alert('정비샵 정보가 수정되었습니다.');location.href='/shopView';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		} catch (Exception e) {// 정비샵 정보 등록 실패 
			e.printStackTrace();
			String msg = "<script>alert('정비샵 정보 수정에 실패하였습니다.');history.back();</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 정비샵 정보 불러오기
	@RequestMapping("/shopInfoLoad")
	public ShopVO shopInfoLoad(int shopId) {
		return service.shopSelect(shopId);
	}
	
	
}