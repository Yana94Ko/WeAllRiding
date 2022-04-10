package com.yosi.myapp.shop;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class shopController {
	//정비샵 검색
	@GetMapping("/shopView")
	public ModelAndView shopView() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/shop/shopView");
		return mav;
	}
	
	//정비샵 정보 업데이트
	@GetMapping("/shopCheck")
	public ModelAndView shopCheck(int placeId, String placeName, String placeRoadAddress, String placePhone, Model model ) {
				
		ModelAndView mav = new ModelAndView();
		
		if(result==0) {
			mav.setViewName("redirect:shopWrite");
		}else {
			mav.setViewName("redirect:shopUpdate");
		}
		return mav;
	}
}
