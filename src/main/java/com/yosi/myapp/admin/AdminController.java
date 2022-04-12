package com.yosi.myapp.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @GetMapping
    public RedirectView viewAdmin(Model model) {
        return new RedirectView("/admin/adminForm");
    }

    @Get@GetMapping
