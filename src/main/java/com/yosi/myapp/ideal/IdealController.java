package com.yosi.myapp.ideal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller 
public class IdealController { 
	// 이상형월드컵
	@GetMapping("/idealView")
	public ModelAndView idealView() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/ideal/idealView");
		return mav;
	}
}
