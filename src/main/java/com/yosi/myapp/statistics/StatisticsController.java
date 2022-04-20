package com.yosi.myapp.statistics;

import com.yosi.myapp.member.MemberService;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/")
@Service
public class StatisticsController {
    @Autowired
    MemberService member;

    @GetMapping("statisticsMain")
    public String loginForm() {
        return "statistics/statisticsMain";
    }

    @PostMapping("genderCount")
    @ResponseBody
    public String genderCount() {
        List<Map<String,String>> list = member.genderCount();
        System.out.println(list);
        JSONArray jsonArray = new JSONArray();
        for(Map<String,String> map : list){
            jsonArray.put(map);
        }
        System.out.println(jsonArray);
        return jsonArray.toString();
    }
    @PostMapping("ageCount")
    @ResponseBody
    public String ageCount() {
        Map<String,String> map = member.ageCount();
        JSONObject jsonObject = new JSONObject(map);
        return jsonObject.toString();
    }
}