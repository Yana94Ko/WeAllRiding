package com.yosi.myapp.couese;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class courseController {
	@GetMapping("/courseCreate")
	public ModelAndView courseCreate() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/course/courseCreate");
		return mav;
	}
}
