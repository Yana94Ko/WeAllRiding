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

	// ���� �˻�
	@GetMapping("/shopView")
	public ModelAndView shopView() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("shopVO", service.shopSelect(0));
		mav.setViewName("/shop/shopView");
		return mav;
	}
	
	// ���� ���� ���� ���� Ȯ��
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

	// ���� �߰��� ������ �Է¹��� ������
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

	// shopWrite���� �Է¹��� ���� shop DB�� �߰�
	@PostMapping("/shopWriteOk")
	public ResponseEntity<String> shopWriteOk(ShopVO shopVO, HttpServletRequest request) {
		shopVO.setShopAuthors((String) request.getSession().getAttribute("nickName"));

		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));

		try {// ���� ���� ��� ����
			service.shopInsert(shopVO);
			String msg = "<script>alert('���� ������ ��ϵǾ����ϴ�.');location.href='/shopView';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		} catch (Exception e) {// ���� ���� ��� ����
			e.printStackTrace();
			String msg = "<script>alert('���� ���� ����� �����Ͽ����ϴ�.');history.back();</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// ���� �߰��� ������ �Է¹��� ������
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

	// shopWrite���� �Է¹��� ���� shop DB�� �߰�

	@PostMapping("/shopUpdateOk")
	public ResponseEntity<String> shopUpdateOk(ShopVO shopVO, HttpServletRequest request) {
		shopVO.setShopAuthors((String) request.getSession().getAttribute("nickName"));

		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));

		try {// ���� ���� ������Ʈ ���� 
			service.shopUpdate(shopVO);
			String msg = "<script>alert('���� ������ �����Ǿ����ϴ�.');location.href='/shopView';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		} catch (Exception e) {// ���� ���� ��� ���� 
			e.printStackTrace();
			String msg = "<script>alert('���� ���� ������ �����Ͽ����ϴ�.');history.back();</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// ���� ���� �ҷ�����
	@RequestMapping("/shopInfoLoad")
	public ShopVO shopInfoLoad(int shopId) {
		return service.shopSelect(shopId);
	}
}
