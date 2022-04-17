package com.yosi.myapp.course;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class CourseController {
	@GetMapping("/courseCreate")
	public ModelAndView courseCreate() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/course/courseCreate");
		return mav;
	}
	@GetMapping("/courseRecommend")
	public ModelAndView courseRecommend() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/course/courseRecommend");
		return mav;
	}

}
