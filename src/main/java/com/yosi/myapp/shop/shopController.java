package com.yosi.myapp.shop;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class shopController {
	@GetMapping("/shopView")
	public ModelAndView courseCreate() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/shop/shopView");
		return mav;
	}
}
