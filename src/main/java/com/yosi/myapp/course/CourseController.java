package com.yosi.myapp.course;


import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class CourseController {
	@GetMapping("/courseCreate")
	public ModelAndView courseCreate(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		//request.setCharaterEncoding("utf-8");
		String ridingSubject = request.getParameter("ridingSubject");
        String ridingKeyword = request.getParameter("ridingKeyword");
        mav.addObject("ridingKeyword", ridingKeyword);
        mav.addObject("ridingSubject", ridingSubject);
		mav.setViewName("/course/courseCreate");
		return mav;
	}
}
